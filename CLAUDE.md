# CLAUDE.md — multi_modal 프로젝트 규칙

> 작업 시작 전 현재 브랜치 확인 후 **`handover/<branch>.md`** 를 먼저 읽을 것.
> 새 브랜치 작업 시작 시 `handover/<branch>.md` 파일을 새로 생성할 것.

## 프로젝트 개요
ESP32-S3 + FPGA(Quartus 13.1) + MCP4922 12-bit Dual DAC 기반 멀티모달 신호 발생기.
ICT / EST / Scrambler(PAIN) 세 가지 파형 모드를 DDS로 생성해 아날로그 출력.

```
Si5351 (1.024 MHz) ──→ FPGA clk
ESP32-S3 ──SPI 100kHz──→ FPGA ──SPI 512kHz──→ MCP4922 DAC ──→ Analog A/B
```

---

## 규칙

### 1. Quartus 13.1 Verilog 제약
- **2D 배열 금지**: `reg [7:0] mem [0:N][0:255]` 합성 불가 — 1D 배열 개별 선언 사용
- **SystemVerilog 문법 금지**: `always_ff`, `logic`, `interface`, `struct` 등 사용 불가
- **`generate` 블록 변수 인덱싱 금지**: `gen_inst[i].signal` 형태 참조 불가
- Verilog-2001 문법 범위 내에서만 작성할 것

### 2. ESP32 ↔ FPGA 레지스터 맵 동기화
`spi_slave_interface.v`와 `main.cpp`의 레지스터 주소는 항상 일치해야 한다.
한쪽을 변경할 때 반드시 다른 쪽도 확인하고 함께 수정할 것.

| 주소 | 레지스터 | 비트 |
|------|----------|------|
| 0x0 | control | [3:0]=main_mode, [7:4]=sub_mode, [8]=output_en |
| 0x1 | freq0   | [27:0] FTW |
| 0x2 | freq1   | [27:0] FTW |
| 0x3 | phase0  | [11:0] |
| 0x4 | phase1  | [11:0] |
| 0x5 | gain    | [7:0] |
| 0x6 | offset  | [7:0] signed |

FTW 공식: `FTW = freq_hz * 2^28 / 1_024_000`

### 3. 큰 변경 전 계획 먼저 제시
여러 파일에 걸친 변경이나 인터페이스 변경(포트 추가/삭제, 레지스터 추가 등)은
코드 작성 전에 **변경 파일 목록 + 변경 내용 요약**을 먼저 보여주고 승인 후 진행.

### 4. 주석은 한국어
기존 코드 스타일에 맞게 주석은 한국어로 작성.

