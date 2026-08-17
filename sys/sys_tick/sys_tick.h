#ifndef SYS_TICK_H
#define SYS_TICK_H
#include <stdint.h>

void SysTick_Init(void);
void SysTick_Update(void);
uint32_t SysTick_GetMs(void);

#endif /* SYS_TICK_H */