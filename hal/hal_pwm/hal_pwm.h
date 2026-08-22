#ifndef HAL_PWM_H
#define HAL_PWM_H
#include <stdint.h>

void HAL_PWM_Init(void);
void HAL_PWM_SetDuty(uint16_t duty);    
void HAL_PWM_CCP2_Init(void);         
void HAL_PWM_SetDuty_CCP2(uint16_t duty); 

#endif 