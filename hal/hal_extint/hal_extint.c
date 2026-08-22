/* --- hal_extint.c --- */
#include "hal_extint.h"
#include <xc.h>

void HAL_ExtInt_RB0_Init(void) {
    OPTION_REGbits.INTEDG = 1; /* Ng?t c?nh lên t?i RB0 */
    INTCONbits.INTE = 1;       /* Kích ho?t ng?t ngoài */
}