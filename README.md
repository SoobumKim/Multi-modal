# multi_modal

ESP32-S3 + FPGA + MCP4922 기반 멀티모달 신호 발생기.
ICT / EST / Scrambler 파형을 DDS로 생성해 12-bit Dual DAC으로 아날로그 출력.

---

## 하드웨어 구성

| 부품 | 역할 |
|------|------|
| ESP32-S3-DevKitC-1-N16R8V | 마스터 컨트롤러, SPI 명령 전송 |
| FPGA (Altera Quartus 13.1) | DDS 파형 생성 |
| Si5351 | FPGA 클럭 공급 (16.384 MHz) |
| MCP4922 | 12-bit Dual DAC, SPI 수신 |

```
Si5351 (16.384 MHz) ──→ FPGA clk
ESP32-S3 ──SPI 100kHz──→ FPGA ──SPI 8.192MHz──→ MCP4922 ──→ Analog A/B
```

---

## 출력 모드

| main_mode | sub_mode | 설명 |
|-----------|----------|------|
| 0 (ICT) | 0 (IF) | 채널A/B 독립 사인파 |
| 0 (ICT) | 1 (LF) | 두 사인파 합성 출력 |
| 1 (EST) | 0~2 | Square / Half-Sine / Triangle |
| 2 (Scrambler) | 0~15 | PAIN 파형 16종 |

---

## SPI 레지스터 맵

| 주소 | 내용 |
|------|------|
| 0x0 | [3:0] main_mode, [7:4] sub_mode, [8] output_en |
| 0x1 | freq0 FTW (28-bit) |
| 0x2 | freq1 FTW (28-bit) |
| 0x3 | phase0 (12-bit) |
| 0x4 | phase1 (12-bit) |
| 0x5 | gain (8-bit) |
| 0x6 | offset (signed 8-bit) |

FTW 계산: `FTW = freq_hz × 2^28 / 1_024_000`

---

## 빌드

**FPGA** — Quartus 13.1, 최상위 모듈: `dds_top`

**ESP32** — PlatformIO
```
cd esp32
pio run
pio run --target upload
```

---

## 디렉토리 구조

```
esp32/          ESP32 펌웨어 (PlatformIO)
  src/
    main.cpp    SPI 명령 전송, 모드 설정
    clk_gen.cpp Si5351 클럭 제어
fpga/           FPGA RTL (Verilog)
  dds_top.v     최상위 모듈
  dds.v         DDS 엔진 (위상 누산기 + LUT + gain/offset)
  mcp4922_spi_master.v  DAC SPI 마스터
  spi_slave_interface.v ESP32 SPI 슬레이브
  mems/         파형 LUT 데이터
handover/       브랜치별 작업 인계 문서
```
