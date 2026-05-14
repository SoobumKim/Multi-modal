// si5351_ctrl.cpp
#include "clk_gen.h"

// 이 파일 안에서만 사용하는 전역 객체
static Si5351 g_si5351;

// 내부용: 주파수 설정 헬퍼 (단위: 0.01 Hz)
static bool set_clk_freq(si5351_clock clk, uint64_t freq_x100)
{
    g_si5351.set_freq(freq_x100, clk);
    return true;
}

bool si5351_init_chip()
{
    // 크리스탈 25MHz, 보정값 0
    if (!g_si5351.init(SI5351_CRYSTAL_LOAD_8PF, 25000000UL, 0)) {
        Serial.println("SI5351 init FAIL.");
        return false;
    }

    // 각 CLK 출력 구동 강도 설정 (2/4/6/8mA 중 선택)
    g_si5351.drive_strength(SI5351_CLK0, SI5351_DRIVE_4MA);
    g_si5351.drive_strength(SI5351_CLK1, SI5351_DRIVE_4MA);
    g_si5351.drive_strength(SI5351_CLK2, SI5351_DRIVE_4MA);

    return true;
}
void si5351_set_frequencies(uint8_t ch, uint64_t clk0_freq_x100)
{
    if (ch == 0){
        set_clk_freq(SI5351_CLK0, clk0_freq_x100);
    }

    else if (ch == 1){
        set_clk_freq(SI5351_CLK1, clk0_freq_x100);
    }
    
    else {
        set_clk_freq(SI5351_CLK2, clk0_freq_x100);
    }

#if 0
    // PLL 리셋으로 위상 글리치 방지
    g_si5351.pll_reset(SI5351_PLLA);
    g_si5351.pll_reset(SI5351_PLLB);
#endif

}

void si5351_enable_outputs_and_phase()
{
    // 출력 Enable
    g_si5351.output_enable(SI5351_CLK0, 1);
    g_si5351.output_enable(SI5351_CLK1, 1);
    g_si5351.output_enable(SI5351_CLK2, 1);

    // 위상 초기화
    g_si5351.set_phase(SI5351_CLK0, 0);
    g_si5351.set_phase(SI5351_CLK1, 0);
    g_si5351.set_phase(SI5351_CLK2, 0);

    delay(100);
}

void si5351_disable_output() {
    g_si5351.output_enable(SI5351_CLK0, 0);
    g_si5351.output_enable(SI5351_CLK1, 0);
    g_si5351.output_enable(SI5351_CLK2, 0);
}

Si5351& si5351_get_instance()
{
    return g_si5351;
}
