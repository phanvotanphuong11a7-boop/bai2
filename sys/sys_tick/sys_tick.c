#include "sys_tick.h"
#include <xc.h>

volatile uint32_t sys_tick_ms = 0;
volatile uint8_t tick_02ms = 0;

void SysTick_Init(void) {
    /* Ngu?n n?i Fosc/4, Gán cho Timer0, Prescaler = 4 */
    OPTION_REGbits.T0CS = 0;
    OPTION_REGbits.PSA = 0;
    OPTION_REGbits.PS2 = 0;
    OPTION_REGbits.PS1 = 0;
    OPTION_REGbits.PS0 = 1;
    
    TMR0 = 6; /* 256 - 250 = 6 */
    INTCONbits.T0IE = 1;
}

void SysTick_Update(void) {
    TMR0 = 6; /* Thi?t l?p l?i ?i?m b?t ??u */
    tick_02ms++;
    
    if (tick_02ms >= 5) {
        sys_tick_ms++;
        tick_02ms = 0;
    }
}

uint32_t SysTick_GetMs(void) {
    return sys_tick_ms;
}