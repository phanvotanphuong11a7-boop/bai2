#include "app_motor.h"
#include "../../hal/hal_pwm/hal_pwm.h" // C?n g?i l?p HAL PWM ?? ?i?u khi?n
#include <xc.h>

// ??nh ngh?a th?ch anh ?? dùng ???c hàm __delay_ms
#ifndef _XTAL_FREQ
#define _XTAL_FREQ 20000000 
#endif

void Motor_Ramp(uint16_t start_duty, uint16_t target_duty) {
    if (start_duty < target_duty) {
        for (uint16_t i = start_duty; i <= target_duty; i += 5) {
            HAL_PWM_SetDuty(i);      /* ?? sáng LED t?ng d?n */
            HAL_PWM_SetDuty_CCP2(i); /* V?n t?c t?ng d?n */
            __delay_ms(3);
        }
    } else {
        for (uint16_t i = start_duty; i > target_duty; i -= 5) {
            HAL_PWM_SetDuty(i);
            HAL_PWM_SetDuty_CCP2(i);
            __delay_ms(3);
            if (i < 5) break; 
        }
    }
    HAL_PWM_SetDuty(target_duty);
    HAL_PWM_SetDuty_CCP2(target_duty);
}