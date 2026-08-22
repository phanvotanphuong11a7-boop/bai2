#include "sys_config.h"
#include <xc.h> 
#include "../../hal/hal_gpio/hal_gpio.h"

void sys_config(void) {
    /* Vô hi?u hóa ng?t toàn c?c khi kh?i t?o c?ng */
    INTCONbits.GIE = 0;  
    INTCONbits.PEIE = 0; 

    /* OUTPUT d? án c? */
    HAL_GPIO_SetDirection(PORT_D, PIN_2, GPIO_DIR_OUTPUT);
    HAL_GPIO_SetDirection(PORT_D, PIN_3, GPIO_DIR_OUTPUT);
    HAL_GPIO_SetDirection(PORT_D, PIN_7, GPIO_DIR_OUTPUT);
    HAL_GPIO_WritePin(PORT_D, PIN_2, GPIO_LOW);
    HAL_GPIO_WritePin(PORT_D, PIN_3, GPIO_LOW);
    HAL_GPIO_WritePin(PORT_D, PIN_7, GPIO_LOW);

    /* OUTPUT d? án m?i (N?i v?i các PC817 s? 2, 3, 4) */
    HAL_GPIO_SetDirection(PORT_D, PIN_4, GPIO_DIR_OUTPUT);
    HAL_GPIO_SetDirection(PORT_D, PIN_5, GPIO_DIR_OUTPUT);
    HAL_GPIO_SetDirection(PORT_D, PIN_6, GPIO_DIR_OUTPUT);
    HAL_GPIO_WritePin(PORT_D, PIN_4, GPIO_LOW);
    HAL_GPIO_WritePin(PORT_D, PIN_5, GPIO_LOW);
    HAL_GPIO_WritePin(PORT_D, PIN_6, GPIO_LOW);

    /* INPUT 4 nút nh?n có s? d?ng tr? n?i Pull-Up */
    HAL_GPIO_SetDirection(PORT_B, PIN_2, GPIO_DIR_INPUT); HAL_GPIO_PullUpEnable(PIN_2);
    HAL_GPIO_SetDirection(PORT_B, PIN_3, GPIO_DIR_INPUT); HAL_GPIO_PullUpEnable(PIN_3);
    HAL_GPIO_SetDirection(PORT_B, PIN_4, GPIO_DIR_INPUT); HAL_GPIO_PullUpEnable(PIN_4);
    HAL_GPIO_SetDirection(PORT_B, PIN_5, GPIO_DIR_INPUT); HAL_GPIO_PullUpEnable(PIN_5);
    
    /* OUTPUT BÀI 3: ?i?u khi?n L298N (RD0=IN1, RD1=IN2, RC1=ENA/CCP2) */
    HAL_GPIO_SetDirection(PORT_D, PIN_0, GPIO_DIR_OUTPUT);
    HAL_GPIO_SetDirection(PORT_D, PIN_1, GPIO_DIR_OUTPUT);
    HAL_GPIO_SetDirection(PORT_C, PIN_1, GPIO_DIR_OUTPUT);
    
    HAL_GPIO_WritePin(PORT_D, PIN_0, GPIO_LOW);
    HAL_GPIO_WritePin(PORT_D, PIN_1, GPIO_LOW);
    HAL_GPIO_WritePin(PORT_C, PIN_1, GPIO_LOW);

    /* INPUT BÀI 3: Kênh A (RB0) và Kênh B (RB1) c?a Encoder */
    HAL_GPIO_SetDirection(PORT_B, PIN_0, GPIO_DIR_INPUT);
    HAL_GPIO_SetDirection(PORT_B, PIN_1, GPIO_DIR_INPUT);
    
    /* Vô hi?u hóa tính n?ng Analog trên RB0 (AN12) và RB1 (AN10) ?? ??c tín hi?u s? */
    ANSELHbits.ANS12 = 0; 
    ANSELHbits.ANS10 = 0;
}