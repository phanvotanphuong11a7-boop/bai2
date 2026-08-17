#include "hal_gpio.h"
#include <xc.h> 

void HAL_GPIO_SetDirection(gpio_port_t port, gpio_pin_t pin, gpio_dir_t dir) {
    switch (port) {
        case PORT_A: 
            if (pin >= 0 && pin <= 3) { ANSEL &= ~(1 << pin); } 
            else if (pin == 5) { ANSEL &= ~(1 << 4); }
            if (dir == GPIO_DIR_INPUT) { TRISA |= (1 << pin); } 
            else { TRISA &= ~(1 << pin); }
            break;
            
        case PORT_B: 
            if      (pin == 0) ANSELH &= ~(1 << 4); 
            else if (pin == 1) ANSELH &= ~(1 << 2); 
            else if (pin == 2) ANSELH &= ~(1 << 0); 
            else if (pin == 3) ANSELH &= ~(1 << 1); 
            else if (pin == 4) ANSELH &= ~(1 << 3); 
            else if (pin == 5) ANSELH &= ~(1 << 5); 
            
            if (dir == GPIO_DIR_INPUT) { TRISB |= (1 << pin); } 
            else { TRISB &= ~(1 << pin); }
            break;
            
        case PORT_C: 
            if (dir == GPIO_DIR_INPUT) { TRISC |= (1 << pin); } 
            else { TRISC &= ~(1 << pin); }
            break;
            
        case PORT_D: 
            if (dir == GPIO_DIR_INPUT) { TRISD |= (1 << pin); } 
            else { TRISD &= ~(1 << pin); }
            break;
            
        case PORT_E: 
            if (pin >= 0 && pin <= 2) { ANSEL &= ~(1 << (pin + 5)); }
            if (dir == GPIO_DIR_INPUT) { TRISE |= (1 << pin); } 
            else { TRISE &= ~(1 << pin); }
            break;
            
        default: 
            break;
    }
}

void HAL_GPIO_PullUpEnable(gpio_pin_t pin) {
    OPTION_REGbits.nRBPU = 0;
    WPUB |= (1 << pin); 
}

void HAL_GPIO_WritePin(gpio_port_t port, gpio_pin_t pin, gpio_state_t state) {
    switch (port) {
        case PORT_A:
            if (state == GPIO_HIGH) PORTA |= (1 << pin);
            else PORTA &= ~(1 << pin);
            break;
        case PORT_B:
            if (state == GPIO_HIGH) PORTB |= (1 << pin);
            else PORTB &= ~(1 << pin);
            break;
        case PORT_C:
            if (state == GPIO_HIGH) PORTC |= (1 << pin);
            else PORTC &= ~(1 << pin);
            break;
        case PORT_D:
            if (state == GPIO_HIGH) PORTD |= (1 << pin);
            else PORTD &= ~(1 << pin);
            break;
        case PORT_E:
            if (state == GPIO_HIGH) PORTE |= (1 << pin);
            else PORTE &= ~(1 << pin);
            break;
        default: 
            break;
    }
}

gpio_state_t HAL_GPIO_ReadPin(gpio_port_t port, gpio_pin_t pin) {
    bool bit_status = false;
    switch (port) {
        case PORT_A: bit_status = (PORTA & (1 << pin)) ? true : false; break;
        case PORT_B: bit_status = (PORTB & (1 << pin)) ? true : false; break;
        case PORT_C: bit_status = (PORTC & (1 << pin)) ? true : false; break;
        case PORT_D: bit_status = (PORTD & (1 << pin)) ? true : false; break;
        case PORT_E: bit_status = (PORTE & (1 << pin)) ? true : false; break;
        default: return GPIO_LOW; 
    }
    return bit_status ? GPIO_HIGH : GPIO_LOW;
}