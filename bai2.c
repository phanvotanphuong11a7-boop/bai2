//#include <xc.h>
//#include <stdint.h>
//#include <stdbool.h>
//
//#include "sys/sys_config/sys_config.h"
//#include "sys/sys_tick/sys_tick.h"
//#include "hal/hal_gpio/hal_gpio.h"
//#include "hal/hal_pwm/hal_pwm.h"
//#include "hal/hal_adc/hal_adc.h"
//#include "hal/hal_uart/hal_uart.h"
//
//
//#pragma config FOSC = HS
//#pragma config WDTE = OFF
//#pragma config PWRTE = ON
//#pragma config MCLRE = ON
//#pragma config CP = OFF
//#pragma config CPD = OFF
//#pragma config BOREN = ON
//#pragma config IESO = OFF
//#pragma config FCMEN = OFF
//#pragma config LVP = OFF
//
//#define _XTAL_FREQ 20000000UL
//
//volatile char rx_cmd = 0;
//
//
//void __interrupt() ISR(void) {
//
//    if (INTCONbits.T0IE && INTCONbits.T0IF) {
//        SysTick_Update();
//        INTCONbits.T0IF = 0;
//    }
//
//if (PIE1bits.RCIE && PIR1bits.RCIF) {
//    char temp_rx = HAL_UART_ReadChar(); // G?i hàm t? l?p HAL
//        
//    // Logic ?ng d?ng: Ch? l?u n?u không ph?i ký t? k?t thúc chu?i
//    if (temp_rx != '\n' && temp_rx != '\r') {
//       rx_cmd = temp_rx;
//    }
// }
//}
//
//int main(void) {
//    sys_config();
//    HAL_PWM_Init();
//    HAL_ADC_Init();
//    HAL_UART_Init(9600);
//    SysTick_Init();
//
//    PIE1bits.RCIE = 1;
//    INTCONbits.PEIE = 1;
//    INTCONbits.GIE = 1;
//
//    uint8_t lock_state = 0;
//    uint32_t start_time = 0;
//    bool pot_enabled = false;
//
//    bool p_bt1 = true, p_bt2 = true, p_bt3 = true, p_bt4 = true;
//    uint32_t last_uart_time = 0;
//
//    while(1) {
//        bool c_bt1 = (HAL_GPIO_ReadPin(PORT_B, PIN_3) == GPIO_LOW);
//        bool c_bt2 = (HAL_GPIO_ReadPin(PORT_B, PIN_4) == GPIO_LOW);
//        bool c_bt3 = (HAL_GPIO_ReadPin(PORT_B, PIN_5) == GPIO_LOW);
//        bool c_bt4 = (HAL_GPIO_ReadPin(PORT_B, PIN_2) == GPIO_LOW);
//        bool press_bt1 = (c_bt1 && !p_bt1);
//        bool press_bt2 = (c_bt2 && !p_bt2);
//        bool press_bt3 = (c_bt3 && !p_bt3);
//        bool press_bt4 = (c_bt4 && !p_bt4);
//
//        if (rx_cmd == 'R') {
//            lock_state = 0;
//            HAL_GPIO_WritePin(PORT_D, PIN_4, GPIO_LOW);
//            HAL_GPIO_WritePin(PORT_D, PIN_5, GPIO_LOW);
//            HAL_GPIO_WritePin(PORT_D, PIN_6, GPIO_LOW);
//            HAL_PWM_SetDuty(0);
//            pot_enabled = false;
//            rx_cmd = 0;
//        }
//
//        switch(lock_state) {
//            case 0: 
//                if (press_bt1 || rx_cmd == 'F') {
//                    lock_state = 1;
//                    start_time = SysTick_GetMs();
//                    HAL_GPIO_WritePin(PORT_D, PIN_4, GPIO_HIGH);
//                    HAL_PWM_SetDuty(1023); 
//                    pot_enabled = false;
//                    rx_cmd = 0;
//                }
//                else if (press_bt2 || rx_cmd == 'B') {
//                    lock_state = 2;
//                    start_time = SysTick_GetMs();
//                    HAL_GPIO_WritePin(PORT_D, PIN_5, GPIO_HIGH);
//                    HAL_PWM_SetDuty(1023); 
//                    pot_enabled = false;
//                    rx_cmd = 0;
//                }
//                else if (press_bt3 || rx_cmd == 'S') {
//                    lock_state = 3;
//                    start_time = SysTick_GetMs();
//                    HAL_GPIO_WritePin(PORT_D, PIN_6, GPIO_HIGH);
//                    HAL_PWM_SetDuty(1023); 
//                    pot_enabled = false;
//                    rx_cmd = 0;
//                }
//                break;
//
//            case 1: 
//
//                if (press_bt1 || rx_cmd == 'F') {
//                    start_time = SysTick_GetMs();
//                    rx_cmd = 0;
//                }
//
//                if (press_bt4 || rx_cmd == 'P') {
//                    pot_enabled = !pot_enabled;
//                    rx_cmd = 0;
//                }
//                if (pot_enabled) {
//                    HAL_PWM_SetDuty(HAL_ADC_Read(0));
//                }
//
//                if ((SysTick_GetMs() - start_time) >= 5000) {
//                    HAL_GPIO_WritePin(PORT_D, PIN_4, GPIO_LOW);
//                    HAL_PWM_SetDuty(0);
//                    lock_state = 0;
//                }
//                break;
//
//            case 2: 
//                if (press_bt2 || rx_cmd == 'B') {
//                    start_time = SysTick_GetMs();
//                    rx_cmd = 0;
//                }
//                if (press_bt4 || rx_cmd == 'P') {
//                    pot_enabled = !pot_enabled;
//                    rx_cmd = 0;
//                }
//                if (pot_enabled) {
//                    HAL_PWM_SetDuty(HAL_ADC_Read(0));
//                }
//                if ((SysTick_GetMs() - start_time) >= 5000) {
//                    HAL_GPIO_WritePin(PORT_D, PIN_5, GPIO_LOW);
//                    HAL_PWM_SetDuty(0);
//                    lock_state = 0;
//                }
//                break;
//
//            case 3: 
//                if (press_bt3 || rx_cmd == 'S') {
//                    start_time = SysTick_GetMs();
//                    rx_cmd = 0;
//                }
//                if (press_bt4 || rx_cmd == 'P') {
//                    pot_enabled = !pot_enabled;
//                    rx_cmd = 0;
//                }
//                if (pot_enabled) {
//                    HAL_PWM_SetDuty(HAL_ADC_Read(0));
//                }
//                if ((SysTick_GetMs() - start_time) >= 5000) {
//                    HAL_GPIO_WritePin(PORT_D, PIN_6, GPIO_LOW);
//                    HAL_PWM_SetDuty(0);
//                    lock_state = 0;
//                }
//                break;
//                
//            default:
//                lock_state = 0;
//                break;
//        }
//
//
//        p_bt1 = c_bt1; p_bt2 = c_bt2; p_bt3 = c_bt3; p_bt4 = c_bt4;
//
//
//        if ((SysTick_GetMs() - last_uart_time) >= 100) {
//            last_uart_time = SysTick_GetMs();
//            
//            uint16_t adc_val = HAL_ADC_Read(0);
//            uint16_t v_int = (adc_val * 5) / 1023;
//            uint16_t v_frac = ((adc_val * 500) / 1023) % 100;
//
//            HAL_UART_WriteString("ADC:"); HAL_UART_WriteInt(adc_val);
//            HAL_UART_WriteString(",VOLT:"); HAL_UART_WriteInt(v_int);
//            HAL_UART_WriteString(".");
//            if (v_frac < 10) HAL_UART_WriteString("0");
//            HAL_UART_WriteInt(v_frac);
//            
//            HAL_UART_WriteString(",LED:"); HAL_UART_WriteInt(lock_state);
//            HAL_UART_WriteString("\n");
//        }
//        
//
//        __delay_ms(20);
//    }
//}