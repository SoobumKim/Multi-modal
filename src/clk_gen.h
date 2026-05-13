// si5351_ctrl.h
#pragma once

#include <si5351.h>

// SI5351 초기화
bool si5351_init_chip();

// 세 개의 CLK 주파수 설정
//  - clk0_freq_x100 : CLK0 주파수 (Hz * 100)
//  - 나머지 CLK1, CLK2는 내부에서 고정값으로 설정
void si5351_set_frequencies(uint8_t ch, uint64_t clk0_freq_x100);

// 출력 Enable 및 위상 초기화
void si5351_enable_outputs_and_phase();

void si5351_disable_output();

// 필요하면 원본 객체를 가져다 쓸 수 있도록 (선택 사항)
// 사용 안 할 거면 선언/정의 둘 다 지워도 됨
Si5351& si5351_get_instance();

