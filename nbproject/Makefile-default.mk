#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/bai2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/bai2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=hal/hal_gpio/hal_gpio.c hal/hal_pwm/hal_pwm.c sys/sys_config/sys_config.c sys/sys_tick/sys_tick.c hal/hal_uart/hal_uart.c hal/hal_adc/hal_adc.c bai3.c hal/hal_timer1/hal_timer1.c app/app_motor/app_motor.c hal/hal_extint/hal_extint.c bai2.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1 ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1 ${OBJECTDIR}/sys/sys_config/sys_config.p1 ${OBJECTDIR}/sys/sys_tick/sys_tick.p1 ${OBJECTDIR}/hal/hal_uart/hal_uart.p1 ${OBJECTDIR}/hal/hal_adc/hal_adc.p1 ${OBJECTDIR}/bai3.p1 ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1 ${OBJECTDIR}/app/app_motor/app_motor.p1 ${OBJECTDIR}/hal/hal_extint/hal_extint.p1 ${OBJECTDIR}/bai2.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1.d ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1.d ${OBJECTDIR}/sys/sys_config/sys_config.p1.d ${OBJECTDIR}/sys/sys_tick/sys_tick.p1.d ${OBJECTDIR}/hal/hal_uart/hal_uart.p1.d ${OBJECTDIR}/hal/hal_adc/hal_adc.p1.d ${OBJECTDIR}/bai3.p1.d ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1.d ${OBJECTDIR}/app/app_motor/app_motor.p1.d ${OBJECTDIR}/hal/hal_extint/hal_extint.p1.d ${OBJECTDIR}/bai2.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1 ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1 ${OBJECTDIR}/sys/sys_config/sys_config.p1 ${OBJECTDIR}/sys/sys_tick/sys_tick.p1 ${OBJECTDIR}/hal/hal_uart/hal_uart.p1 ${OBJECTDIR}/hal/hal_adc/hal_adc.p1 ${OBJECTDIR}/bai3.p1 ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1 ${OBJECTDIR}/app/app_motor/app_motor.p1 ${OBJECTDIR}/hal/hal_extint/hal_extint.p1 ${OBJECTDIR}/bai2.p1

# Source Files
SOURCEFILES=hal/hal_gpio/hal_gpio.c hal/hal_pwm/hal_pwm.c sys/sys_config/sys_config.c sys/sys_tick/sys_tick.c hal/hal_uart/hal_uart.c hal/hal_adc/hal_adc.c bai3.c hal/hal_timer1/hal_timer1.c app/app_motor/app_motor.c hal/hal_extint/hal_extint.c bai2.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/bai2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16F887
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1: hal/hal_gpio/hal_gpio.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_gpio" 
	@${RM} ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1 hal/hal_gpio/hal_gpio.c 
	@-${MV} ${OBJECTDIR}/hal/hal_gpio/hal_gpio.d ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1: hal/hal_pwm/hal_pwm.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_pwm" 
	@${RM} ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1 hal/hal_pwm/hal_pwm.c 
	@-${MV} ${OBJECTDIR}/hal/hal_pwm/hal_pwm.d ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/sys/sys_config/sys_config.p1: sys/sys_config/sys_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/sys/sys_config" 
	@${RM} ${OBJECTDIR}/sys/sys_config/sys_config.p1.d 
	@${RM} ${OBJECTDIR}/sys/sys_config/sys_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/sys/sys_config/sys_config.p1 sys/sys_config/sys_config.c 
	@-${MV} ${OBJECTDIR}/sys/sys_config/sys_config.d ${OBJECTDIR}/sys/sys_config/sys_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/sys/sys_config/sys_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/sys/sys_tick/sys_tick.p1: sys/sys_tick/sys_tick.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/sys/sys_tick" 
	@${RM} ${OBJECTDIR}/sys/sys_tick/sys_tick.p1.d 
	@${RM} ${OBJECTDIR}/sys/sys_tick/sys_tick.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/sys/sys_tick/sys_tick.p1 sys/sys_tick/sys_tick.c 
	@-${MV} ${OBJECTDIR}/sys/sys_tick/sys_tick.d ${OBJECTDIR}/sys/sys_tick/sys_tick.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/sys/sys_tick/sys_tick.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_uart/hal_uart.p1: hal/hal_uart/hal_uart.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_uart" 
	@${RM} ${OBJECTDIR}/hal/hal_uart/hal_uart.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_uart/hal_uart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_uart/hal_uart.p1 hal/hal_uart/hal_uart.c 
	@-${MV} ${OBJECTDIR}/hal/hal_uart/hal_uart.d ${OBJECTDIR}/hal/hal_uart/hal_uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_uart/hal_uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_adc/hal_adc.p1: hal/hal_adc/hal_adc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_adc" 
	@${RM} ${OBJECTDIR}/hal/hal_adc/hal_adc.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_adc/hal_adc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_adc/hal_adc.p1 hal/hal_adc/hal_adc.c 
	@-${MV} ${OBJECTDIR}/hal/hal_adc/hal_adc.d ${OBJECTDIR}/hal/hal_adc/hal_adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_adc/hal_adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/bai3.p1: bai3.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/bai3.p1.d 
	@${RM} ${OBJECTDIR}/bai3.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/bai3.p1 bai3.c 
	@-${MV} ${OBJECTDIR}/bai3.d ${OBJECTDIR}/bai3.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/bai3.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1: hal/hal_timer1/hal_timer1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_timer1" 
	@${RM} ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1 hal/hal_timer1/hal_timer1.c 
	@-${MV} ${OBJECTDIR}/hal/hal_timer1/hal_timer1.d ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/app/app_motor/app_motor.p1: app/app_motor/app_motor.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/app/app_motor" 
	@${RM} ${OBJECTDIR}/app/app_motor/app_motor.p1.d 
	@${RM} ${OBJECTDIR}/app/app_motor/app_motor.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/app/app_motor/app_motor.p1 app/app_motor/app_motor.c 
	@-${MV} ${OBJECTDIR}/app/app_motor/app_motor.d ${OBJECTDIR}/app/app_motor/app_motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/app/app_motor/app_motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_extint/hal_extint.p1: hal/hal_extint/hal_extint.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_extint" 
	@${RM} ${OBJECTDIR}/hal/hal_extint/hal_extint.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_extint/hal_extint.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_extint/hal_extint.p1 hal/hal_extint/hal_extint.c 
	@-${MV} ${OBJECTDIR}/hal/hal_extint/hal_extint.d ${OBJECTDIR}/hal/hal_extint/hal_extint.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_extint/hal_extint.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/bai2.p1: bai2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/bai2.p1.d 
	@${RM} ${OBJECTDIR}/bai2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/bai2.p1 bai2.c 
	@-${MV} ${OBJECTDIR}/bai2.d ${OBJECTDIR}/bai2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/bai2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1: hal/hal_gpio/hal_gpio.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_gpio" 
	@${RM} ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1 hal/hal_gpio/hal_gpio.c 
	@-${MV} ${OBJECTDIR}/hal/hal_gpio/hal_gpio.d ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_gpio/hal_gpio.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1: hal/hal_pwm/hal_pwm.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_pwm" 
	@${RM} ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1 hal/hal_pwm/hal_pwm.c 
	@-${MV} ${OBJECTDIR}/hal/hal_pwm/hal_pwm.d ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_pwm/hal_pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/sys/sys_config/sys_config.p1: sys/sys_config/sys_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/sys/sys_config" 
	@${RM} ${OBJECTDIR}/sys/sys_config/sys_config.p1.d 
	@${RM} ${OBJECTDIR}/sys/sys_config/sys_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/sys/sys_config/sys_config.p1 sys/sys_config/sys_config.c 
	@-${MV} ${OBJECTDIR}/sys/sys_config/sys_config.d ${OBJECTDIR}/sys/sys_config/sys_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/sys/sys_config/sys_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/sys/sys_tick/sys_tick.p1: sys/sys_tick/sys_tick.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/sys/sys_tick" 
	@${RM} ${OBJECTDIR}/sys/sys_tick/sys_tick.p1.d 
	@${RM} ${OBJECTDIR}/sys/sys_tick/sys_tick.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/sys/sys_tick/sys_tick.p1 sys/sys_tick/sys_tick.c 
	@-${MV} ${OBJECTDIR}/sys/sys_tick/sys_tick.d ${OBJECTDIR}/sys/sys_tick/sys_tick.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/sys/sys_tick/sys_tick.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_uart/hal_uart.p1: hal/hal_uart/hal_uart.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_uart" 
	@${RM} ${OBJECTDIR}/hal/hal_uart/hal_uart.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_uart/hal_uart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_uart/hal_uart.p1 hal/hal_uart/hal_uart.c 
	@-${MV} ${OBJECTDIR}/hal/hal_uart/hal_uart.d ${OBJECTDIR}/hal/hal_uart/hal_uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_uart/hal_uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_adc/hal_adc.p1: hal/hal_adc/hal_adc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_adc" 
	@${RM} ${OBJECTDIR}/hal/hal_adc/hal_adc.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_adc/hal_adc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_adc/hal_adc.p1 hal/hal_adc/hal_adc.c 
	@-${MV} ${OBJECTDIR}/hal/hal_adc/hal_adc.d ${OBJECTDIR}/hal/hal_adc/hal_adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_adc/hal_adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/bai3.p1: bai3.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/bai3.p1.d 
	@${RM} ${OBJECTDIR}/bai3.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/bai3.p1 bai3.c 
	@-${MV} ${OBJECTDIR}/bai3.d ${OBJECTDIR}/bai3.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/bai3.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1: hal/hal_timer1/hal_timer1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_timer1" 
	@${RM} ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1 hal/hal_timer1/hal_timer1.c 
	@-${MV} ${OBJECTDIR}/hal/hal_timer1/hal_timer1.d ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_timer1/hal_timer1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/app/app_motor/app_motor.p1: app/app_motor/app_motor.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/app/app_motor" 
	@${RM} ${OBJECTDIR}/app/app_motor/app_motor.p1.d 
	@${RM} ${OBJECTDIR}/app/app_motor/app_motor.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/app/app_motor/app_motor.p1 app/app_motor/app_motor.c 
	@-${MV} ${OBJECTDIR}/app/app_motor/app_motor.d ${OBJECTDIR}/app/app_motor/app_motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/app/app_motor/app_motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hal/hal_extint/hal_extint.p1: hal/hal_extint/hal_extint.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/hal/hal_extint" 
	@${RM} ${OBJECTDIR}/hal/hal_extint/hal_extint.p1.d 
	@${RM} ${OBJECTDIR}/hal/hal_extint/hal_extint.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hal/hal_extint/hal_extint.p1 hal/hal_extint/hal_extint.c 
	@-${MV} ${OBJECTDIR}/hal/hal_extint/hal_extint.d ${OBJECTDIR}/hal/hal_extint/hal_extint.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hal/hal_extint/hal_extint.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/bai2.p1: bai2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/bai2.p1.d 
	@${RM} ${OBJECTDIR}/bai2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/bai2.p1 bai2.c 
	@-${MV} ${OBJECTDIR}/bai2.d ${OBJECTDIR}/bai2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/bai2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/bai2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/bai2.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/bai2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/bai2.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/bai2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/bai2.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/bai2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
