#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include "clk_gen.h"

#define I2C_SDA_PIN 8
#define I2C_SCL_PIN 7

static constexpr int PIN_FPGA_RST = 4;
static constexpr int PIN_SPI_CS   = 10;
static constexpr int PIN_SPI_MOSI = 11;
static constexpr int PIN_SPI_SCK  = 12;

static constexpr uint8_t FPGA_GAIN_MAX = 0xFF;
static constexpr uint32_t FPGA_CLK_HZ  = 1024000;   // DDS 유효 샘플레이트 (FTW 계산 기준)
static constexpr uint32_t FPGA_SYS_HZ  = 16384000;  // FPGA 시스템 클럭 (16 × 1.024 MHz)

SPIClass spi(FSPI);

void fpgaWrite32(uint32_t data)
{
    spi.beginTransaction(SPISettings(100000, MSBFIRST, SPI_MODE0));

    digitalWrite(PIN_SPI_CS, LOW);
    delayMicroseconds(1);

    spi.transfer((data >> 24) & 0xFF);
    spi.transfer((data >> 16) & 0xFF);
    spi.transfer((data >>  8) & 0xFF);
    spi.transfer((data >>  0) & 0xFF);

    delayMicroseconds(1);
    digitalWrite(PIN_SPI_CS, HIGH);

    spi.endTransaction();

    delayMicroseconds(5);
}

uint32_t calcFTW(float freq_hz) {
    // FTW = freq * 2^28 / Fclk
    return (uint32_t)((freq_hz * (1UL << 28)) / FPGA_CLK_HZ);
}

// ── SPI 레지스터 쓰기 헬퍼 ───────────────────────────────────
// addr: 상위 4비트, data: 하위 28비트
void fpgaWriteReg(uint8_t addr, uint32_t data) {
    uint32_t packet = ((uint32_t)(addr & 0xF) << 28) | (data & 0x0FFFFFFF);
    fpgaWrite32(packet);
}

void fpgaReset()
{
    digitalWrite(PIN_FPGA_RST, LOW);
    delay(10);
    digitalWrite(PIN_FPGA_RST, HIGH);
    delay(10);
}

enum FpgaMainMode {
    FPGA_MODE_ICT       = 0,
    FPGA_MODE_EST       = 1,
    FPGA_MODE_SCRAMBLER = 2,
};

enum ICTMode {
    ICT_IF = 0,
    ICT_LF = 1,
};

enum EstWaveform {
    EST_SQUARE    = 0,
    EST_HALF_SINE = 1,
    EST_TRIANGLE  = 2,
};

void fpgaSetControl(uint8_t main_mode, uint8_t sub_mode, bool output_enable)
{
    uint32_t data = 0;

    data |= (main_mode & 0x0F);
    data |= ((sub_mode & 0x0F) << 4);

    if (output_enable) {
        data |= (1UL << 8);
    }

    fpgaWriteReg(0x0, data);
}

void fpgaSetICTMode(uint8_t ict_mode,
                    float freq0_hz,
                    float freq1_hz,
                    uint8_t gain)
{
    uint32_t ftw0 = calcFTW(freq0_hz);
    uint32_t ftw1 = calcFTW(freq1_hz);

    fpgaWriteReg(0x1, ftw0);   // 4 kHz
    fpgaWriteReg(0x2, ftw1);   // 4~4.2 kHz
    fpgaWriteReg(0x5, gain);

    fpgaSetControl(FPGA_MODE_ICT, ict_mode, true);
}

void fpgaSetEstMode(uint8_t est_waveform, float freq_hz, uint8_t gain)
{
    uint32_t ftw = calcFTW(freq_hz);

    fpgaWriteReg(0x1, ftw);
    fpgaWriteReg(0x5, gain);

    fpgaSetControl(FPGA_MODE_EST, est_waveform, true);
}

void fpgaSetScrambler(uint8_t waveform_id, float freq_hz, uint8_t gain)
{
    fpgaWriteReg(0x1, calcFTW(freq_hz));
    fpgaWriteReg(0x5, gain);
    fpgaSetControl(FPGA_MODE_SCRAMBLER, waveform_id, true);
}

void setup()
{
    Serial.begin(115200);
    delay(2000);  // 시리얼 안정화 대기 늘리기
    Serial.println("setup start");  // 이게 나오는지 확인

    Wire.begin(I2C_SDA_PIN, I2C_SCL_PIN);
    Serial.println("I2C init done");  // 이게 나오는지 확인

    if (!si5351_init_chip()) {
        Serial.println("Si5351 init failed");  // 여기서 멈추는지 확인
        while (1) {
            delay(1000);
        }
    }
    Serial.println("Si5351 init done");  // 여기까지 오는지 확인

    // 16.384 MHz (16 × 1.024 MHz) — DDS clk_en ÷16 → 유효 1.024 MHz
    uint64_t freq_var = (uint64_t)FPGA_SYS_HZ * 100ULL;
    si5351_set_frequencies(0, freq_var);
    si5351_enable_outputs_and_phase();
    delay(20);  // Si5351 PLL 락 대기

    pinMode(PIN_FPGA_RST, OUTPUT);
    pinMode(PIN_SPI_CS, OUTPUT);

    digitalWrite(PIN_SPI_CS, HIGH);
    digitalWrite(PIN_FPGA_RST, HIGH);

    spi.begin(PIN_SPI_SCK, -1, PIN_SPI_MOSI, PIN_SPI_CS);

    fpgaReset();

    // // 1) mode = 0 → 사인파 출력
    // fpgaWriteReg(0x0, 0x00);

    // 2) gain = 0xFF → 최대 진폭
    fpgaWriteReg(0x5, FPGA_GAIN_MAX);

    // 3) offset = 0x00 → DC offset 없음 (signed 0)
    fpgaWriteReg(0x6, 0x00);

    // 4) phase0 = 0 → 위상 오프셋 없음
    fpgaWriteReg(0x3, 0x000);

    // // 5) freq0: 원하는 출력 주파수 설정
    // fpgaWriteReg(0x1, ftw_fix);

    Serial.println("Fixed sine test start");
}

void loop()
{
    // ICT IF 모드 테스트 (4kHz + 4.2kHz 각각 출력)
    // fpgaSetICTMode(ICT_IF, 4000.0, 4200.0, FPGA_GAIN_MAX);
    // delay(3000);

    // // ICT LF 모드 테스트 (합성파)
    // fpgaSetICTMode(ICT_LF, 4000.0, 4200.0, FPGA_GAIN_MAX);
    // delay(3000);

    // // EST SQUARE 테스트
    // fpgaSetEstMode(EST_SQUARE, 4000.0, FPGA_GAIN_MAX);
    // delay(3000);

    // // EST HALF_SINE 테스트
    // fpgaSetEstMode(EST_HALF_SINE, 4000.0, FPGA_GAIN_MAX);
    // delay(3000);

    // // EST TRIANGLE 테스트
    // fpgaSetEstMode(EST_TRIANGLE, 4000.0, FPGA_GAIN_MAX);
    // delay(3000);

    for (int i = 0; i < 16; i++) {
        fpgaSetScrambler(i, 4000.0, FPGA_GAIN_MAX);
        delay(3000);
    }

}