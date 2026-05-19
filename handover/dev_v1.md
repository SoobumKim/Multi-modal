# Handover — dev_v1

> 작업 완료 시 이 파일을 업데이트한다.
> 새 대화 시작 시 이 파일을 먼저 읽으면 바로 이어서 작업 가능.

---

## 마지막 작업 (2026-05-19)

**ESP32 main.cpp 리팩토링 진행 중 (미완료)**

### 완료
- 사용 안 하는 전역변수 제거 (`step`, `freq0_hz`, `mode`, `sub_mode`)
- `fpgaSetScrambler` 정리: 존재하지 않는 레지스터 `0x8` 제거, `pause_id`/`packet_duration` 파라미터 제거

### 미완료 (다음 작업)
- [ ] `esp32/src/main.cpp` — `setup()` 데드 주석 코드 3줄 정리
- [ ] `esp32/src/main.cpp` — `loop()` 주석 오타 ("EST HALF_SINE 테스트"가 TRIANGLE에 중복)
- [ ] 레거시 파일 삭제: `fpga/tt_um_tinydds.v`, `fpga/test.v`, `fpga/prng.v`
- [ ] pre-commit 설정 (trailing-whitespace, clang-format, cppcheck, iverilog 문법 체크, default_nettype none 체크)
