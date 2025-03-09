const std = @import("std");

const ResetAndClockControl = packed struct {
    /// RCC clock control register
    CR: packed struct(u32) {
        /// Internal high-speed clock enable
        ///
        /// Set and cleared by software.
        ///
        /// Set by hardware to force the HSI oscillator ON when leaving the Stop or Standby mode or in case of a failure of the HSE oscillator used directly or indirectly as the system clock. This bit cannot be cleared if the HSI is used directly or indirectly as the system clock.
        HSION: enum(u1) {
            HSI_OFF = 0,
            HSI_ON = 1,
        },
        /// Internal high-speed clock ready flag
        ///
        /// Set by hardware to indicate that the HSI oscillator is stable.
        ///
        /// After the HSION bit is cleared, HSIRDY goes low after 6 HSI clock cycles.
        HSIRDY: enum(u1) {
            HSI_NOT_READY = 0,
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
            HSE_OFF = 0,
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
            HSE_NOT_BYPASSED = 0,
            HSE_BYPASSED_WITH_EXTERNAL_CLOCK = 1,
        },
        /// Clock security system enable
        ///
        /// Set and cleared by software to enable the clock security system.
        ///
        /// When CSSON is set, the clock detector is enabled by hardware when the HSE oscillator is ready, and disabled by hardware if an oscillator failure is detected.
        CSSON: enum(u1) {
            CLOCK_SECURITY_OFF = 0,
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
            PLL_OFF = 0,
            PLL_ON = 1,
        },
        /// Main PLL (PLL) clock ready flag
        ///
        /// Set by hardware to indicate that PLL is locked.
        PLLRDY: enum(u1) {
            PLL_UNLOCKED = 0,
            PLL_LOCKED = 1,
        },
        /// PLLI2S enable
        ///
        /// Set and cleared by software to enable PLLI2S.
        ///
        /// Cleared by hardware when entering Stop or Standby mode.
        PLLI2SON: enum(u1) {
            PLLI2S_OFF = 0,
            PLLI2S_ON = 1,
        },
        /// PLLI2S clock ready flag
        ///
        /// Set by hardware to indicate that the PLLI2S is locked.
        PLLI2SRDY: enum(u1) {
            PLLI2S_UNLOCKED = 0,
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
            HSI = 0,
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
            HSI = 0b00,
            HSE = 0b01,
            PLL = 0b10,
        },
        /// System clock switch status
        ///
        /// Set and cleared by hardware to indicate which clock source is used as the system clock.
        SWS: enum(u2) {
            HSI = 0b00,
            HSE = 0b01,
            PLL = 0b10,
        },
        /// AHB prescaler
        ///
        /// Set and cleared by software to control AHB clock division factor.
        ///
        /// Caution: The clocks are divided with the new prescaler factor from 1 to 16 AHB cycles after HPRE write.
        HPRE: enum(u4) {
            NO_DIVISOR = 0b0000,
            DIV_BY_2 = 0b1000,
            DIV_BY_4 = 0b1001,
            DIV_BY_8 = 0b1010,
            DIV_BY_16 = 0b1011,
            DIV_BY_64 = 0b1100,
            DIV_BY_128 = 0b1101,
            DIV_BY_256 = 0b1110,
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
            NO_DIVISOR = 0b000,
            DIV_BY_2 = 0b100,
            DIV_BY_4 = 0b101,
            DIV_BY_8 = 0b110,
            DIV_BY_16 = 0b111,
        },
        /// APB high-speed prescaler (APB2)
        ///
        /// Set and cleared by software to control APB high-speed clock division factor.
        ///
        /// Caution: The software has to set these bits correctly not to exceed 100 MHz on this domain. The clocks are divided with the new prescaler factor from 1 to 16 AHB cycles after PPRE2 write.
        PPRE2: enum(u3) {
            NO_DIVISOR = 0b000,
            DIV_BY_2 = 0b100,
            DIV_BY_4 = 0b101,
            DIV_BY_8 = 0b110,
            DIV_BY_16 = 0b111,
        },
        /// HSE division factor for RTC clock
        ///
        /// Set and cleared by software to divide the HSE clock input clock to generate a 1 MHz clock for RTC.
        ///
        /// Caution: The software has to set these bits correctly to ensure that the clock supplied to the RTC is 1 MHz. These bits must be configured if needed before selecting the RTC clock source.
        RTCPRE: enum(u5) {
            NO_CLOCK = 0b00000,
            DIV_BY_2 = 0b00010,
            DIV_BY_3 = 0b00011,
            DIV_BY_4 = 0b00100,
            DIV_BY_5 = 0b00101,
            DIV_BY_6 = 0b00110,
            DIV_BY_7 = 0b00111,
            DIV_BY_8 = 0b01000,
            DIV_BY_9 = 0b01001,
            DIV_BY_10 = 0b01010,
            DIV_BY_11 = 0b01011,
            DIV_BY_12 = 0b01100,
            DIV_BY_13 = 0b01101,
            DIV_BY_14 = 0b01110,
            DIV_BY_15 = 0b01111,
            DIV_BY_16 = 0b10000,
            DIV_BY_17 = 0b10001,
            DIV_BY_18 = 0b10010,
            DIV_BY_19 = 0b10011,
            DIV_BY_20 = 0b10100,
            DIV_BY_21 = 0b10101,
            DIV_BY_22 = 0b10110,
            DIV_BY_23 = 0b10111,
            DIV_BY_24 = 0b11000,
            DIV_BY_25 = 0b11001,
            DIV_BY_26 = 0b11010,
            DIV_BY_27 = 0b11011,
            DIV_BY_28 = 0b11100,
            DIV_BY_29 = 0b11101,
            DIV_BY_30 = 0b11110,
            DIV_BY_31 = 0b11111,
        },
        /// Microcontroller clock output 1
        ///
        /// Set and cleared by software. Clock source selection may generate glitches on MCO1. It is highly recommended to configure these bits only after reset before enabling the external oscillators and PLL.
        MCO1: enum(u2) {
            HSI = 0b00,
            LSE = 0b01,
            HSE = 0b10,
            PLL = 0b11,
        },
        /// I2S clock selection
        ///
        /// Set and cleared by software. This bit allows to select the I2S clock source between the PLLI2S clock and the external clock. It is highly recommended to change this bit only after reset and before enabling the I2S module.
        I2SSRC: enum(u1) {
            PLLI2S = 0,
            I2S_CKIN = 1,
        },
        /// MCO1 prescaler
        ///
        /// Set and cleared by software to configure the prescaler of the MCO1. Modification of this prescaler may generate glitches on MCO1. It is highly recommended to change this prescaler only after reset before enabling the external oscillators and the PLL.
        MCO1PRE: enum(u3) {
            NO_DIVISION = 0b000,
            DIV_BY_2 = 0b100,
            DIV_BY_3 = 0b101,
            DIV_BY_4 = 0b110,
            DIV_BY_5 = 0b111,
        },
        /// MCO2 prescaler
        ///
        /// Set and cleared by software to configure the prescaler of the MCO2. Modification of this prescaler may generate glitches on MCO2. It is highly recommended to change this prescaler only after reset before enabling the external oscillators and the PLLs.
        MCO2PRE: enum(u3) {
            NO_DIVISION = 0b000,
            DIV_BY_2 = 0b100,
            DIV_BY_3 = 0b101,
            DIV_BY_4 = 0b110,
            DIV_BY_5 = 0b111,
        },
        /// Microcontroller clock output 2
        ///
        /// Set and cleared by software. Clock source selection may generate glitches on MCO2. It is highly recommended to configure these bits only after reset before enabling the external oscillators and the PLLs.
        MCO2: enum(u2) {
            SYSCLK = 0b00,
            PLLI2S = 0b01,
            HSE = 0b10,
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
        LSIRDYF: InterruptFlag,
        /// LSE ready interrupt flag
        ///
        /// Set by hardware when the External Low Speed clock becomes stable and LSERDYDIE is set.
        ///
        /// Cleared by software setting the LSERDYC bit.
        LSERDYF: InterruptFlag,
        /// HSI ready interrupt flag
        ///
        /// Set by hardware when the Internal High Speed clock becomes stable and HSIRDYDIE is set.
        ///
        /// Cleared by software setting the HSIRDYC bit.
        HSIRDYF: InterruptFlag,
        /// HSE ready interrupt flag
        ///
        /// Set by hardware when External High Speed clock becomes stable and HSERDYDIE is set.
        ///
        /// Cleared by software setting the HSERDYC bit.
        HSERDYF: InterruptFlag,
        /// Main PLL (PLL) ready interrupt flag
        ///
        /// Set by hardware when PLL locks and PLLRDYDIE is set.
        ///
        /// Cleared by software setting the PLLRDYC bit.
        PLLRDYF: InterruptFlag,
        /// PLLI2S ready interrupt flag
        ///
        /// Set by hardware when the PLLI2S locks and PLLI2SRDYDIE is set.
        ///
        /// Cleared by software setting the PLLRI2SDYC bit.
        PLLI2SRDYF: InterruptFlag,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u1,
        /// Clock security system interrupt flag
        ///
        /// Set by hardware when a failure is detected in the HSE oscillator.
        ///
        /// Cleared by software setting the CSSC bit.
        CSSF: InterruptFlag,
        /// LSI ready interrupt enable
        ///
        ///Set and cleared by software to enable/disable interrupt caused by LSI oscillator stabilization.
        LSIRDYIE: InterruptEnable,
        /// LSE ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by the LSE oscillator stabilization.
        LSERDYIE: InterruptEnable,
        /// HSI ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by the HSI oscillator stabilization.
        HSIRDYIE: InterruptEnable,
        /// HSE ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by the HSE oscillator stabilization.
        HSERDYIE: InterruptEnable,
        /// Main PLL (PLL) ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by PLL lock.
        PLLRDYIE: InterruptEnable,
        /// PLLI2S ready interrupt enable
        ///
        /// Set and cleared by software to enable/disable interrupt caused by PLLI2S lock.
        PLLI2SRDYIE: InterruptEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// LSI ready interrupt clear
        ///
        /// This bit is set by software to clear the LSIRDYF flag.
        LSIRDYC: ClearFlag,
        /// LSE ready interrupt clear
        ///
        /// This bit is set by software to clear the LSERDYF flag.
        LSERDYC: ClearFlag,
        /// HSI ready interrupt clear
        ///
        /// This bit is set software to clear the HSIRDYF flag.
        HSIRDYC: ClearFlag,
        /// HSE ready interrupt clear
        ///
        /// This bit is set by software to clear the HSERDYF flag.
        HSERDYC: ClearFlag,
        /// Main PLL(PLL) ready interrupt clear
        ///
        /// This bit is set by software to clear the PLLRDYF flag.
        PLLRDYC: ClearFlag,
        /// PLLI2S ready interrupt clear
        ///
        /// This bit is set by software to clear the PLLI2SRDYF flag.
        PLLI2SRDYC: ClearFlag,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// Clock security system interrupt clear
        ///
        /// This bit is set by software to clear the CSSF flag.
        CSSC: ClearFlag,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u8,
    },
    /// RCC AHB1 peripheral reset register
    AHB1RSTR: packed struct(u32) {
        /// IO port A reset
        ///
        /// Set and cleared by software.
        GPIOARST: ResetPeripheral,
        /// IO port B reset
        ///
        /// Set and cleared by software.
        GPIOBRST: ResetPeripheral,
        /// IO port C reset
        ///
        /// Set and cleared by software.
        GPIOCRST: ResetPeripheral,
        /// IO port D reset
        ///
        /// Set and cleared by software.
        GPIODRST: ResetPeripheral,
        /// IO port E reset
        ///
        /// Set and cleared by software.
        GPIOERST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// IO port H reset
        ///
        /// Set and cleared by software.
        GPIOHRST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u4,
        /// CRC reset
        ///
        /// Set and cleared by software.
        CRCRST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u8,
        /// DMA1 reset
        ///
        /// Set and cleared by software.
        DMA1RST: ResetPeripheral,
        /// DMA2 reset
        ///
        /// Set and cleared by software.
        DMA2RST: ResetPeripheral,
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
        OTGFSRST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u24,
    },
    /// This field is reserved. DO NOT ACCESS IT!
    _reserved1: u64,
    /// RCC APB1 peripheral reset register
    APB1RSTR: packed struct(u32) {
        /// TIM2 reset
        ///
        /// Set and cleared by software.
        TIM2: ResetPeripheral,
        /// TIM3 reset
        ///
        /// Set and cleared by software.
        TIM3: ResetPeripheral,
        /// TIM4 reset
        ///
        /// Set and cleared by software.
        TIM4: ResetPeripheral,
        /// TIM5 reset
        ///
        /// Set and cleared by software.
        TIM5: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// Window Watchdog reset
        ///
        /// Set and cleared by software.
        WWDGRST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// SPI2 reset
        ///
        /// Set and cleared by software.
        SPI2RST: ResetPeripheral,
        /// SPI3 reset
        ///
        /// Set and cleared by software.
        SPI3RST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// USART2 reset
        ///
        /// Set and cleared by software.
        USART2RST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u3,
        /// I2C1 reset
        ///
        /// Set and cleared by software.
        I2C1RST: ResetPeripheral,
        /// I2C2 reset
        ///
        /// Set and cleared by software.
        I2C2RST: ResetPeripheral,
        /// I2C3 reset
        ///
        /// Set and cleared by software.
        I2C3RST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u4,
        /// Power Interface reset
        ///
        /// Set and cleared by software.
        PWRRST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved: u3,
    },
    /// RCC APB2 peripheral reset register
    APB2RSTR: packed struct(u32) {
        /// TIM1 reset
        ///
        /// Set and cleared by software.
        TIM1RST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u3,
        /// USART1 reset
        ///
        /// Set and cleared by software.
        USART1RST: ResetPeripheral,
        /// USART6 reset
        ///
        /// Set and cleared by software.
        USART6RST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// ADC interface reset
        ///
        /// Set and cleared by software.
        ADC1RST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u2,
        /// SDIO reset
        ///
        /// Set and cleared by software.
        SDIORST: ResetPeripheral,
        /// SPI1 reset
        ///
        /// Set and cleared by software.
        SPI1RST: ResetPeripheral,
        /// SPI4 reset
        ///
        /// Set and cleared by software.
        SPI4RST: ResetPeripheral,
        /// System Configuration Controller reset
        ///
        /// Set and cleared by software.
        SYSCFGRST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u1,
        /// TIM9 reset
        ///
        /// Set and cleared by software.
        TIM9RST: ResetPeripheral,
        /// TIM10 reset
        ///
        /// Set and cleared by software.
        TIM10RST: ResetPeripheral,
        /// TIM11 reset
        ///
        /// Set and cleared by software.
        TIM11RST: ResetPeripheral,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u1,
        /// SPI5 reset
        ///
        /// Set and cleared by software.
        SPI5RST: ResetPeripheral,
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
        GPIOAEN: ClockEnable,
        /// IO port B clock enable
        ///
        /// Set and cleared by software.
        GPIOBEN: ClockEnable,
        /// IO port C clock enable
        ///
        /// Set and cleared by software.
        GPIOCEN: ClockEnable,
        /// IO port D clock enable
        ///
        /// Set and cleared by software.
        GPIODEN: ClockEnable,
        /// IO port E clock enable
        ///
        /// Set and cleared by software.
        GPIOEEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// IO port H clock enable
        ///
        /// Set and cleared by software.
        GPIOHEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u4,
        /// CRC clock enable
        ///
        /// Set and cleared by software.
        CRCEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u8,
        /// DMA1 clock enable
        ///
        /// Set and cleared by software.
        DMA1EN: ClockEnable,
        /// DMA2 clock enable
        ///
        /// Set and cleared by software.
        DMA2EN: ClockEnable,
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
        OTGFSEN: ClockEnable,
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
        TIM2EN: ClockEnable,
        /// TIM3 clock enable
        ///
        /// Set and cleared by software.
        TIM3EN: ClockEnable,
        /// TIM4 clock enable
        ///
        /// Set and cleared by software.
        TIM4EN: ClockEnable,
        /// TIM5 clock enable
        ///
        /// Set and cleared by software.
        TIM5EN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// Window Watchdog clock enable
        ///
        /// Set and cleared by software.
        WWDGEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// SPI2 clock enable
        ///
        /// Set and cleared by software.
        SPI2EN: ClockEnable,
        /// SPI3 clock enable
        ///
        /// Set and cleared by software.
        SPI3EN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// USART2 clock enable
        ///
        /// Set and cleared by software.
        USART2EN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u3,
        /// I2C1 clock enable
        ///
        /// Set and cleared by software.
        I2C1EN: ClockEnable,
        /// I2C2 clock enable
        ///
        /// Set and cleared by software.
        I2C2EN: ClockEnable,
        /// I2C3 clock enable
        ///
        /// Set and cleared by software.
        I2C3EN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u4,
        /// Power Interface clock enable
        ///
        /// Set and cleared by software.
        PWREN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved6: u3,
    },
    /// RCC APB2 peripheral clock enable register
    APB2ENR: packed struct(u32) {
        /// TIM1 clock enable
        ///
        /// Set and cleared by software.
        TIM1EN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u3,
        /// USART1 clock enable
        ///
        /// Set and cleared by software.
        USART1EN: ClockEnable,
        /// USART6 clock enable
        ///
        /// Set and cleared by software.
        USART6EN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// ADC interface clock enable
        ///
        /// Set and cleared by software.
        ADC1EN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u2,
        /// SDIO clock enable
        ///
        /// Set and cleared by software.
        SDIOEN: ClockEnable,
        /// SPI1 clock enable
        ///
        /// Set and cleared by software.
        SPI1EN: ClockEnable,
        /// SPI4 clock enable
        ///
        /// Set and cleared by software.
        SPI4EN: ClockEnable,
        /// System Configuration Controller clock enable
        ///
        /// Set and cleared by software.
        SYSCFGEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u1,
        /// TIM9 clock enable
        ///
        /// Set and cleared by software.
        TIM9EN: ClockEnable,
        /// TIM10 clock enable
        ///
        /// Set and cleared by software.
        TIM10EN: ClockEnable,
        /// TIM11 clock enable
        ///
        /// Set and cleared by software.
        TIM11EN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u1,
        /// SPI5 clock enable
        ///
        /// Set and cleared by software.
        SPI5EN: ClockEnable,
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
        GPIOALPEN: ClockEnable,
        /// IO port B clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOBLPEN: ClockEnable,
        /// IO port C clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOCLPEN: ClockEnable,
        /// IO port D clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIODLPEN: ClockEnable,
        /// IO port E clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOELPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// IO port H clock enable during sleep mode
        ///
        /// Set and cleared by software.
        GPIOHLPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u4,
        /// CRC clock enable during sleep mode
        ///
        /// Set and cleared by software.
        CRCLPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u2,
        /// Flash Interface clock enable during sleep mode
        ///
        /// Set and cleared by software.
        FLITLPEN: ClockEnable,
        /// SRAM1 Interface clock enable during sleep mode
        ///
        /// Set and cleared by software.
        SRAM1LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u4,
        /// DMA1 clock enable during sleep mode
        ///
        /// Set and cleared by software.
        DMA1LPEN: ClockEnable,
        /// DMA2 clock enable during sleep mode
        ///
        /// Set and cleared by software.
        DMA2LPEN: ClockEnable,
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
        OTGFSLPEN: ClockEnable,
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
        TIM2LPEN: ClockEnable,
        /// TIM3 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM3LPEN: ClockEnable,
        /// TIM4 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM4LPEN: ClockEnable,
        /// TIM5 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM5LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u7,
        /// Window Watchdog clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        WWDGLPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// SPI2 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI2LPEN: ClockEnable,
        /// SPI3 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI3LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u1,
        /// USART2 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        USART2LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u3,
        /// I2C1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        I2C1LPEN: ClockEnable,
        /// I2C2 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        I2C2LPEN: ClockEnable,
        /// I2C3 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        I2C3LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u4,
        /// Power Interface clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        PWRLPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved6: u3,
    },
    /// RCC APB2 peripheral clock enable in low power mode register
    APB2LPENR: packed struct(u32) {
        /// TIM1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM1LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u3,
        /// USART1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        USART1LPEN: ClockEnable,
        /// USART6 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        USART6LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u2,
        /// ADC1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        ADC1LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved3: u2,
        /// SDIO clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SDIOLPEN: ClockEnable,
        /// SPI1 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI1LPEN: ClockEnable,
        /// SPI4 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI4LPEN: ClockEnable,
        /// System Configuration Controller clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SYSCFGLPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved4: u1,
        /// TIM9 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM9LPEN: ClockEnable,
        /// TIM10 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM10LPEN: ClockEnable,
        /// TIM11 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        TIM11LPEN: ClockEnable,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved5: u1,
        /// SPI5 clock enable during Sleep mode
        ///
        /// Set and cleared by software.
        SPI5LPEN: ClockEnable,
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
            LSE_OFF = 0,
            LSE_ON = 1,
        },
        /// External low-speed oscillator ready
        ///
        /// Set and cleared by hardware to indicate when the external 32 kHz oscillator is stable. After the LSEON bit is cleared, LSERDY goes low after 6 external low-speed oscillator clock cycles.
        LSERDY: enum(u1) {
            LSE_NOT_READY = 0,
            LSE_READY = 1,
        },
        /// External low-speed oscillator bypass
        ///
        /// Set and cleared by software to bypass oscillator in debug mode. This bit can be written only when the LSE clock is disabled.
        LSEBYP: enum(u1) {
            LSE_NOT_BYPASSED = 0,
            LSE_BYPASSED = 1,
        },
        /// External low-speed oscillator bypass
        ///
        /// Set and reset by software to select crystal mode for low speed oscillator. Two power modes are available.
        LSEMOD: enum(u1) {
            LOW_POWER = 0,
            HIGH_DRIVE = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u4,
        /// RTC clock source selection
        ///
        /// Set by software to select the clock source for the RTC. Once the RTC clock source has been selected, it cannot be changed anymore unless the Backup domain is reset. The BDRST bit can be used to reset them.
        RTCSEL: enum(u2) {
            NO_CLOCK = 0b00,
            LSE = 0b01,
            LSI = 0b10,
            HSE = 0b11,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u5,
        /// RTC clock enable
        ///
        /// Set and cleared by software.
        RTCEN: ClockEnable,
        /// Backup domain software reset
        ///
        /// Set and cleared by software.
        BDRST: enum(u1) {
            DONT_RESET = 0,
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
            LSI_OFF = 0,
            LSI_ON = 1,
        },
        /// Internal low-speed oscillator ready
        ///
        /// Set and cleared by hardware to indicate when the internal RC 40 kHz oscillator is stable. After the LSION bit is cleared, LSIRDY goes low after 3 LSI clock cycles.
        LSIRDY: enum(u1) {
            LSI_NOT_READY = 0,
            LSI_READY = 1,
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u22,
        /// Remove reset flag
        ///
        /// Set by software to clear the reset flags.
        RMVF: ClearFlag,
        /// BOR (brownout) reset flag
        ///
        /// Cleared by software by writing the RMVF bit.
        ///
        /// Set by hardware when a POR/PDR (Power-on/power-down) or BOR (brownout) reset occurs.
        BORRSTF: ResetFlag,
        /// PIN reset flag
        ///
        /// Set by hardware when a reset from the NRST pin occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        PINRSTF: ResetFlag,
        /// POR/PDR (Power-on/power-down) reset flag
        ///
        /// Set by hardware when a POR/PDR (Power-on/power-down) reset occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        PORRSTF: ResetFlag,
        /// Software reset flag
        ///
        /// Set by hardware when a software reset occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        SFTRSTF: ResetFlag,
        /// Independent watchdog reset flag
        ///
        /// Set by hardware when an independent watchdog reset from V DD domain occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        IWDGRSTF: ResetFlag,
        /// Window watchdog reset flag
        ///
        /// Set by hardware when a window watchdog reset occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        WWDGRSTF: ResetFlag,
        ///  Low-power reset flag
        ///
        /// Set by hardware when a Low-power management reset occurs.
        ///
        /// Cleared by writing to the RMVF bit.
        LPWRRSTF: ResetFlag,
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
        /// /// Disable one or more peripherals during the Low Power mode
        ///
        /// Set and cleared by software. To write before setting CR[24]=PLLON bit.
        ///
        /// Configuration input for modulation profile amplitude.
        INCSTEP: u15,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// Reset one or more peripherals
        /// Spread Select
        ///
        /// Set and cleared by software. To write before to set CR[24]=PLLON bit.
        SPREADSEL: enum(u1) {
            CENTER = 0,
            DOWN = 1,
        },
        /// Spread spectrum modulation enable
        ///
        /// Set and cleared by software. To write after clearing CR[24]=PLLON bit
        SSCGEN: enum(u1) {
            DISABLE = 0,
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

    /// Possible values for the interrupt flag registers
    const InterruptFlag = enum(u1) {
        NOT_THE_INTERRUPT_SOURCE = 0,
        IS_INTERRUPT_SOURCE = 1,
    };

    /// Possible values for the interrupt enable registers
    const InterruptEnable = enum(u1) {
        INTERRUPT_DISABLED = 0,
        INTERRUPT_ENABLED = 1,
    };

    /// Possible values for the interrupt flag registers
    const ResetFlag = enum(u1) {
        NOT_THE_RESET_SOURCE = 0,
        IS_RESET_SOURCE = 1,
    };

    /// Possible values for the flag clear registers
    const ClearFlag = enum(u1) {
        NO_EFFECT = 0,
        CLEAR_FLAG = 1,
    };

    /// Possible values for the bits in the xENR and xLPENR registers
    const ClockEnable = enum(u1) {
        CLOCK_DISABLED = 0,
        CLOCK_ENABLED = 1,
    };

    /// Possible values for the bits in the xRSTR registers
    const ResetPeripheral = enum(u1) {
        DONT_RESET = 0,
        RESET = 1,
    };

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

    /// The coefficients used to calibrate the PLL's frequency
    const CoefficientsPLL = struct {
        m: u6,
        n: u9,
        p: u4,
        q: u4,
    };

    /// Auxiliar function used inside the set_system_clock function during compile time to determine the PLL coefficients to achieve the desired clock.
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

    /// Return type for the get_system_clock function. Basically a u17 with a fancy name to better express the unit it represents.
    const ClockInKHz = u17;

    /// Get the system clock according to the registers values.
    ///
    /// This function has a relatively large overhead to determine in runtime a value that's most likely well-known at compile time. Please consider this before using this and only do so when strictly necessary.
    ///
    /// OBS: Please note that this function has no way of knowing the frequency of the HSE oscillator. If you're using that as your clock source, please do not use this function as it will return an error every time!
    pub fn get_system_clock(self: *volatile ResetAndClockControl) !ClockInKHz {
        const HSI_FREQ_IN_KHZ = 16 * 1000;

        return switch (self.CFGR.SWS) {
            .HSE => error.UnknownHSE,
            .HSI => HSI_FREQ_IN_KHZ,
            .PLL => blk: {
                if (self.PLLCFGR.PLLSRC == .HSE)
                    break :blk error.UnknownHSE;

                const m: u32 = @intCast(self.PLLCFGR.PLLM);
                const n: u32 = @intCast(self.PLLCFGR.PLLN);
                const p: u32 = switch (self.PLLCFGR.PLLP) {
                    .DIV_BY_2 => 2,
                    .DIV_BY_4 => 4,
                    .DIV_BY_6 => 6,
                    .DIV_BY_8 => 8,
                };

                break :blk @intCast((HSI_FREQ_IN_KHZ * n) / (m * p));
            },
        };
    }

    /// All the peripherals that can be enabled, disabled or reset in this interface.
    const Peripheral = enum {
        GPIO_A,
        GPIO_B,
        GPIO_C,
        GPIO_D,
        GPIO_E,
        GPIO_H,
        CRC,
        DMA_1,
        DMA_2,
        USB_OTG,
        TIMER_1,
        TIMER_2,
        TIMER_3,
        TIMER_4,
        TIMER_5,
        TIMER_9,
        TIMER_10,
        TIMER_11,
        WINDOW_WATCHDOG,
        USART_1,
        USART_2,
        USART_6,
        SPI_1,
        SPI_2,
        SPI_3,
        SPI_4,
        SPI_5,
        I2C_1,
        I2C_2,
        I2C_3,
        POWER_INTERFACE,
        ADC_1,
        SDIO,
        SYSTEM_CONFIGURATION,
    };

    /// Enable one or more peripherals.
    ///
    /// OBS: This simply enables the peripherals, but each one of them still needs to be configured through their own registers to work properly.
    pub fn enable_peripherals(self: *volatile ResetAndClockControl, comptime peripherals: []const Peripheral) void {
        inline for (peripherals) |peripheral| {
            const register_prefix, const bit_prefix = peripheral_register_and_bit_prefixes(peripheral);
            @field(@field(self, std.fmt.comptimePrint("{s}ENR", register_prefix)), std.fmt.comptimePrint("{s}EN", bit_prefix)) = .CLOCK_ENABLED;
        }
    }

    /// Disable one or more peripherals.
    pub fn disable_peripherals(self: *volatile ResetAndClockControl, comptime peripherals: []const Peripheral) void {
        inline for (peripherals) |peripheral| {
            const register_prefix, const bit_prefix = peripheral_register_and_bit_prefixes(peripheral);
            @field(@field(self, std.fmt.comptimePrint("{s}ENR", register_prefix)), std.fmt.comptimePrint("{s}EN", bit_prefix)) = .CLOCK_DISABLED;
        }
    }

    /// Enable one or more peripherals during the Low Power mode.
    ///
    /// OBS: This only enables the peripheral during Low Power mode, to enable during normal mode use the enable_peripherals function.
    pub fn enable_peripherals_in_low_power(self: *volatile ResetAndClockControl, comptime peripherals: []const Peripheral) void {
        inline for (peripherals) |peripheral| {
            const register_prefix, const bit_prefix = peripheral_register_and_bit_prefixes(peripheral);
            @field(@field(self, std.fmt.comptimePrint("{s}LPENR", register_prefix)), std.fmt.comptimePrint("{s}LPEN", bit_prefix)) = .CLOCK_ENABLED;
        }
    }

    /// Disable one or more peripherals during the Low Power mode
    pub fn disable_peripherals_in_low_power(self: *volatile ResetAndClockControl, comptime peripherals: []const Peripheral) void {
        inline for (peripherals) |peripheral| {
            const register_prefix, const bit_prefix = peripheral_register_and_bit_prefixes(peripheral);
            @field(@field(self, std.fmt.comptimePrint("{s}LPENR", register_prefix)), std.fmt.comptimePrint("{s}LPEN", bit_prefix)) = .CLOCK_DISABLED;
        }
    }

    /// Reset one or more peripherals
    pub fn reset_peripherals(self: *volatile ResetAndClockControl, comptime peripherals: []const Peripheral) void {
        inline for (peripherals) |peripheral| {
            const register_prefix, const bit_prefix = peripheral_register_and_bit_prefixes(peripheral);

            // TODO(Lucas): Check if this is the correct way to do this
            @field(@field(self, std.fmt.comptimePrint("{s}RSTR", register_prefix)), std.fmt.comptimePrint("{s}RST", bit_prefix)) = .RESET;
            for (0..100_000) |_| asm volatile ("");
            @field(@field(self, std.fmt.comptimePrint("{s}RSTR", register_prefix)), std.fmt.comptimePrint("{s}RST", bit_prefix)) = .DONT_RESET;
        }
    }

    /// Auxiliar function used during compile time to aid in determining the register and bit names for each of the peripherals being enabled, disabled or reset.
    fn peripheral_register_and_bit_prefixes(comptime peripheral: Peripheral) struct { *const u8, *const u8 } {
        return comptime switch (peripheral) {
            .GPIO_A => .{ "AHB1", "GPIOA" },
            .GPIO_B => .{ "AHB1", "GPIOB" },
            .GPIO_C => .{ "AHB1", "GPIOC" },
            .GPIO_D => .{ "AHB1", "GPIOD" },
            .GPIO_E => .{ "AHB1", "GPIOE" },
            .GPIO_H => .{ "AHB1", "GPIOH" },
            .CRC => .{ "AHB1", "CRC" },
            .DMA_1 => .{ "AHB1", "DMA1" },
            .DMA_2 => .{ "AHB1", "DMA2" },
            .USB_OTG => .{ "AHB2", "OTGFS" },
            .TIMER_1 => .{ "APB2", "TIM1" },
            .TIMER_2 => .{ "APB1", "TIM2" },
            .TIMER_3 => .{ "APB1", "TIM3" },
            .TIMER_4 => .{ "APB1", "TIM4" },
            .TIMER_5 => .{ "APB1", "TIM5" },
            .TIMER_9 => .{ "APB2", "TIM9" },
            .TIMER_10 => .{ "APB2", "TIM10" },
            .TIMER_11 => .{ "APB2", "TIM11" },
            .WINDOW_WATCHDOG => .{ "APB1", "WWDG" },
            .USART_1 => .{ "APB2", "USART1" },
            .USART_2 => .{ "APB1", "USART2" },
            .USART_6 => .{ "APB2", "USART6" },
            .SPI_1 => .{ "APB2", "SPI1" },
            .SPI_2 => .{ "APB1", "SPI2" },
            .SPI_3 => .{ "APB1", "SPI3" },
            .SPI_4 => .{ "APB2", "SPI4" },
            .SPI_5 => .{ "APB2", "SPI5" },
            .I2C_1 => .{ "APB1", "I2C1" },
            .I2C_2 => .{ "APB1", "I2C2" },
            .I2C_3 => .{ "APB1", "I2C3" },
            .POWER_INTERFACE => .{ "APB1", "PWR" },
            .ADC_1 => .{ "APB2", "ADC1" },
            .SDIO => .{ "APB2", "SDIO" },
            .SYSTEM_CONFIGURATION => .{ "APB2", "SYSCFG" },
        };
    }

    /// All the possible sources of interrupts in this controller.
    const InterruptSource = enum {
        LSI_READY,
        LSE_READY,
        HSI_READY,
        HSE_READY,
        PLL_READY,
        PLL_I2S_READY,
    };

    /// Enable one or more of the interrupts from this controller.
    pub fn enable_interrupt(self: *volatile ResetAndClockControl, comptime interrupts: []const InterruptSource) void {
        inline for (interrupts) |interrupt| @field(self.CIR, std.fmt.comptimePrint("{s}IE", interrupt_bit_prefix(interrupt))) = .INTERRUPT_ENABLED;
    }

    /// Disable one or more of the interrupts from this controller.
    pub fn disable_interrupt(self: *volatile ResetAndClockControl, comptime interrupts: []const InterruptSource) void {
        inline for (interrupts) |interrupt| @field(self.CIR, std.fmt.comptimePrint("{s}IE", interrupt_bit_prefix(interrupt))) = .INTERRUPT_DISABLED;
    }

    /// Determine which of the interrupts sources from this controller generated the last interrupt.
    ///
    /// OBS: This function also clears the interrupt flag.
    pub fn determine_interrupt_source(self: *volatile ResetAndClockControl) ?InterruptSource {
        inline for (InterruptSource) |interrupt| {
            const bit_prefix = interrupt_bit_prefix(interrupt);

            if (@field(self.CIR, std.fmt.comptimePrint("{s}F", bit_prefix)) == .IS_INTERRUPT_SOURCE) {
                @field(self.CIR, std.fmt.comptimePrint("{s}C", bit_prefix)) = .CLEAR_FLAG;
                return interrupt;
            }
        }

        return null;
    }

    /// Auxiliar function used during compile time to aid in determining the bit name for each of the peripherals being enabled, disabled or reset.
    fn interrupt_bit_prefix(comptime interrupt: InterruptSource) *const u8 {
        return comptime switch (interrupt) {
            .LSI_READY => "LSIRDY",
            .LSE_READY => "LSERDY",
            .HSI_READY => "HSIRDY",
            .HSE_READY => "HSERDY",
            .PLL_READY => "PLLRDY",
            .PLL_I2S_READY => "PLLI2SRDY",
        };
    }
};

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
