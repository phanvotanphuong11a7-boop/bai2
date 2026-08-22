#define _XTAL_FREQ 20000000
#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

#include "sys/sys_config/sys_config.h"
#include "sys/sys_tick/sys_tick.h"
#include "hal/hal_gpio/hal_gpio.h"
#include "hal/hal_pwm/hal_pwm.h"
#include "hal/hal_adc/hal_adc.h"
#include "hal/hal_uart/hal_uart.h"
#include "hal/hal_timer1/hal_timer1.h"
#include "hal/hal_extint/hal_extint.h" 
#include "app/app_motor/app_motor.h"   

#define MOTOR_GEAR_RATIO     30       // T? s? truy?n c?a h?p gi?m t?c
#define ENCODER_PPR          11       // S? xung/vòng (Pulses Per Revolution) c?a 1 kênh
#define MEASURE_TIME_MS      500      // Th?i gian trích m?u (ms)


volatile char rx_cmd = 0;
volatile uint16_t encoder_count = 0;
volatile uint8_t timer1_100ms_ticks = 0;


volatile uint16_t saved_encoder_count = 0; 
volatile bool flag_calc_rpm = false;
uint16_t current_rpm = 0;

void __interrupt() ISR(void) {
    /* 1. Ng?t TMR0 (SysTick) */
    if (INTCONbits.T0IE && INTCONbits.T0IF) {
        SysTick_Update();
        INTCONbits.T0IF = 0;
    }
    
    /* 2. Ng?t Timer1 (L?y m?u RPM m?i 500ms) */
    if (PIE1bits.TMR1IE && PIR1bits.TMR1IF) {
        TMR1H = 0x0B; TMR1L = 0xDC; 
        timer1_100ms_ticks++;
        
        if (timer1_100ms_ticks >= (MEASURE_TIME_MS / 100)) { 
            timer1_100ms_ticks = 0;
            
            saved_encoder_count = encoder_count;
            encoder_count = 0; 
            flag_calc_rpm = true; 
        }
        PIR1bits.TMR1IF = 0;
    }
    
    /* 3. Ng?t ngoài RB0 (??m xung Encoder) */
    if (INTCONbits.INTE && INTCONbits.INTF) {
        encoder_count++;
        INTCONbits.INTF = 0;
    }

    /* 4. Ng?t Nh?n UART */
    if (PIE1bits.RCIE && PIR1bits.RCIF) {
        char temp_rx = HAL_UART_ReadChar(); 
        if (temp_rx != '\n' && temp_rx != '\r') {
            rx_cmd = temp_rx;
        }
    }
}


int main(void) {
    sys_config();
    HAL_PWM_Init();     
    HAL_PWM_CCP2_Init(); 
    HAL_ADC_Init();
    HAL_UART_Init(9600);
    SysTick_Init();
    
    HAL_Timer1_Init();       
    HAL_ExtInt_RB0_Init(); 

    PIE1bits.RCIE = 1;
    INTCONbits.PEIE = 1;
    INTCONbits.GIE = 1;

    uint8_t lock_state = 0; 


    uint16_t current_pwm = 0;
    uint32_t last_uart_time = 0;

    bool p_start = true, p_fwd = true, p_rev = true, p_brake = true;

    while(1) {
        if (flag_calc_rpm) {

            uint32_t tu_so = (uint32_t)saved_encoder_count * 60000UL;
            uint32_t mau_so = (uint32_t)ENCODER_PPR * MOTOR_GEAR_RATIO * MEASURE_TIME_MS;
            
            current_rpm = (uint16_t)(tu_so / mau_so);
            
            flag_calc_rpm = false; // Xóa c? sau khi tính xong
        }
        bool c_start = (HAL_GPIO_ReadPin(PORT_B, PIN_2) == GPIO_LOW);
        bool c_fwd   = (HAL_GPIO_ReadPin(PORT_B, PIN_3) == GPIO_LOW);
        bool c_rev   = (HAL_GPIO_ReadPin(PORT_B, PIN_4) == GPIO_LOW);
        bool c_brake = (HAL_GPIO_ReadPin(PORT_B, PIN_5) == GPIO_LOW);

        bool press_start = (c_start && !p_start);
        bool press_fwd   = (c_fwd   && !p_fwd);
        bool press_rev   = (c_rev   && !p_rev);
        bool press_brake = (c_brake && !p_brake);

        uint16_t pot_val = HAL_ADC_Read(0);

        /* MÁY TR?NG THÁI LOGIC */
        switch (lock_state) {
            case 0: /* CH?A KH?I ??NG (M?i l?nh FWD/REV/BRAKE b? vô hi?u) */
                if (press_start || rx_cmd == 'T') { /* L?nh 'T' t??ng ???ng Start */
                    lock_state = 1;
                    rx_cmd = 0;
                    HAL_UART_WriteString("LOG: He thong san sang!\n");
                }
                break;

            case 1: /* ?Ã KH?I ??NG (S?N SÀNG) - ??i FWD ho?c REV */
                if (press_fwd || rx_cmd == 'F') {
                    lock_state = 2;
                    HAL_GPIO_WritePin(PORT_D, PIN_0, GPIO_HIGH); /* IN1 = 1 */
                    HAL_GPIO_WritePin(PORT_D, PIN_1, GPIO_LOW);  /* IN2 = 0 */
                    HAL_GPIO_WritePin(PORT_D, PIN_4, GPIO_HIGH); /* LED ?? */
                    Motor_Ramp(0, pot_val);
                    current_pwm = pot_val;
                    HAL_UART_WriteString("LOG: Quay THUAN\n");
                }
                else if (press_rev || rx_cmd == 'B') {
                    lock_state = 3;
                    HAL_GPIO_WritePin(PORT_D, PIN_0, GPIO_LOW);  /* IN1 = 0 */
                    HAL_GPIO_WritePin(PORT_D, PIN_1, GPIO_HIGH); /* IN2 = 1 */
                    HAL_GPIO_WritePin(PORT_D, PIN_5, GPIO_HIGH); /* LED Xanh */
                    Motor_Ramp(0, pot_val);
                    current_pwm = pot_val;
                    HAL_UART_WriteString("LOG: Quay NGHICH\n");
                }
                break;

            case 2: /* ?ANG QUAY THU?N */
                HAL_PWM_SetDuty(pot_val);
                HAL_PWM_SetDuty_CCP2(pot_val);
                current_pwm = pot_val;

                if (press_brake || rx_cmd == 'S') {
                    lock_state = 4;
                    HAL_GPIO_WritePin(PORT_D, PIN_4, GPIO_LOW);  /* T?t ?? */
                    HAL_GPIO_WritePin(PORT_D, PIN_6, GPIO_HIGH); /* B?t Vàng */
                    
                    HAL_GPIO_WritePin(PORT_D, PIN_0, GPIO_HIGH);
                    HAL_GPIO_WritePin(PORT_D, PIN_1, GPIO_HIGH);
                    HAL_PWM_SetDuty_CCP2(1023); 
                    HAL_UART_WriteString("LOG: PHANH GAP!\n");
                }
                else if (press_rev || rx_cmd == 'B') {
                    Motor_Ramp(current_pwm, 0);
                    
                    HAL_GPIO_WritePin(PORT_D, PIN_4, GPIO_LOW);  /* T?t ?? */
                    HAL_GPIO_WritePin(PORT_D, PIN_5, GPIO_HIGH); /* B?t Xanh */
                    HAL_GPIO_WritePin(PORT_D, PIN_0, GPIO_LOW);  /* IN1=0 */
                    HAL_GPIO_WritePin(PORT_D, PIN_1, GPIO_HIGH); /* IN2=1 */
                    
                    pot_val = HAL_ADC_Read(0);
                    Motor_Ramp(0, pot_val);
                    current_pwm = pot_val;
                    lock_state = 3;
                    HAL_UART_WriteString("LOG: Dao chieu NGHICH\n");
                }
                break;

            case 3: /* ?ANG QUAY NGH?CH */
                HAL_PWM_SetDuty(pot_val);
                HAL_PWM_SetDuty_CCP2(pot_val);
                current_pwm = pot_val;

                if (press_brake || rx_cmd == 'S') {
                    lock_state = 4;
                    HAL_GPIO_WritePin(PORT_D, PIN_5, GPIO_LOW);  /* T?t Xanh */
                    HAL_GPIO_WritePin(PORT_D, PIN_6, GPIO_HIGH); /* B?t Vàng */
                    
                    HAL_GPIO_WritePin(PORT_D, PIN_0, GPIO_HIGH);
                    HAL_GPIO_WritePin(PORT_D, PIN_1, GPIO_HIGH);
                    HAL_PWM_SetDuty_CCP2(1023);
                    HAL_UART_WriteString("LOG: PHANH GAP!\n");
                }
                else if (press_fwd || rx_cmd == 'F') {
                    Motor_Ramp(current_pwm, 0);
                    
                    HAL_GPIO_WritePin(PORT_D, PIN_5, GPIO_LOW);  /* T?t Xanh */
                    HAL_GPIO_WritePin(PORT_D, PIN_4, GPIO_HIGH); /* B?t ?? */
                    HAL_GPIO_WritePin(PORT_D, PIN_0, GPIO_HIGH); /* IN1=1 */
                    HAL_GPIO_WritePin(PORT_D, PIN_1, GPIO_LOW);  /* IN2=0 */
                    
                    pot_val = HAL_ADC_Read(0);
                    Motor_Ramp(0, pot_val);
                    current_pwm = pot_val;
                    lock_state = 2;
                    HAL_UART_WriteString("LOG: Dao chieu THUAN\n");
                }
                break;

            case 4: /* ?ANG PHANH G?P */
                if (press_start || rx_cmd == 'T') {
                    lock_state = 1;
                    HAL_GPIO_WritePin(PORT_D, PIN_6, GPIO_LOW); /* T?t Vàng */
                    HAL_GPIO_WritePin(PORT_D, PIN_0, GPIO_LOW); /* Nh? phanh */
                    HAL_GPIO_WritePin(PORT_D, PIN_1, GPIO_LOW);
                    HAL_PWM_SetDuty_CCP2(0);
                    HAL_PWM_SetDuty(0);
                    HAL_UART_WriteString("LOG: Giai phong phanh. San sang.\n");
                }
                break;
        }


        p_start = c_start; p_fwd = c_fwd; p_rev = c_rev; p_brake = c_brake;

        /* G?i Packet d? li?u m?i 100ms lên MATLAB */
        if ((SysTick_GetMs() - last_uart_time) >= 100) {
            last_uart_time = SysTick_GetMs();
            
            HAL_UART_WriteString("ADC:"); HAL_UART_WriteInt(pot_val);
            HAL_UART_WriteString(",RPM:"); HAL_UART_WriteInt(current_rpm);
            HAL_UART_WriteString(",DIR:"); HAL_UART_WriteInt(lock_state);
            HAL_UART_WriteString("\n");
        }
        
        __delay_ms(20);
    }
}