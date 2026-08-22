#ifndef HAL_UART_H
#define HAL_UART_H
#include <stdint.h>

void HAL_UART_Init(uint32_t baud_rate);
void HAL_UART_WriteChar(char bt);
void HAL_UART_WriteString(const char* str);
void HAL_UART_WriteInt(uint16_t val);
char HAL_UART_ReadChar(void);
#endif /* HAL_UART_H */