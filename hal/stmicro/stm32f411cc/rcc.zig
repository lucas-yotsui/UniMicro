const ResetAndClockControl = packed struct {
    /// RCC clock control register
    CR: packed struct(u32) {
        /// Internal high-speed clock enable
        ///
        /// Set and cleared by software.
        ///
        /// Set by hardware to force the HSI oscillator ON when leaving the Stop or Standby mode or in case of a failure of the HSE oscillator used directly or indirectly as the system clock. This bit cannot be cleared if the HSI is used directly or indirectly as the system clock.
        HSION: enum(u1) {
            /// HSI oscillator OFF
            HSI_OFF = 0,
            /// HSI oscillator ON
            HSI_ON = 1,
        },
        /// Internal high-speed clock ready flag
        ///
        /// Set by hardware to indicate that the HSI oscillator is stable.
        ///
        /// After the HSION bit is cleared, HSIRDY goes low after 6 HSI clock cycles.
        HSIRDY: enum(u1) {
            /// HSI oscillator not ready
            HSI_NOT_READY = 0,
            /// HSI oscillator ready
            HSI_READY = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u1,
        /// Internal high-speed clock trimming
        ///
        /// These bits provide an additional user-programmable trimming value that is added to the HSICAL[7:0] bits. It can be programmed to adjust to variations in voltage and temperature that influence the frequency of the internal HSI RC.
        HSITRIM: u5,
        /// Internal high-speed clock calibration
        ///
        /// These bits are initialized automatically at startup.
        HSICAL: u8,
        /// HSE clock enable
        ///
        /// Set and cleared by software.
        ///
        /// Cleared by hardware to stop the HSE oscillator when entering Stop or Standby mode. This bit cannot be reset if the HSE oscillator is used directly or indirectly as the system clock.
        HSEON: enum(u1) {
            /// HSE oscillator not ready
            HSE_OFF = 0,
            /// HSE oscillator ready
            HSE_ON = 1,
        },
        /// HSE clock ready flag
        ///
        /// Set by hardware to indicate that the HSE oscillator is stable.
        ///
        /// After the HSEON bit is cleared, HSERDY goes low after 6 HSE oscillator clock cycles.
        HSERDY: enum(u1) {
            HSE_NOT_READY = 0,
            HSE_READY = 1,
        },
        /// HSE clock bypass
        ///
        /// Set and cleared by software to bypass the oscillator with an external clock.
        ///
        /// The external clock must be enabled with the HSEON bit, to be used by the device. The HSEBYP bit can be written only if the HSE oscillator is disabled.
        HSEBYP: enum(u1) {
            /// HSE oscillator not bypassed
            HSE_NOT_BYPASSED = 0,
            /// HSE oscillator bypassed with an external clock
            HSE_BYPASSED_WITH_EXTERNAL_CLOCK = 1,
        },
        /// Clock security system enable
        ///
        /// Set and cleared by software to enable the clock security system.
        ///
        /// When CSSON is set, the clock detector is enabled by hardware when the HSE oscillator is ready, and disabled by hardware if an oscillator failure is detected.
        CSSON: enum(u1) {
            /// Clock security system OFF (Clock detector OFF)
            CLOCK_SECURITY_OFF = 0,
            /// Clock security system ON (Clock detector ON if HSE oscillator is stable, OFF if not)
            CLOCK_SECURITY_ON = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u4,
        /// Main PLL (PLL) enable
        ///
        /// Set and cleared by software to enable PLL.
        ///
        /// Cleared by hardware when entering Stop or Standby mode.
        ///
        /// This bit cannot be reset if PLL clock is used as the system clock.
        PLLON: enum(u1) {
            /// PLL OFF
            PLL_OFF = 0,
            /// PLL ON
            PLL_ON = 1,
        },
        /// Main PLL (PLL) clock ready flag
        ///
        /// Set by hardware to indicate that PLL is locked.
        PLLRDY: enum(u1) {
            /// PLL unlocked
            PLL_UNLOCKED = 0,
            /// PLL locked
            PLL_LOCKED = 1,
        },
        /// PLLI2S enable
        ///
        /// Set and cleared by software to enable PLLI2S.
        ///
        /// Cleared by hardware when entering Stop or Standby mode.
        PLLI2SON: enum(u1) {
            /// PLLI2S OFF
            PLLI2S_OFF = 0,
            /// PLLI2S ON
            PLLI2S_ON = 1,
        },
        /// PLLI2S clock ready flag
        ///
        /// Set by hardware to indicate that the PLLI2S is locked.
        PLLI2SRDY: enum(u1) {
            /// PLLI2S unlocked
            PLLI2S_UNLOCKED = 0,
            /// PLLI2S locked
            PLLI2S_LOCKED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u4,
    },
    /// RCC PLL configuration register
    ///
    /// This register is used to configure the PLL clock outputs
    /// according to the formulas:
    ///
    /// • f(VCO clock) = f (PLL clock input) × (PLLN / PLLM)
    ///
    /// • f(PLL general clock output) = f (VCO clock) / PLLP
    ///
    /// • f(USB OTG FS, SDIO) = f(VCO clock) / PLLQ
    PLLCFGR: packed struct(u32) {
        /// Division factor for the main PLL (PLL) input clock
        ///
        /// Set and cleared by software to divide the PLL input clock before the VCO. These bits can be written only when the PLL is disabled.
        ///
        /// Caution: The software has to set these bits correctly to ensure that the VCO input frequency ranges from 1 to 2 MHz. It is recommended to select a frequency of 2 MHz to limit PLL jitter.
        ///
        /// VCO input frequency = PLL input clock frequency / PLLM [with 2 <= PLLM <= 63].
        PLLM: u6,
        /// Main PLL (PLL) multiplication factor for VCO
        ///
        /// Set and cleared by software to control the multiplication factor of the VCO. These bits can be written only when PLL is disabled. Only half-word and word accesses are allowed to write these bits.
        ///
        /// Caution: The software has to set these bits correctly to ensure that the VCO output frequency is between 100 and 432 MHz.
        ///
        /// VCO output frequency = VCO input frequency × PLLN [with 50 <= PLLN <= 432].
        PLLN: u9,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u1,
        /// Main PLL (PLL) division factor for main system clock
        ///
        /// Set and cleared by software to control the frequency of the general PLL output clock. These bits can be written only if PLL is disabled.
        ///
        /// Caution: The software has to set these bits correctly not to exceed 100 MHz on this domain.
        ///
        /// PLL output clock frequency = VCO frequency / PLLP [with PLLP = 2, 4, 6, or 8].
        PLLP: enum(u2) {
            DIV_BY_2 = 0b00,
            DIV_BY_4 = 0b01,
            DIV_BY_6 = 0b10,
            DIV_BY_8 = 0b11,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u4,
        /// Main PLL(PLL) and audio PLL (PLLI2S) entry clock source
        ///
        /// Set and cleared by software to select PLL and PLLI2S clock source.
        ///
        /// This bit can be written only when PLL and PLLI2S are disabled.
        PLLSRC: enum(u1) {
            /// HSI clock selected as PLL and PLLI2S clock entry
            HSI = 0,
            /// HSE oscillator clock selected as PLL and PLLI2S clock entry
            HSE = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// Main PLL (PLL) division factor for USB OTG FS, and SDIO clocks
        ///
        /// Set and cleared by software to control the frequency of USB OTG FS clock, and the SDIO clock.
        ///
        /// These bits should be written only if PLL is disabled.
        ///
        /// Caution: The USB OTG FS requires a 48 MHz clock to work correctly. The SDIO need a frequency lower than or equal to 48 MHz to work correctly.
        ///
        /// USB OTG FS clock frequency = VCO frequency / PLLQ [with 2 <= PLLQ <= 15].
        PLLQ: u4,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u4,
    },
    /// RCC clock configuration register
    CFGR: packed struct(u32) {
        /// System clock switch
        ///
        /// Set and cleared by software to select the system clock source.
        ///
        /// Set by hardware to force the HSI selection when leaving the Stop or Standby mode or in case of failure of the HSE oscillator used directly or indirectly as the system clock.
        SW: enum(u2) {
            /// HSI oscillator selected as system clock
            HSI = 0b00,
            /// HSE oscillator selected as system clock
            HSE = 0b01,
            /// PLL selected as system clock
            PLL = 0b10,
        },
        /// System clock switch status
        ///
        /// Set and cleared by hardware to indicate which clock source is used as the system clock.
        SWS: enum(u2) {
            /// HSI oscillator used as the system clock
            HSI = 0b00,
            /// HSE oscillator used as the system clock
            HSE = 0b01,
            /// PLL used as the system clock
            PLL = 0b10,
        },
        /// AHB prescaler
        ///
        /// Set and cleared by software to control AHB clock division factor.
        ///
        /// Caution: The clocks are divided with the new prescaler factor from 1 to 16 AHB cycles after HPRE write.
        HPRE: enum(u4) {
            /// system clock not divided
            NO_DIVISOR = 0b0000,
            /// system clock divided by 2
            DIV_BY_2 = 0b1000,
            /// system clock divided by 4
            DIV_BY_4 = 0b1001,
            /// system clock divided by 8
            DIV_BY_8 = 0b1010,
            /// system clock divided by 16
            DIV_BY_16 = 0b1011,
            /// system clock divided by 64
            DIV_BY_64 = 0b1100,
            /// system clock divided by 128
            DIV_BY_128 = 0b1101,
            /// system clock divided by 256
            DIV_BY_256 = 0b1110,
            /// system clock divided by 512
            DIV_BY_512 = 0b1111,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved: u2,
        /// APB Low speed prescaler (APB1)
        ///
        /// Set and cleared by software to control APB low-speed clock division factor.
        ///
        /// Caution: The software has to set these bits correctly not to exceed 50 MHz on this domain. The clocks are divided with the new prescaler factor from 1 to 16 AHB cycles after PPRE1 write.
        PPRE1: enum(u3) {
            /// AHB clock not divided
            NO_DIVISOR = 0b000,
            /// AHB clock divided by 2
            DIV_BY_2 = 0b100,
            /// AHB clock divided by 4
            DIV_BY_4 = 0b101,
            /// AHB clock divided by 8
            DIV_BY_8 = 0b110,
            /// AHB clock divided by 16
            DIV_BY_16 = 0b111,
        },
        /// APB high-speed prescaler (APB2)
        ///
        /// Set and cleared by software to control APB high-speed clock division factor.
        ///
        /// Caution: The software has to set these bits correctly not to exceed 100 MHz on this domain. The clocks are divided with the new prescaler factor from 1 to 16 AHB cycles after PPRE2 write.
        PPRE2: enum(u3) {
            /// AHB clock not divided
            NO_DIVISOR = 0b000,
            /// AHB clock divided by 2
            DIV_BY_2 = 0b100,
            /// AHB clock divided by 4
            DIV_BY_4 = 0b101,
            /// AHB clock divided by 8
            DIV_BY_8 = 0b110,
            /// AHB clock divided by 16
            DIV_BY_16 = 0b111,
        },
        /// HSE division factor for RTC clock
        ///
        /// Set and cleared by software to divide the HSE clock input clock to generate a 1 MHz clock for RTC.
        ///
        /// Caution: The software has to set these bits correctly to ensure that the clock supplied to the RTC is 1 MHz. These bits must be configured if needed before selecting the RTC clock source.
        RTCPRE: enum(u5) {
            /// no clock
            NO_CLOCK = 0b00000,
            /// HSE / 2
            DIV_BY_2 = 0b00010,
            /// HSE / 3
            DIV_BY_3 = 0b00011,
            /// HSE / 4
            DIV_BY_4 = 0b00100,
            /// HSE / 5
            DIV_BY_5 = 0b00101,
            /// HSE / 6
            DIV_BY_6 = 0b00110,
            /// HSE / 7
            DIV_BY_7 = 0b00111,
            /// HSE / 8
            DIV_BY_8 = 0b01000,
            /// HSE / 9
            DIV_BY_9 = 0b01001,
            /// HSE / 10
            DIV_BY_10 = 0b01010,
            /// HSE / 11
            DIV_BY_11 = 0b01011,
            /// HSE / 12
            DIV_BY_12 = 0b01100,
            /// HSE / 13
            DIV_BY_13 = 0b01101,
            /// HSE / 14
            DIV_BY_14 = 0b01110,
            /// HSE / 15
            DIV_BY_15 = 0b01111,
            /// HSE / 16
            DIV_BY_16 = 0b10000,
            /// HSE / 17
            DIV_BY_17 = 0b10001,
            /// HSE / 18
            DIV_BY_18 = 0b10010,
            /// HSE / 19
            DIV_BY_19 = 0b10011,
            /// HSE / 20
            DIV_BY_20 = 0b10100,
            /// HSE / 21
            DIV_BY_21 = 0b10101,
            /// HSE / 22
            DIV_BY_22 = 0b10110,
            /// HSE / 23
            DIV_BY_23 = 0b10111,
            /// HSE / 24
            DIV_BY_24 = 0b11000,
            /// HSE / 25
            DIV_BY_25 = 0b11001,
            /// HSE / 26
            DIV_BY_26 = 0b11010,
            /// HSE / 27
            DIV_BY_27 = 0b11011,
            /// HSE / 28
            DIV_BY_28 = 0b11100,
            /// HSE / 29
            DIV_BY_29 = 0b11101,
            /// HSE / 30
            DIV_BY_30 = 0b11110,
            /// HSE / 31
            DIV_BY_31 = 0b11111,
        },
        /// Microcontroller clock output 1
        ///
        /// Set and cleared by software. Clock source selection may generate glitches on MCO1. It is highly recommended to configure these bits only after reset before enabling the external oscillators and PLL.
        MCO1: enum(u2) {
            /// HSI clock selected
            HSI = 0b00,
            /// LSE oscillator selected
            LSE = 0b01,
            /// HSE oscillator clock selected
            HSE = 0b10,
            /// PLL clock selected
            PLL = 0b11,
        },
        /// I2S clock selection
        ///
        /// Set and cleared by software. This bit allows to select the I2S clock source between the PLLI2S clock and the external clock. It is highly recommended to change this bit only after reset and before enabling the I2S module.
        I2SSRC: enum(u1) {
            /// PLLI2S clock used as I2S clock source
            PLLI2S = 0,
            /// External clock mapped on the I2S_CKIN pin used as I2S clock source
            I2S_CKIN = 1,
        },
        /// MCO1 prescaler
        ///
        /// Set and cleared by software to configure the prescaler of the MCO1. Modification of this prescaler may generate glitches on MCO1. It is highly recommended to change this prescaler only after reset before enabling the external oscillators and the PLL.
        MCO1PRE: enum(u3) {
            /// no division
            NO_DIVISION = 0b000,
            /// division by 2
            DIV_BY_2 = 0b100,
            /// division by 3
            DIV_BY_3 = 0b101,
            /// division by 4
            DIV_BY_4 = 0b110,
            /// division by 5
            DIV_BY_5 = 0b111,
        },
        /// MCO2 prescaler
        ///
        /// Set and cleared by software to configure the prescaler of the MCO2. Modification of this prescaler may generate glitches on MCO2. It is highly recommended to change this prescaler only after reset before enabling the external oscillators and the PLLs.
        MCO2PRE: enum(u3) {
            /// no division
            NO_DIVISION = 0b000,
            /// division by 2
            DIV_BY_2 = 0b100,
            /// division by 3
            DIV_BY_3 = 0b101,
            /// division by 4
            DIV_BY_4 = 0b110,
            /// division by 5
            DIV_BY_5 = 0b111,
        },
        /// Microcontroller clock output 2
        ///
        /// Set and cleared by software. Clock source selection may generate glitches on MCO2. It is highly recommended to configure these bits only after reset before enabling the external oscillators and the PLLs.
        MCO2: enum(u2) {
            /// System clock (SYSCLK) selected
            SYSCLK = 0b00,
            /// PLLI2S clock selected
            PLLI2S = 0b01,
            /// HSE oscillator clock selected
            HSE = 0b10,
            /// PLL clock selected
            PLL = 0b11,
        },
    },
    /// RCC clock interrupt register
    CIR: packed struct(u32) {
        /// LSI ready interrupt flag
        ///
        /// Set by hardware when the internal low speed clock becomes stable and LSIRDYDIE is set.
        ///
        /// Cleared by software setting the LSIRDYC bit.
        LSIRDYF: enum(u1) {
            /// No clock ready interrupt caused by the LSI oscillator
            NO_CLOCK_READY_INTERRUPT = 0,
            /// Clock ready interrupt caused by the LSI oscillator
            CLOCK_READY_INTERRUPT = 1,
        },
        /// LSE ready interrupt flag
        ///
        /// Set by hardware when the External Low Speed clock becomes stable and LSERDYDIE is set.
        ///
        /// Cleared by software setting the LSERDYC bit.
        LSERDYF: enum(u1) {
            /// No clock ready interrupt caused by the LSE oscillator
            NO_CLOCK_READY_INTERRUPT = 0,
            /// Clock ready interrupt caused by the LSE oscillator
            CLOCK_READY_INTERRUPT = 1,
        },
        /// HSI ready interrupt flag
        ///
        /// Set by hardware when the Internal High Speed clock becomes stable and HSIRDYDIE is set.
        ///
        /// Cleared by software setting the HSIRDYC bit.
        HSIRDYF: enum(u1) {
            /// No clock ready interrupt caused by the HSI oscillator
            NO_CLOCK_READY_INTERRUPT = 0,
            /// Clock ready interrupt caused by the HSI oscillator
            CLOCK_READY_INTERRUPT = 1,
        },
        /// HSE ready interrupt flag
        ///
        /// Set by hardware when External High Speed clock becomes stable and HSERDYDIE is set.
        ///
        /// Cleared by software setting the HSERDYC bit.
        HSERDYF: enum(u1) {
            /// No clock ready interrupt caused by the HSE oscillator
            NO_CLOCK_READY_INTERRUPT = 0,
            /// Clock ready interrupt caused by the HSE oscillator
            CLOCK_READY_INTERRUPT = 1,
        },
        /// Main PLL (PLL) ready interrupt flag
        ///
        /// Set by hardware when PLL locks and PLLRDYDIE is set.
        ///
        /// Cleared by software setting the PLLRDYC bit.
        PLLRDYF: enum(u1) {
            /// No clock ready interrupt caused by PLL lock
            NO_CLOCK_READY_INTERRUPT = 0,
            /// Clock ready interrupt caused by PLL lock
            CLOCK_READY_INTERRUPT = 1,
        },
        /// PLLI2S ready interrupt flag
        ///
        /// Set by hardware when the PLLI2S locks and PLLI2SRDYDIE is set.
        ///
        /// Cleared by software setting the PLLRI2SDYC bit.
        PLLI2SRDYF: enum(u1) {
            /// No clock ready interrupt caused by PLLI2S lock
            NO_CLOCK_READY_INTERRUPT = 0,
            /// Clock ready interrupt caused by PLLI2S lock
            CLOCK_READY_INTERRUPT = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u1,
        /// Clock security system interrupt flag
        ///
        /// Set by hardware when a failure is detected in the HSE oscillator.
        ///
        /// Cleared by software setting the CSSC bit.
        CSSF: enum(u1) {
            /// No clock security interrupt caused by HSE clock failure
            NO_CLOCK_SECURITY_INTERRUPT = 0,
            /// Clock security interrupt caused by HSE clock failure
            CLOCK_SECURITY_INTERRUPT = 1,
        },
        /// LSI ready interrupt enable
        ///
        ///Set and cleared by software to enable/disable interrupt caused by LSI oscillator stabilization.
        LSIRDYIE: enum(u1) {
            /// LSI ready interrupt disabled
            INTERRUPT_DISABLED = 0,
            /// LSI ready interrupt enabled
            INTERRUPT_ENABLED = 1,
        },
        /// LSE ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by the LSE oscillator stabilization.
        LSERDYIE: enum(u1) {
            /// LSE ready interrupt disabled
            INTERRUPT_DISABLED = 0,
            /// LSE ready interrupt enabled
            INTERRUPT_ENABLED = 1,
        },
        /// HSI ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by the HSI oscillator stabilization.
        HSIRDYIE: enum(u1) {
            /// HSI ready interrupt disabled
            INTERRUPT_DISABLED = 0,
            /// HSI ready interrupt enabled
            INTERRUPT_ENABLED = 1,
        },
        /// HSE ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by the HSE oscillator stabilization.
        HSERDYIE: enum(u1) {
            /// HSE ready interrupt disabled
            INTERRUPT_DISABLED = 0,
            /// HSE ready interrupt enabled
            INTERRUPT_ENABLED = 1,
        },
        /// Main PLL (PLL) ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by PLL lock.
        PLLRDYIE: enum(u1) {
            /// PLL lock interrupt disabled
            INTERRUPT_DISABLED = 0,
            /// PLL lock interrupt enabled
            INTERRUPT_ENABLED = 1,
        },
        /// PLLI2S ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by PLLI2S lock.
        PLLI2SRDYIE: enum(u1) {
            /// PLLI2S lock interrupt disabled
            INTERRUPT_DISABLED = 0,
            /// PLLI2S lock interrupt enabled
            INTERRUPT_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// LSI ready interrupt clear
        ///
        /// This bit is set by software to clear the LSIRDYF flag.
        LSIRDYC: enum(u1) {
            /// No effect
            NO_EFFECT = 0,
            /// LSIRDYF cleared
            CLEAR_FLAG = 1,
        },
        /// LSE ready interrupt clear
        ///
        /// This bit is set by software to clear the LSERDYF flag.
        LSERDYC: enum(u1) {
            /// No effect
            NO_EFFECT = 0,
            /// LSIRDYF cleared
            CLEAR_FLAG = 1,
        },
        /// HSI ready interrupt clear
        ///
        /// This bit is set software to clear the HSIRDYF flag.
        HSIRDYC: enum(u1) {
            /// No effect
            NO_EFFECT = 0,
            /// HSIRDYF cleared
            CLEAR_FLAG = 1,
        },
        /// HSE ready interrupt clear
        ///
        /// This bit is set by software to clear the HSERDYF flag.
        HSERDYC: enum(u1) {
            /// No effect
            NO_EFFECT = 0,
            /// HSERDYF cleared
            CLEAR_FLAG = 1,
        },
        /// Main PLL(PLL) ready interrupt clear
        ///
        /// This bit is set by software to clear the PLLRDYF flag.
        PLLRDYC: enum(u1) {
            /// No effect
            NO_EFFECT = 0,
            /// PLLRDYF cleared
            CLEAR_FLAG = 1,
        },
        /// PLLI2S ready interrupt clear
        ///
        /// This bit is set by software to clear the PLLI2SRDYF flag.
        PLLI2SRDYC: enum(u1) {
            /// No effect
            NO_EFFECT = 0,
            /// PLLI2SRDYF cleared
            CLEAR_FLAG = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// Clock security system interrupt clear
        ///
        /// This bit is set by software to clear the CSSF flag.
        CSSC: enum(u1) {
            /// No effect
            NO_EFFECT = 0,
            /// CSSF cleared
            CLEAR_FLAG = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u8,
    },
    /// RCC AHB1 peripheral reset register
    AHB1RSTR: packed struct(u32) {
        /// IO port A reset
        ///
        /// Set and cleared by software.
        GPIOARST: enum(u1) {
            /// does not reset IO port A
            DONT_RESET = 0,
            /// resets IO port A
            RESET = 1,
        },
        /// IO port B reset
        ///
        /// Set and cleared by software.
        GPIOBRST: enum(u1) {
            /// does not reset IO port B
            DONT_RESET = 0,
            /// resets IO port B
            RESET = 1,
        },
        /// IO port C reset
        ///
        /// Set and cleared by software.
        GPIOCRST: enum(u1) {
            /// does not reset IO port C
            DONT_RESET = 0,
            /// resets IO port C
            RESET = 1,
        },
        /// IO port D reset
        ///
        /// Set and cleared by software.
        GPIODRST: enum(u1) {
            /// does not reset IO port D
            DONT_RESET = 0,
            /// resets IO port D
            RESET = 1,
        },
        /// IO port E reset
        ///
        /// Set and cleared by software.
        GPIOERST: enum(u1) {
            /// does not reset IO port E
            DONT_RESET = 0,
            /// resets IO port E
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// IO port H reset
        ///
        /// Set and cleared by software.
        GPIOHRST: enum(u1) {
            /// does not reset IO port H
            DONT_RESET = 0,
            /// resets IO port H
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u4,
        /// CRC reset
        ///
        /// Set and cleared by software.
        CRCRST: enum(u1) {
            /// does not reset CRC
            DONT_RESET = 0,
            /// resets CRC
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u8,
        /// DMA1 reset
        ///
        /// Set and cleared by software.
        DMA1RST: enum(u1) {
            /// does not reset DMA1
            DONT_RESET = 0,
            /// resets DMA1
            RESET = 1,
        },
        /// DMA2 reset
        ///
        /// Set and cleared by software.
        DMA2RST: enum(u1) {
            /// does not reset DMA2
            DONT_RESET = 0,
            /// resets DMA2
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u9,
    },
    /// RCC AHB2 peripheral reset register
    AHB2RSTR: packed struct(u32) {
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// USB OTG FS reset
        ///
        /// Set and cleared by software.
        OTGFSRST: enum(u1) {
            /// does not reset USB OTG FS
            DONT_RESET = 0,
            /// resets USB OTG FS
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u24,
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved1: u64,
    /// RCC APB1 peripheral reset registe
    APB1RSTR: packed struct(u32) {
        /// TIM2 reset
        ///
        /// Set and cleared by software.
        TIM2: enum(u1) {
            /// does not reset TIM2
            DONT_RESET = 0,
            /// resets TIM2
            RESET = 1,
        },
        /// TIM3 reset
        ///
        /// Set and cleared by software.
        TIM3: enum(u1) {
            /// does not reset TIM3
            DONT_RESET = 0,
            /// resets TIM3
            RESET = 1,
        },
        /// TIM4 reset
        ///
        /// Set and cleared by software.
        TIM4: enum(u1) {
            /// does not reset TIM4
            DONT_RESET = 0,
            /// resets TIM4
            RESET = 1,
        },
        /// TIM5 reset
        ///
        /// Set and cleared by software.
        TIM5: enum(u1) {
            /// does not reset TIM5
            DONT_RESET = 0,
            /// resets TIM5
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// Window Watchdog reset
        ///
        /// Set and cleared by software.
        WWDGRST: enum(u1) {
            /// does not reset the window watchdog
            DONT_RESET = 0,
            /// resets the window watchdog
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// SPI2 reset
        ///
        /// Set and cleared by software.
        SPI2RST: enum(u1) {
            /// does not reset SPI2
            DONT_RESET = 0,
            /// resets SPI2
            RESET = 1,
        },
        /// SPI3 reset
        ///
        /// Set and cleared by software.
        SPI3RST: enum(u1) {
            /// does not reset SPI3
            DONT_RESET = 0,
            /// resets SPI3
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// USART2 reset
        ///
        /// Set and cleared by software.
        USART2RST: enum(u1) {
            /// does not reset USART2
            DONT_RESET = 0,
            /// resets USART2
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u3,
        /// I2C1 reset
        ///
        /// Set and cleared by software.
        I2C1RST: enum(u1) {
            /// does not reset I2C1
            DONT_RESET = 0,
            /// resets I2C1
            RESET = 1,
        },
        /// I2C2 reset
        ///
        /// Set and cleared by software.
        I2C2RST: enum(u1) {
            /// does not reset I2C2
            DONT_RESET = 0,
            /// resets I2C2
            RESET = 1,
        },
        /// I2C3 reset
        ///
        /// Set and cleared by software.
        I2C3RST: enum(u1) {
            /// does not reset I2C3
            DONT_RESET = 0,
            /// resets I2C3
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u4,
        /// Power Interface reset
        ///
        /// Set and cleared by software.
        PWRRST: enum(u1) {
            /// does not reset the power interface
            DONT_RESET = 0,
            /// resets the power interface
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved: u3,
    },
    /// RCC APB2 peripheral reset register
    APB2RSTR: packed struct(u32) {
        /// TIM1 reset
        ///
        /// Set and cleared by software.
        TIM1RST: enum(u1) {
            /// does not reset TIM1
            DONT_RESET = 0,
            /// resets TIM1
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u3,
        /// USART1 reset
        ///
        /// Set and cleared by software.
        USART1RST: enum(u1) {
            /// does not reset USART1
            DONT_RESET = 0,
            /// resets USART1
            RESET = 1,
        },
        /// USART6 reset
        ///
        /// Set and cleared by software.
        USART6RST: enum(u1) {
            /// does not reset USART6
            DONT_RESET = 0,
            /// resets USART6
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// ADC interface reset
        ///
        /// Set and cleared by software.
        ADC1RST: enum(u1) {
            /// does not reset the ADC interface
            DONT_RESET = 0,
            /// resets the ADC interface
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u2,
        /// SDIO reset
        ///
        /// Set and cleared by software.
        SDIORST: enum(u1) {
            /// does not reset the SDIO module
            DONT_RESET = 0,
            /// resets the SDIO module
            RESET = 1,
        },
        /// SPI1 reset
        ///
        /// Set and cleared by software.
        SPI1RST: enum(u1) {
            /// does not reset SPI1
            DONT_RESET = 0,
            /// resets SPI1
            RESET = 1,
        },
        /// SPI4 reset
        ///
        /// Set and cleared by software.
        SPI4RST: enum(u1) {
            /// does not reset SPI4
            DONT_RESET = 0,
            /// resets SPI4
            RESET = 1,
        },
        /// System Configuration Controller reset
        ///
        /// Set and cleared by software.
        SYSCFGRST: enum(u1) {
            /// does not reset the System configuration controller
            DONT_RESET = 0,
            /// resets the System configuration controller
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u1,
        /// TIM9 reset
        ///
        /// Set and cleared by software.
        TIM9RST: enum(u1) {
            /// does not reset TIM9
            DONT_RESET = 0,
            /// resets TIM9
            RESET = 1,
        },
        /// TIM10 reset
        ///
        /// Set and cleared by software.
        TIM10RST: enum(u1) {
            /// does not reset TIM10
            DONT_RESET = 0,
            /// resets TIM10
            RESET = 1,
        },
        /// TIM11 reset
        ///
        /// Set and cleared by software.
        TIM11RST: enum(u1) {
            /// does not reset TIM11
            DONT_RESET = 0,
            /// resets TIM11
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u1,
        /// SPI5 reset
        ///
        /// Set and cleared by software.
        SPI5RST: enum(u1) {
            /// does not reset SPI5
            DONT_RESET = 0,
            /// resets SPI5
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved6: u11,
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved2: u64,
    /// RCC AHB1 peripheral clock enable register
    AHB1ENR: packed struct(u32) {
        /// IO port A clock enable
        ///
        /// Set and cleared by software.
        GPIOAEN: enum(u1) {
            //IO port A clock disabled
            CLOCK_DISABLED = 0,
            // IO port A clock enabled
            CLOCK_ENABLED = 1,
        },
        /// IO port B clock enable
        ///
        /// Set and cleared by software.
        GPIOBEN: enum(u1) {
            //IO port B clock disabled
            CLOCK_DISABLED = 0,
            // IO port B clock enabled
            CLOCK_ENABLED = 1,
        },
        /// IO port C clock enable
        ///
        /// Set and cleared by software.
        GPIOCEN: enum(u1) {
            //IO port C clock disabled
            CLOCK_DISABLED = 0,
            // IO port C clock enabled
            CLOCK_ENABLED = 1,
        },
        /// IO port D clock enable
        ///
        /// Set and cleared by software.
        GPIODEN: enum(u1) {
            //IO port D clock disabled
            CLOCK_DISABLED = 0,
            // IO port D clock enabled
            CLOCK_ENABLED = 1,
        },
        /// IO port E clock enable
        ///
        /// Set and cleared by software.
        GPIOEEN: enum(u1) {
            //IO port E clock disabled
            CLOCK_DISABLED = 0,
            // IO port E clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// IO port H clock enable
        ///
        /// Set and cleared by software.
        GPIOHEN: enum(u1) {
            //IO port H clock disabled
            CLOCK_DISABLED = 0,
            // IO port H clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u4,
        /// CRC clock enable
        ///
        /// Set and cleared by software.
        CRCEN: enum(u1) {
            /// CRC clock disabled
            CLOCK_DISABLED = 0,
            /// CRC clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u8,
        /// DMA1 clock enable
        ///
        /// Set and cleared by software.
        DMA1EN: enum(u1) {
            /// DMA1 clock disabled
            CLOCK_DISABLED = 0,
            /// DMA1 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// DMA2 clock enable
        ///
        /// Set and cleared by software.
        DMA2EN: enum(u1) {
            /// DMA2 clock disabled
            CLOCK_DISABLED = 0,
            /// DMA2 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u9,
    },
    /// RCC AHB2 peripheral clock enable register
    AHB2ENR: packed struct(u32) {
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// USB OTG FS clock enable
        ///
        /// Set and cleared by software.
        OTGFSEN: enum(u1) {
            /// USB OTG FS clock disabled
            CLOCK_DISABLED = 0,
            /// USB OTG FS clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u24,
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved3: u64,
    /// RCC APB1 peripheral clock enable register
    APB1ENR: packed struct(u32) {
        /// TIM3 clock enable
        ///
        /// Set and cleared by software.
        TIM2EN: enum(u1) {
            /// TIM2 clock disabled
            CLOCK_DISABLED = 0,
            /// TIM2 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// TIM3 clock enable
        ///
        /// Set and cleared by software.
        TIM3EN: enum(u1) {
            /// TIM3 clock disabled
            CLOCK_DISABLED = 0,
            /// TIM3 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// TIM4 clock enable
        ///
        /// Set and cleared by software.
        TIM4EN: enum(u1) {
            /// TIM4 clock disabled
            CLOCK_DISABLED = 0,
            /// TIM4 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// TIM5 clock enable
        ///
        /// Set and cleared by software.
        TIM5EN: enum(u1) {
            /// TIM5 clock disabled
            CLOCK_DISABLED = 0,
            /// TIM5 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// Window Watchdog clock enable
        ///
        /// Set and cleared by software.
        WWDGEN: enum(u1) {
            /// Window watchdog clock disabled
            CLOCK_DISABLED = 0,
            /// Window watchdog clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// SPI2 clock enable
        ///
        /// Set and cleared by software.
        SPI2EN: enum(u1) {
            /// SPI2 clock disabled
            CLOCK_DISABLED = 0,
            /// SPI2 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// SPI3 clock enable
        ///
        /// Set and cleared by software.
        SPI3EN: enum(u1) {
            /// SPI3 clock disabled
            CLOCK_DISABLED = 0,
            /// SPI3 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// USART2 clock enable
        ///
        /// Set and cleared by software.
        USART2EN: enum(u1) {
            /// USART2 clock disabled
            CLOCK_DISABLED = 0,
            /// USART2 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u3,
        /// I2C1 clock enable
        ///
        /// Set and cleared by software.
        I2C1EN: enum(u1) {
            /// I2C1 clock disabled
            CLOCK_DISABLED = 0,
            /// I2C1 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// I2C2 clock enable
        ///
        /// Set and cleared by software.
        I2C2EN: enum(u1) {
            /// I2C2 clock disabled
            CLOCK_DISABLED = 0,
            /// I2C2 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// I2C3 clock enable
        ///
        /// Set and cleared by software.
        I2C3EN: enum(u1) {
            /// I2C3 clock disabled
            CLOCK_DISABLED = 0,
            /// I2C3 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u4,
        /// Power Interface clock enable
        ///
        /// Set and cleared by software.
        PWREN: enum(u1) {
            /// Power interface clock disabled
            CLOCK_DISABLED = 0,
            /// Power interface clock enable
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved6: u3,
    },
    /// RCC APB2 peripheral clock enable register
    APB2ENR: packed struct(u32) {
        /// TIM1 clock enable
        ///
        /// Set and cleared by software.
        TIM1EN: enum(u1) {
            /// TIM1 clock disabled
            CLOCK_DISABLED = 0,
            /// TIM1 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u3,
        /// USART1 clock enable
        ///
        /// Set and cleared by software.
        USART1EN: enum(u1) {
            /// USART1 clock disabled
            CLOCK_DISABLED = 0,
            /// USART1 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// USART6 clock enable
        ///
        /// Set and cleared by software.
        USART6EN: enum(u1) {
            /// USART6 clock disabled
            CLOCK_DISABLED = 0,
            /// USART6 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// ADC interface clock enable
        ///
        /// Set and cleared by software.
        ADC1EN: enum(u1) {
            /// ADC1 clock disabled
            CLOCK_DISABLED = 0,
            /// ADC1 clock disabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u2,
        /// SDIO clock enable
        ///
        /// Set and cleared by software.
        SDIOEN: enum(u1) {
            /// SDIO module clock disabled
            CLOCK_DISABLED = 0,
            /// SDIO module clock enabled
            CLOCK_ENABLED = 1,
        },
        /// SPI1 clock enable
        ///
        /// Set and cleared by software.
        SPI1EN: enum(u1) {
            /// SPI1 clock disabled
            CLOCK_DISABLED = 0,
            /// SPI1 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// SPI4 clock enable
        ///
        /// Set and cleared by software.
        SPI4EN: enum(u1) {
            /// SPI4 clock disabled
            CLOCK_DISABLED = 0,
            /// SPI4 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// System Configuration Controller clock enable
        ///
        /// Set and cleared by software.
        SYSCFGEN: enum(u1) {
            /// System configuration controller clock disabled
            CLOCK_DISABLED = 0,
            /// System configuration controller clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u1,
        /// TIM9 clock enable
        ///
        /// Set and cleared by software.
        TIM9EN: enum(u1) {
            /// TIM9 clock disabled
            CLOCK_DISABLED = 0,
            /// TIM9 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// TIM10 clock enable
        ///
        /// Set and cleared by software.
        TIM10EN: enum(u1) {
            /// TIM10 clock disabled
            CLOCK_DISABLED = 0,
            /// TIM10 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// TIM11 clock enable
        ///
        /// Set and cleared by software.
        TIM11EN: enum(u1) {
            /// TIM11 clock disabled
            CLOCK_DISABLED = 0,
            /// TIM11 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u1,
        /// SPI5 clock enable
        ///
        /// Set and cleared by software.
        SPI5EN: enum(u1) {
            /// SPI5 clock disabled
            CLOCK_DISABLED = 0,
            /// SPI5 clock enabled
            CLOCK_ENABLED = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved6: u11,
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved4: u64,
    /// RCC AHB1 peripheral clock enable in low power mode register
    AHB1LPENR: packed struct(u32) {
        /// IO port A clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOALPEN: enum(u1) {
            /// IO port A clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// IO port A clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// IO port B clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOBLPEN: enum(u1) {
            /// IO port B clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// IO port B clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// IO port C clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOCLPEN: enum(u1) {
            /// IO port C clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// IO port C clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// IO port D clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIODLPEN: enum(u1) {
            /// IO port D clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// IO port D clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// IO port E clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOELPEN: enum(u1) {
            /// IO port E clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// IO port E clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// IO port H clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOHLPEN: enum(u1) {
            /// IO port H clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// IO port H clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u4,
        /// CRC clock enable during sleep mode
        ///
        /// Set and cleared by software.
        CRCLPEN: enum(u1) {
            /// CRC clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// CRC clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u2,
        /// Flash Interface clock enable during sleep mode
        ///
        /// Set and cleared by software.
        FLITLPEN: enum(u1) {
            /// Flash interface clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// Flash interface clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// SRAM1 Interface clock enable during sleep mode
        ///
        /// Set and cleared by software.
        SRAM1LPEN: enum(u1) {
            /// SRAM1 interface clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// SRAM1 interface clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u4,
        /// DMA1 clock enable during sleep mode
        ///
        /// Set and cleared by software.
        DMA1LPEN: enum(u1) {
            /// DMA1 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// DMA1 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// DMA2 clock enable during sleep mode
        ///
        /// Set and cleared by software.
        DMA2LPEN: enum(u1) {
            /// DMA2 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// DMA2 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved6: u9,
    },
    /// RCC AHB2 peripheral clock enable in low power mode register
    AHB2LPENR: packed struct(u32) {
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// USB OTG FS clock enable during sleep mode
        ///
        /// Set and cleared by software.
        OTGFSLPEN: enum(u1) {
            /// USB OTG FS clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// USB OTG FS clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u24,
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved5: u64,
    /// RCC APB1 peripheral clock enable in low power mode register
    APB1LPENR: packed struct(u32) {
        /// TIM2 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM2LPEN: enum(u1) {
            /// TIM2 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// TIM2 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// TIM3 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM3LPEN: enum(u1) {
            /// TIM3 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// TIM3 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// TIM4 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM4LPEN: enum(u1) {
            /// TIM4 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// TIM4 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// TIM5 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM5LPEN: enum(u1) {
            /// TIM5 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// TIM5 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// Window Watchdog clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        WWDGLPEN: enum(u1) {
            /// Window watchdog clock disabled during sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// Window watchdog clock enabled during sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// SPI2 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI2LPEN: enum(u1) {
            /// SPI2 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// SPI2 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// SPI3 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI3LPEN: enum(u1) {
            /// SPI3 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// SPI3 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// USART2 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        USART2LPEN: enum(u1) {
            /// USART2 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// USART2 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u3,
        /// I2C1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        I2C1LPEN: enum(u1) {
            /// I2C1 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// I2C1 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// I2C2 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        I2C2LPEN: enum(u1) {
            /// I2C2 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// I2C2 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// I2C3 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        I2C3LPEN: enum(u1) {
            /// I2C3 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// I2C3 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u4,
        /// Power Interface clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        PWRLPEN: enum(u1) {
            /// Power interface clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// Power interface clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved6: u3,
    },
    /// RCC APB2 peripheral clock enable in low power mode register
    APB2LPENR: packed struct(u32) {
        /// TIM1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM1LPEN: enum(u1) {
            /// TIM1 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// TIM1 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u3,
        /// USART1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        USART1LPEN: enum(u1) {
            /// USART1 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// USART1 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// USART6 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        USART6LPEN: enum(u1) {
            /// USART6 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// USART6 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// ADC1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        ADC1LPEN: enum(u1) {
            /// ADC1 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// ADC1 clock disabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u2,
        /// SDIO clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SDIOLPEN: enum(u1) {
            /// SDIO module clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// SDIO module clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// SPI1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI1LPEN: enum(u1) {
            /// SPI1 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// SPI1 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// SPI4 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI4LPEN: enum(u1) {
            /// SPI4 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// SPI4 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// System Configuration Controller clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SYSCFGLPEN: enum(u1) {
            /// System configuration controller clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// System configuration controller clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u1,
        /// TIM9 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM9LPEN: enum(u1) {
            /// TIM9 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// TIM9 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// TIM10 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM10LPEN: enum(u1) {
            /// TIM10 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// TIM10 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// TIM11 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM11LPEN: enum(u1) {
            /// TIM11 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// TIM11 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u1,
        /// SPI5 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI5LPEN: enum(u1) {
            /// SPI5 clock disabled during Sleep mode
            CLOCK_DISABLED_IN_SLEEP = 0,
            /// SPI5 clock enabled during Sleep mode
            CLOCK_ENABLED_IN_SLEEP = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved6: u11,
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved6: u64,
    /// RCC Backup domain control register
    BDCR: packed struct(u32) {
        /// External low-speed oscillator enable
        ///
        /// Set and cleared by software.
        LSEON: enum(u1) {
            /// LSE clock OFF
            LSE_OFF = 0,
            /// LSE clock ON
            LSE_ON = 1,
        },
        /// External low-speed oscillator ready
        ///
        /// Set and cleared by hardware to indicate when the external 32 kHz oscillator is stable. After the LSEON bit is cleared, LSERDY goes low after 6 external low-speed oscillator clock cycles.
        LSERDY: enum(u1) {
            /// LSE clock not ready
            LSE_NOT_READY = 0,
            /// LSE clock ready
            LSE_READY = 1,
        },
        /// External low-speed oscillator bypass
        ///
        /// Set and cleared by software to bypass oscillator in debug mode. This bit can be written only when the LSE clock is disabled.
        LSEBYP: enum(u1) {
            /// LSE oscillator not bypassed
            LSE_NOT_BYPASSED = 0,
            /// LSE oscillator bypassed
            LSE_BYPASSED = 1,
        },
        /// External low-speed oscillator bypass
        ///
        /// Set and reset by software to select crystal mode for low speed oscillator. Two power modes are available.
        LSEMOD: enum(u1) {
            /// LSE oscillator “low power” mode selection
            LOW_POWER = 0,
            /// LSE oscillator “high drive” mode selection
            HIGH_DRIVE = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u4,
        /// RTC clock source selection
        ///
        /// Set by software to select the clock source for the RTC. Once the RTC clock source has been selected, it cannot be changed anymore unless the Backup domain is reset. The BDRST bit can be used to reset them.
        RTCSEL: enum(u2) {
            /// No clock
            NO_CLOCK = 0b00,
            /// LSE oscillator clock used as the RTC clock
            LSE = 0b01,
            /// LSI oscillator clock used as the RTC clock
            LSI = 0b10,
            /// HSE oscillator clock divided by a programmable prescaler (selection through the RTCPRE[4:0] bits in the RCC clock configuration register (RCC_CFGR)) used as the RTC clock
            HSE = 0b11,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u5,
        /// RTC clock enable
        ///
        /// Set and cleared by software.
        RTCEN: enum(u1) {
            /// RTC clock disabled
            CLOCK_DISABLED = 0,
            /// RTC clock enabled
            CLOCK_ENABLED = 1,
        },
        /// Backup domain software reset
        ///
        /// Set and cleared by software.
        BDRST: enum(u1) {
            /// Reset not activated
            DONT_RESET = 0,
            /// Resets the entire Backup domain
            RESET = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u15,
    },
    /// RCC clock control & status register
    CSR: packed struct(u32) {
        /// Internal low-speed oscillator enable
        ///
        /// Set and cleared by software.
        LSION: enum(u1) {
            /// LSI RC oscillator OFF
            LSI_OFF = 0,
            /// LSI RC oscillator ON
            LSI_ON = 1,
        },
        /// Internal low-speed oscillator ready
        ///
        /// Set and cleared by hardware to indicate when the internal RC 40 kHz oscillator is stable. After the LSION bit is cleared, LSIRDY goes low after 3 LSI clock cycles.
        LSIRDY: enum(u1) {
            /// LSI RC oscillator not ready
            LSI_NOT_READY = 0,
            /// LSI RC oscillator ready
            LSI_READY = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u22,
        /// Remove reset flag
        ///
        /// Set by software to clear the reset flags.
        RMVF: enum(u1) {
            /// No effect
            NO_EFFECT = 0,
            /// Clear the reset flags
            CLEAR_RESET_FLAGS = 1,
        },
        /// BOR (brownout) reset flag
        ///
        /// Cleared by software by writing the RMVF bit.
        ///
        /// Set by hardware when a POR/PDR (Power-on/power-down) or BOR (brownout) reset occurs.
        BORRSTF: enum(u1) {
            /// No POR/PDR (Power-on/power-down) or BOR (brownout) reset occurred
            NO_POR_PDR_or_BOR_RESET = 0,
            /// POR/PDR (Power-on/power-down) or BOR (brownout) reset occurred
            POR_PDR_or_BOR_RESET = 1,
        },
        /// PIN reset flag
        ///
        /// Set by hardware when a reset from the NRST pin occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        PINRSTF: enum(u1) {
            /// No reset from NRST pin occurred
            NO_NRST_RESET = 0,
            /// Reset from NRST pin occurred
            NRST_RESET = 1,
        },
        /// POR/PDR (Power-on/power-down) reset flag
        ///
        /// Set by hardware when a POR/PDR (Power-on/power-down) reset occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        PORRSTF: enum(u1) {
            /// No POR/PDR (Power-on/power-down) reset occurred
            NO_POR_PDR_RESET = 0,
            /// POR/PDR (Power-on/power-down) reset occurred
            POR_PDR_RESET = 1,
        },
        /// Software reset flag
        ///
        /// Set by hardware when a software reset occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        SFTRSTF: enum(u1) {
            /// No software reset occurred
            NO_SOFTWARE_RESET = 0,
            /// Software reset occurred
            SOFTWARE_RESET = 1,
        },
        /// Independent watchdog reset flag
        ///
        /// Set by hardware when an independent watchdog reset from V DD domain occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        IWDGRSTF: enum(u1) {
            /// No watchdog reset occurred
            NO_WATCHDOG_RESET = 0,
            /// Watchdog reset occurred
            WATCHDOG_RESET = 1,
        },
        /// Window watchdog reset flag
        ///
        /// Set by hardware when a window watchdog reset occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        WWDGRSTF: enum(u1) {
            /// No window watchdog reset occurred
            NO_WINDOW_WATCHDOG_RESET = 0,
            /// Window watchdog reset occurred
            WINDOW_WATCHDOG_RESET = 1,
        },
        ///  Low-power reset flag
        ///
        /// Set by hardware when a Low-power management reset occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        LPWRRSTF: enum(u1) {
            /// No Low-power management reset occurred
            NO_LOW_POWER_MANAGEMENT_RESET = 0,
            /// Low-power management reset occurred
            LOW_POWER_MANAGEMENT_RESET = 1,
        },
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved7: u64,
    /// RCC spread spectrum clock generation register
    ///
    /// The spread spectrum clock generation is available only for the main PLL.
    ///
    /// The RCC_SSCGR register must be written either before the main PLL is enabled or after the main PLL disabled.
    SSCGR: packed struct(u32) {
        /// Modulation period
        ///
        /// Set and cleared by software. To write before setting CR[24]=PLLON bit.
        ///
        /// Configuration input for modulation profile period.
        MODPER: u13,
        /// Incrementation step
        ///
        /// Set and cleared by software. To write before setting CR[24]=PLLON bit.
        ///
        /// Configuration input for modulation profile amplitude.
        INCSTEP: u15,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// Spread Select
        ///
        /// Set and cleared by software. To write before to set CR[24]=PLLON bit.
        SPREADSEL: enum(u1) {
            /// Center spread
            CENTER = 0,
            /// Down spread
            DOWN = 1,
        },
        /// Spread spectrum modulation enable
        ///
        /// Set and cleared by software. To write after clearing CR[24]=PLLON bit
        SSCGEN: enum(u1) {
            ///  Spread spectrum modulation DISABLE
            DISABLE = 0,
            ///  Spread spectrum modulation ENABLE
            ENABLE = 1,
        },
    },
    /// RCC PLLI2S configuration register
    ///
    /// This register is used to configure the PLLI2S clock outputs according to the formulas:
    ///
    /// • f(VCO clock) = f (PLLI2S clock input) × (PLLI2SN / PLLI2SM)
    ///
    /// • f(PLL I2S clock output) = f(VCO clock) / PLLI2SR
    PLLI2SCFGR: packed struct(u32) {
        /// Division factor for the audio PLL (PLLI2S) input clock
        ///
        /// Set and cleared by software to divide the PLLI2S input clock before the VCO. These bits can be written only when the PLLI2S is disabled.
        ///
        /// Caution: The software has to set these bits correctly to ensure that the VCO input frequency ranges from 1 to 2 MHz.It is recommended to select a frequency of 2 MHz to limit PLL jitter.
        ///
        /// VCO input frequency = PLL input clock frequency / PLLI2SM [with 2≤PLLI2SM ≤63]
        PLLI2SM: u6,
        /// PLLI2S multiplication factor for VCO
        ///
        /// Set and cleared by software to control the multiplication factor of the VCO. These bits can be written only when the PLLI2S is disabled. Only half-word and word accesses are allowed to write these bits.
        ///
        /// Caution: The software has to set these bits correctly to ensure that the VCO output frequency is between 100 and 432 MHz. With VCO input frequency ranges from 1 to 2 MHz (refer to Figure 13 and divider factor M of the RCC PLL configuration register (RCC_PLLCFGR))
        ///
        /// VCO output frequency = VCO input frequency × PLLI2SN [with 50 ≤PLLI2SN ≤432]
        PLLI2SN: u9,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u13,
        /// PLLI2S division factor for I2S clocks
        ///
        /// Set and cleared by software to control the I2S clock frequency. These bits should be written only if the PLLI2S is disabled.
        ///
        /// The factor must be chosen in accordance with the prescaler values inside the I2S peripherals, to reach 0.3% error when using standard crystals and 0% error with audio crystals.
        ///
        /// Caution: The I2Ss requires a frequency lower than or equal to 192 MHz to work correctly.
        ///
        /// I2S clock frequency = VCO frequency / PLLR [with 2 ≤PLLR ≤7]
        PLLI2SR: u3,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u1,
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved8: u32,
    /// RCC Dedicated Clocks Configuration Register
    DCKCFGR: packed struct(u32) {
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u24,
        /// Timers clocks prescalers selection
        ///
        /// Set and reset by software to control the clock frequency of all the timers connected to APB1 and APB2 domain.
        TIMPRE: enum(u1) {
            /// If the APB prescaler (PPRE1, PPRE2 in the RCC_CFGR register) is configured to a division factor of 1, TIMxCLK = HCKL . Otherwise, the timer clock frequencies are set to twice to the frequency of the APB domain to which the timers are connected: TIMxCLK = 2 x PCLKx.
            TWO_TIMES = 0,
            /// If the APB prescaler ( PPRE1, PPRE2 in the RCC_CFGR register) is configured to a division factor of 1 or 2, TIMxCLK = HCKL. Otherwise, the timer clock frequencies are set to four times to the frequency of the APB domain to which the timers are connected: TIMxCLK = 4 x PCLKx.
            FOUR_TIMES = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u7,
    },

    /// Parameters taken by the set_system_clock function.
    const SystemClockConfig = struct {
        /// The desired clock for the system.
        clock: Frequency,
        // is your application going to use USB? If so, the clock might differ from the specified to ensure the proper functioning of this peripheral (USB requires a 48 MHz clock and SDIO must be <= 50 MHz [UniMicro uses 48 to avoid conflicts with USB]).
        using_usb_or_sdio: bool = false,
        /// If your system has an available HSE (High Speed External oscillator) and you wish to use it for extra precision, pass its frequency here. If nothing is passed, it's assumed that the system does not have it or the user does not want to use it. In this case, the HSI is used as the clock source instead.
        hse: ?Frequency = null,

        /// Type of the clock value, if clock is in the kHz range set its value on the kHz field. If it is in the MHz range, set it in the MHz field.
        ///
        /// OBS: Please note that the maximum system clock for this chip is 100 MHz, which means that any value greater than that will be rejected by this function. Also note that the fields were created in this manner for a reason, please don't try to represent a 100 MHz frequency as 100.000 kHz, as it will also throw an error (this was done to use a shorter int size).
        const Frequency = union(enum) {
            /// If the clock is in the MHz range, set it here.
            ///
            /// OBS: This field is a 7 bits sized unsigned integer, since the biggest value accepted in it is 100, which fits in a 7 bit unsigned integer.
            MHz: u7,
            /// If the clock is in the kHz range, set it here.
            ///
            /// OBS: This field is a 17 bits sized unsigned integer, since the biggest value accepted in it is 99.999, which fits in a 17 bit unsigned integer.
            kHz: u17,
        };
    };

    /// Set the system clock to a desired value or the closest possible to it.
    ///
    /// This function attempts to find the coefficients for the PLL configuration register to match the desired value. If the desired clock is impossible using the selected clock soure, the closest possible value is used instead.
    ///
    /// If the user does not specify on the call that the USB or SDIO modules will be used, the function will not care for it. If those modules are used, make sure to pass it with the 'using_usb_or_sdio' parameter.
    ///
    /// By default, this function uses the HSI oscillator. If the user desires to use an HSE, its frequency must be informed in the 'hse' parameter. Please note that the maximum frequency that can be achieved with the HSI oscillator is 96 MHz.
    pub fn set_system_clock(self: *volatile ResetAndClockControl, comptime config: SystemClockConfig) void {
        const clock_in_khz: u32 = comptime switch (config.clock) {
            .kHz => |value| @as(u32, value),
            .MHz => |value| @as(u32, value) * 1000,
        };

        if (clock_in_khz > 100_000)
            @compileError("The device does not support a system clock higher than 100 MHz! Please change the function parameters and try again...");

        if (config.hse) |hse_freq| {
            const hse_freq_in_khz: u32 = comptime switch (hse_freq) {
                .kHz => |value| @as(u32, value),
                .MHz => |value| @as(u32, value) * 1000,
            };

            const coeffs = comptime calculate_PLL(hse_freq_in_khz, clock_in_khz, config.using_usb_or_sdio);
            self.PLLCFGR.PLLM = coeffs.m;
            self.PLLCFGR.PLLN = coeffs.n;
            self.PLLCFGR.PLLP = switch (coeffs.p) {
                2 => .DIV_BY_2,
                4 => .DIV_BY_4,
                6 => .DIV_BY_6,
                8 => .DIV_BY_8,
                else => unreachable,
            };
            self.PLLCFGR.PLLQ = coeffs.q;

            self.CR.HSEON = .HSE_ON;
            while (self.CR.HSERDY != .HSE_READY) asm volatile ("");

            self.PLLCFGR.PLLSRC = .HSE;

            const HPRE_div = comptime blk: {
                for (.{ 1, 2, 4, 8, 16 }) |div| {
                    const MAX_AHB_CLOCK = 100_000;
                    if (clock_in_khz / div <= MAX_AHB_CLOCK)
                        break :blk div;
                }
            };

            self.CFGR.HPRE = switch (HPRE_div) {
                1 => .NO_DIVISOR,
                2 => .DIV_BY_2,
                4 => .DIV_BY_4,
                8 => .DIV_BY_8,
                16 => .DIV_BY_16,
                else => unreachable,
            };

            self.CFGR.PPRE1 = comptime blk: {
                const divisor = for (.{ 1, 2, 4, 8, 16 }) |div| {
                    const MAX_APB1_CLOCK = 50_000;
                    if ((clock_in_khz / (HPRE_div * div)) <= MAX_APB1_CLOCK)
                        break div;
                };

                break :blk switch (divisor) {
                    1 => .NO_DIVISOR,
                    2 => .DIV_BY_2,
                    4 => .DIV_BY_4,
                    8 => .DIV_BY_8,
                    16 => .DIV_BY_16,
                    else => unreachable,
                };
            };

            self.CFGR.PPRE2 = comptime blk: {
                const divisor = for (.{ 1, 2, 4, 8, 16 }) |div| {
                    const MAX_APB2_CLOCK = 100_000;
                    if ((clock_in_khz / (HPRE_div * div)) <= MAX_APB2_CLOCK)
                        break div;
                };

                break :blk switch (divisor) {
                    1 => .NO_DIVISOR,
                    2 => .DIV_BY_2,
                    4 => .DIV_BY_4,
                    8 => .DIV_BY_8,
                    16 => .DIV_BY_16,
                    else => unreachable,
                };
            };

            self.CR.PLLON = .PLL_ON;
            while (self.CR.PLLRDY != .PLL_LOCKED) asm volatile ("");

            // FIXME: In the datasheet, there's a table that correlates the supply voltage with these values. For now, I've just adopted the values for 3.3V, but ideally this function should use the power interface to determine the suppky voltage and use the appropriate values.
            @import("flash.zig").flash.ACR.LATENCY = if (clock_in_khz <= 30_000) 0 else if (clock_in_khz <= 64_000) 1 else if (clock_in_khz <= 90_000) 2 else 3;

            self.CFGR.SW = .PLL;
            while (self.CFGR.SWS != .PLL) asm volatile ("");

            self.CR.HSION = .HSI_OFF;
        } else {
            const HSI_FREQ_IN_KHZ = 16 * 1000;

            const coeffs = comptime calculate_PLL(HSI_FREQ_IN_KHZ, clock_in_khz, config.using_usb_or_sdio);
            self.PLLCFGR.PLLM = coeffs.m;
            self.PLLCFGR.PLLN = coeffs.n;
            self.PLLCFGR.PLLP = switch (coeffs.p) {
                2 => .DIV_BY_2,
                4 => .DIV_BY_4,
                6 => .DIV_BY_6,
                8 => .DIV_BY_8,
                else => unreachable,
            };
            self.PLLCFGR.PLLQ = coeffs.q;

            self.CR.HSION = .HSI_ON;
            while (self.CR.HSIRDY != .HSI_READY) asm volatile ("");

            self.PLLCFGR.PLLSRC = .HSI;

            const HPRE_div = comptime blk: {
                for (.{ 1, 2, 4, 8, 16 }) |div| {
                    const MAX_AHB_CLOCK = 100_000;
                    if (clock_in_khz / div <= MAX_AHB_CLOCK)
                        break :blk div;
                }
            };

            self.CFGR.HPRE = switch (HPRE_div) {
                1 => .NO_DIVISOR,
                2 => .DIV_BY_2,
                4 => .DIV_BY_4,
                8 => .DIV_BY_8,
                16 => .DIV_BY_16,
                else => unreachable,
            };

            self.CFGR.PPRE1 = comptime blk: {
                const divisor = for (.{ 1, 2, 4, 8, 16 }) |div| {
                    const MAX_APB1_CLOCK = 50_000;
                    if ((clock_in_khz / (HPRE_div * div)) <= MAX_APB1_CLOCK)
                        break div;
                };

                break :blk switch (divisor) {
                    1 => .NO_DIVISOR,
                    2 => .DIV_BY_2,
                    4 => .DIV_BY_4,
                    8 => .DIV_BY_8,
                    16 => .DIV_BY_16,
                    else => unreachable,
                };
            };

            self.CFGR.PPRE2 = comptime blk: {
                const divisor = for (.{ 1, 2, 4, 8, 16 }) |div| {
                    const MAX_APB2_CLOCK = 100_000;
                    if ((clock_in_khz / (HPRE_div * div)) <= MAX_APB2_CLOCK)
                        break div;
                };

                break :blk switch (divisor) {
                    1 => .NO_DIVISOR,
                    2 => .DIV_BY_2,
                    4 => .DIV_BY_4,
                    8 => .DIV_BY_8,
                    16 => .DIV_BY_16,
                    else => unreachable,
                };
            };

            self.CR.PLLON = .PLL_ON;
            while (self.CR.PLLRDY != .PLL_LOCKED) asm volatile ("");

            // FIXME: In the datasheet, there's a table that correlates the supply voltage with these values. For now, I've just adopted the values for 3.3V, but ideally this function should use the power interface to determine the suppky voltage and use the appropriate values.
            @import("flash.zig").flash.ACR.LATENCY = if (clock_in_khz <= 30_000) 0 else if (clock_in_khz <= 64_000) 1 else if (clock_in_khz <= 90_000) 2 else 3;

            self.CFGR.SW = .PLL;
            while (self.CFGR.SWS != .PLL) asm volatile ("");

            self.CR.HSEON = .HSE_OFF;
        }
    }

    const CoefficientsPLL = struct {
        m: u6,
        n: u9,
        p: u4,
        q: u4,
    };
    fn calculate_PLL(comptime input_in_khz: u32, comptime output_in_khz: u32, comptime using_usb_or_sdio: bool) CoefficientsPLL {
        comptime {
            const std = @import("std");

            const USB_FREQ_IN_KHZ = 48 * 1000;
            var best_so_far: CoefficientsPLL = .{
                .m = 2,
                .n = 50,
                .p = 2,
                .q = 2,
            };
            var closest_system_clock = 0;
            var closest_system_clock_delta = std.math.maxInt(u32);

            // FIXME: There should be a way to determine this exact value, but for now I'm just gonna rawdog it
            @setEvalBranchQuota(1_000_000_000);

            return blk: {
                for (2..64) |iter_M| {
                    for (50..433) |iter_N| {
                        for (.{ 2, 4, 6, 8 }) |iter_P| {
                            for (2..16) |iter_Q| {
                                const current_system_clock = (input_in_khz * iter_N) / (iter_M * iter_P);
                                const current_system_clock_delta = if (current_system_clock < output_in_khz) output_in_khz - current_system_clock else current_system_clock - output_in_khz;

                                // If using USB or SDIO, their frequency must be 48 MHz
                                if (using_usb_or_sdio and ((input_in_khz * iter_N) / (iter_M * iter_Q)) != USB_FREQ_IN_KHZ)
                                    continue;

                                if (current_system_clock == output_in_khz) {
                                    break :blk .{ .m = iter_M, .n = iter_N, .p = iter_P, .q = iter_Q };
                                } else if (current_system_clock_delta < closest_system_clock_delta) {
                                    closest_system_clock = current_system_clock;
                                    closest_system_clock_delta = current_system_clock_delta;

                                    best_so_far = .{ .m = iter_M, .n = iter_N, .p = iter_P, .q = iter_Q };
                                }
                            }
                        }
                    }
                } else {
                    @compileLog("The desired clock could not be matched exactly!", .{});

                    if (using_usb_or_sdio)
                        @compileLog("You're using SDIO or USB, which means that this function favored achieving its necessary clock over the desired system clock!", .{});

                    @compileLog("The closest it could get to was: {[clock]d} kHz", .{ .clock = closest_system_clock });
                    @compileLog("The coefficients used were: M: {[m]d} | N: {[n]d} | P: {[p]d} | Q: {[q]d}", .{ .m = best_so_far.m, .n = best_so_far.n, .p = best_so_far.p, .q = best_so_far.q });

                    break :blk best_so_far;
                }
            };
        }
    }
};

/// Reset and clock control
pub const rcc: *volatile ResetAndClockControl = @ptrFromInt(0x40023800);

test "field_offsets" {
    const expect = @import("std").testing.expect;

    try expect(@offsetOf(ResetAndClockControl, "CR") == 0x00);
    try expect(@offsetOf(ResetAndClockControl, "PLLCFGR") == 0x04);
    try expect(@offsetOf(ResetAndClockControl, "CFGR") == 0x08);
    try expect(@offsetOf(ResetAndClockControl, "CIR") == 0x0C);
    try expect(@offsetOf(ResetAndClockControl, "AHB1RSTR") == 0x10);
    try expect(@offsetOf(ResetAndClockControl, "AHB2RSTR") == 0x14);
    try expect(@offsetOf(ResetAndClockControl, "APB1RSTR") == 0x20);
    try expect(@offsetOf(ResetAndClockControl, "APB2RSTR") == 0x24);
    try expect(@offsetOf(ResetAndClockControl, "AHB1ENR") == 0x30);
    try expect(@offsetOf(ResetAndClockControl, "AHB2ENR") == 0x34);
    try expect(@offsetOf(ResetAndClockControl, "APB1ENR") == 0x40);
    try expect(@offsetOf(ResetAndClockControl, "APB2ENR") == 0x44);
    try expect(@offsetOf(ResetAndClockControl, "AHB1LPENR") == 0x50);
    try expect(@offsetOf(ResetAndClockControl, "AHB2LPENR") == 0x54);
    try expect(@offsetOf(ResetAndClockControl, "APB1LPENR") == 0x60);
    try expect(@offsetOf(ResetAndClockControl, "APB2LPENR") == 0x64);
    try expect(@offsetOf(ResetAndClockControl, "BDCR") == 0x70);
    try expect(@offsetOf(ResetAndClockControl, "CSR") == 0x74);
    try expect(@offsetOf(ResetAndClockControl, "SSCGR") == 0x80);
    try expect(@offsetOf(ResetAndClockControl, "PLLI2SCFGR") == 0x84);
    try expect(@offsetOf(ResetAndClockControl, "DCKCFGR") == 0x8C);
}
