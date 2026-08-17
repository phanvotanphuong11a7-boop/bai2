#include "hal_pwm.h"
#include <xc.h>

#define _XTAL_FREQ 20000000UL 
#define PWM_FREQ 5000UL
#define TMR2PRESCALE 4

void HAL_PWM_Init(void) {
    PR2 = (_XTAL_FREQ / (PWM_FREQ * 4 * TMR2PRESCALE)) - 1; 
    
    CCP1CONbits.CCP1M3 = 1;
    CCP1CONbits.CCP1M2 = 1; 
    
    T2CONbits.T2CKPS1 = 0;
    T2CONbits.T2CKPS0 = 1; /* C?u hình Prescaler Timer2 là 4 */
    
    T2CONbits.TMR2ON = 1; 
    TRISCbits.TRISC2 = 0; 
}

void HAL_PWM_SetDuty(uint16_t duty) {
    if (duty > 1023) { duty = 1023; }
    
    /* Ánh x? s? nguyên: T?i 20MHz/5KHz/PS4, PR2 = 249 => Max Duty = 1000 */
    uint32_t mapped_duty = ((uint32_t)duty * 1000) / 1023;
    
    CCP1CONbits.DC1B1 = (mapped_duty & 2) ? 1 : 0; 
    CCP1CONbits.DC1B0 = (mapped_duty & 1) ? 1 : 0; 
    CCPR1L = (uint8_t)(mapped_duty >> 2); 
}