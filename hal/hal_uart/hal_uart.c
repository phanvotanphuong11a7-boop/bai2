#include "hal_uart.h"
#include <xc.h>

#define _XTAL_FREQ 20000000

void HAL_UART_Init(uint32_t baud_rate) {
    TRISCbits.TRISC6 = 0; 
    TRISCbits.TRISC7 = 1; 
    
    SPBRG = (uint8_t)((_XTAL_FREQ / 16) / baud_rate) - 1;
    
    TXSTAbits.BRGH = 1;  
    TXSTAbits.SYNC = 0;  
    RCSTAbits.SPEN = 1;  
    
    TXSTAbits.TXEN = 1;  
    RCSTAbits.CREN = 1;  
    
    TXSTAbits.TX9 = 0;   
    RCSTAbits.RX9 = 0;   
}

void HAL_UART_WriteChar(char bt) {
    while (!TXSTAbits.TRMT); 
    TXREG = bt; 
}

void HAL_UART_WriteString(const char* str) {
    while (*str) {
        HAL_UART_WriteChar(*str++);
    }
}

void HAL_UART_WriteInt(uint16_t val) {
    char buffer[6];
    int i = 0, j;
    
    if (val == 0) {
        HAL_UART_WriteChar('0');
        return;
    }
    
    while (val > 0) {
        buffer[i++] = (val % 10) + '0';
        val /= 10;
    }
    
    for (j = i - 1; j >= 0; j--) {
        HAL_UART_WriteChar(buffer[j]);
    }
}