#ifndef APP_MOTOR_H
#define APP_MOTOR_H

#include <stdint.h>

/* Hàm t?ng/gi?m t?c ?? m??t mà */
void Motor_Ramp(uint16_t start_duty, uint16_t target_duty);

#endif /* APP_MOTOR_H */