#include "hal_adc.h"
#include <xc.h>

#define _XTAL_FREQ 20000000UL

void HAL_ADC_Init(void) {
    ADCON0 = 0b10000001; /* Fosc/32, Ch?n m?c ??nh AN0, Kích ho?t ADC */
    ADCON1 = 0b10000000; /* K?t qu? c?n ph?i (Right Justify) */
}

uint16_t HAL_ADC_Read(uint8_t channel) {
    if (channel > 13) return 0;
    
    ADCON0 &= 0b11000011; 
    ADCON0 |= (channel << 2); 
    
    __delay_us(20); 
    ADCON0bits.GO_nDONE = 1; 
    
    while (ADCON0bits.GO_nDONE); 
    return (((uint16_t)ADRESH << 8) + ADRESL); 
}