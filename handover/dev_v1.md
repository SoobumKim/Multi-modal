# Handover — dev_v1

> 작업 완료 시 이 파일을 업데이트한다.
> 새 대화 시작 시 이 파일을 먼저 읽으면 바로 이어서 작업 가능.

---

## 마지막 작업 (2026-05-19)

### 완료

**MCP4922 SPI DAC 클럭 구조 변경**
- FPGA 시스템 클럭: 1.024 MHz → **16.384 MHz** (Si5351 CLK0)
- `dds_top.v`: 4비트 카운터(÷16)로 `dds_ce` 생성 → DDS 유효 레이트 1.024 MHz 유지
- `dds.v`: `clk_en` 포트 추가, 모든 sequential 블록에 `clk_en` 게이팅 적용
- `mcp4922_spi_master.v`: clk_div 방식 전면 재설계
  - SCK_LOW / SCK_HIGH 스테이트로 명확히 분리 (clk_div 제거)
  - TRAIL 스테이트 추가: 마지막 비트 후 SCK=0 (t_CSH 확보)
  - LDAC2 스테이트 추가: LDAC 2 cycle = 122 ns > 100 ns min
  - SPI 클럭 8.192 MHz, DAC 업데이트 ~227 kHz
- `main.cpp`: Si5351 CLK0 주파수 16.384 MHz로 변경, `FPGA_SYS_HZ` 상수 추가
- `calcFTW`의 `FPGA_CLK_HZ = 1024000` 그대로 유지 (유효 DDS 샘플레이트 기준)

**이전 리팩토링 (미완료 → 다음 작업)**
- 사용 안 하는 전역변수 제거 (`step`, `freq0_hz`, `mode`, `sub_mode`) ✓
- `fpgaSetScrambler` 정리 ✓

### 미완료 (다음 작업)
- [ ] `esp32/src/main.cpp` — `setup()` 데드 주석 코드 3줄 정리
- [ ] `esp32/src/main.cpp` — `loop()` 주석 오타 ("EST HALF_SINE 테스트"가 TRIANGLE에 중복)
- [ ] 레거시 파일 삭제: `fpga/tt_um_tinydds.v`, `fpga/test.v`, `fpga/prng.v`
- [ ] pre-commit 설정 (trailing-whitespace, clang-format, cppcheck, iverilog 문법 체크, default_nettype none 체크)
- [ ] 실제 배선 검토 후 핀 연결 확인
