/* --- hal_timer1.c --- */
#include "hal_timer1.h"
#include <xc.h>

void HAL_Timer1_Init(void) {
    T1CONbits.TMR1CS = 0;   /* Xung nh?p n?i */
    T1CONbits.T1CKPS = 0b11;/* Prescaler 1:8 */
    
    TMR1H = 0x0B;
    TMR1L = 0xDC;
    
    T1CONbits.TMR1ON = 1;   /* B?t Timer 1 */
    PIE1bits.TMR1IE = 1;    /* Kích ho?t ng?t Timer 1 */
}