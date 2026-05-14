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

static constexpr uint32_t FPGA_CLK_HZ = 1024000;

static float step = 10.0f;   // 10Hz씩 변경
static float f = 4000.0f;   // 10Hz씩 변경

SPIClass spi(FSPI);

void fpgaWrite32(uint32_t data)
{
    spi.beginTransaction(SPISettings(100000, MSBFIRST, SPI_MODE0));  // 100kHz로 낮추기
    digitalWrite(PIN_SPI_CS, LOW);

    spi.transfer((data >> 24) & 0xFF);
    spi.transfer((data >> 16) & 0xFF);
    spi.transfer((data >>  8) & 0xFF);
    spi.transfer((data >>  0) & 0xFF);

    spi.endTransaction();
    digitalWrite(PIN_SPI_CS, HIGH);
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

uint32_t ftw_fix = calcFTW(50.0f);  // test p1
uint32_t ftw = calcFTW(f);  // 4 kHz 사인파

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

    // 1024 kHz
    uint64_t freq_var = 1024000ULL * 100ULL;
    si5351_set_frequencies(0, freq_var);
    si5351_enable_outputs_and_phase();

    pinMode(PIN_FPGA_RST, OUTPUT);
    pinMode(PIN_SPI_CS, OUTPUT);

    digitalWrite(PIN_SPI_CS, HIGH);
    digitalWrite(PIN_FPGA_RST, HIGH);

    spi.begin(PIN_SPI_SCK, -1, PIN_SPI_MOSI, PIN_SPI_CS);

    fpgaReset();

    // 1) mode = 0 → 사인파 출력
    fpgaWriteReg(0x0, 0x00);

    // 2) gain = 0xFF → 최대 진폭
    fpgaWriteReg(0x5, 0xFF);

    // 3) offset = 0x00 → DC offset 없음 (signed 0)
    fpgaWriteReg(0x6, 0x00);

    // 4) phase0 = 0 → 위상 오프셋 없음
    fpgaWriteReg(0x3, 0x000);

    // 5) freq0: 원하는 출력 주파수 설정
    fpgaWriteReg(0x1, ftw_fix);
}

void loop()
{
    fpgaWriteReg(0x1, ftw_fix);
    // ftw = calcFTW(f);  
    // fpgaWriteReg(0x2, ftw);

    // f += step;

    // if (f >= 5000.0f) {
    //     f = 5000.0f;
    //     step = -step;
    // }
    // else if (f <= 4200.0f) {
    //     f = 4200.0f;
    //     step = -step;
    // }

    // delay(100);   // 0.1초마다 주파수 변경
}