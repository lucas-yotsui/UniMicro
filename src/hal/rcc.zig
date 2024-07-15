const ResetAndClockControl = packed struct {
    const CR = packed struct(u32) {
        hsi_on: bool,
        hsi_ready: bool,
        _reserved1: u1,
        hsi_trim: u5,
        hsi_cal: u8,
        hse_on: bool,
        hse_ready: bool,
        hse_bypass: bool,
        css_on: bool,
        _reserved2: u4,
        pll_on: bool,
        pll_ready: bool,
        pll_i2s_on: bool,
        pll_i2s_ready: bool,
        _reserved3: u4,
    };

    const PLLCFGR = packed struct(u32) {
        const PLLSource = enum(u1) {
            HSI = 0,
            HSE = 1,
        };

        pllm: u6,
        plln: u9,
        _reserved1: u1,
        pllp: u2,
        _reserved2: u4,
        pll_src: PLLSource,
        _reserved3: u1,
        pllq: u4,
        _reserved4: u4,
    };

    const CFGR = packed struct(u32) {
        const SystemClockSwitch = enum(u2) {
            HSI = 0b00,
            HSE = 0b01,
            PLL = 0b10,
            _INVALID = 0b11,
        };

        const AHBClockDivisionFactor = enum(u4) {
            NO_DIVISOR = 0b0000,
            DIV_BY_2 = 0b1000,
            DIV_BY_4 = 0b1001,
            DIV_BY_8 = 0b1010,
            DIV_BY_16 = 0b1011,
            DIV_BY_64 = 0b1100,
            DIV_BY_128 = 0b1101,
            DIV_BY_256 = 0b1110,
            DIV_BY_512 = 0b1111,
        };

        const APBClockDivisionFactor = enum(u3) {
            NO_DIVISOR = 0b000,
            DIV_BY_2 = 0b100,
            DIV_BY_4 = 0b101,
            DIV_BY_8 = 0b110,
            DIV_BY_16 = 0b111,
        };

        const HSEClockDivisionFactor = enum(u5) {
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
        };

        const Microcontroller1ClockOutputSwitch = enum(u2) {
            HSI = 0b00,
            LSE = 0b01,
            HSE = 0b10,
            PLL = 0b11,
        };

        const I2SClockSwitch = enum(u1) {
            PLLI2S = 0,
            I2S_CKIN = 1,
        };

        const MicrocontrolleClockDivisionFactor = enum(u3) {
            NO_DIVISION = 0b000,
            DIV_BY_2 = 0b100,
            DIV_BY_3 = 0b101,
            DIV_BY_4 = 0b110,
            DIV_BY_5 = 0b111,
        };

        const Microcontroller2ClockOutputSwitch = enum(u2) {
            SYSCLK = 0b00,
            PLLI2S = 0b01,
            HSE = 0b10,
            PLL = 0b11,
        };

        sw: SystemClockSwitch,
        sws: SystemClockSwitch,
        hpre: AHBClockDivisionFactor,
        _reserved: u2,
        ppre1: APBClockDivisionFactor,
        ppre2: APBClockDivisionFactor,
        rtcpre: HSEClockDivisionFactor,
        mco1: Microcontroller1ClockOutputSwitch,
        i2ssrc: I2SClockSwitch,
        mco1pre: MicrocontrolleClockDivisionFactor,
        mco2pre: MicrocontrolleClockDivisionFactor,
        mco2: Microcontroller2ClockOutputSwitch,
    };

    const CIR = packed struct(u32) {
        lsi_ready_int_flag: bool,
        lse_ready_int_flag: bool,
        hsi_ready_int_flag: bool,
        hse_ready_int_flag: bool,
        pll_ready_int_flag: bool,
        pll_i2s_ready_int_flag: bool,
        _reserved1: u1,
        clock_security_int_flag: bool,
        lsi_ready_int_enable: bool,
        lse_ready_int_enable: bool,
        hsi_ready_int_enable: bool,
        hse_ready_int_enable: bool,
        pll_ready_int_enable: bool,
        pll_i2s_ready_int_enable: bool,
        _reserved2: u2,
        lsi_ready_int_clear: bool,
        lse_ready_int_clear: bool,
        hsi_ready_int_clear: bool,
        hse_ready_int_clear: bool,
        pll_ready_int_clear: bool,
        pll_i2s_ready_int_clear: bool,
        _reserved3: u1,
        clock_security_int_clear: bool,
        _reserved4: u8,
    };

    const AHB1RST = packed struct(u32) {
        gpio_a: bool,
        gpio_b: bool,
        gpio_c: bool,
        gpio_d: bool,
        gpio_e: bool,
        _reserved1: u2,
        gpio_h: bool,
        _reserved2: u4,
        crc: bool,
        _reserved3: u8,
        dma1: bool,
        dma2: bool,
        _reserved4: u9,
    };

    const AHB2RST = packed struct(u32) {
        _reserved1: u7,
        usb_otg_fs: bool,
        _reserved2: u24,
    };

    const APB1RST = packed struct(u32) {
        timer2: bool,
        timer3: bool,
        timer4: bool,
        timer5: bool,
        _reserved1: u7,
        window_watchdog: bool,
        _reserved2: u2,
        spi2: bool,
        spi3: bool,
        _reserved3: u1,
        usart2: bool,
        _reserved4: u3,
        i2c1: bool,
        i2c2: bool,
        i2c3: bool,
        _reserved5: u4,
        power_interface: bool,
        _reserved: u3,
    };

    const APB2RST = packed struct(u32) {
        timer1: bool,
        _reserved1: u3,
        usart1: bool,
        usart6: bool,
        _reserved2: u2,
        adc1: bool,
        _reserved3: u2,
        sdio: bool,
        spi1: bool,
        spi4: bool,
        sys_cfg: bool,
        _reserved4: u1,
        timer9: bool,
        timer10: bool,
        timer11: bool,
        _reserved5: u1,
        spi5: bool,
        _reserved6: u11,
    };

    const AHB1EN = packed struct(u32) {
        gpio_a: bool,
        gpio_b: bool,
        gpio_c: bool,
        gpio_d: bool,
        gpio_e: bool,
        _reserved1: u2,
        gpio_h: bool,
        _reserved2: u4,
        crc: bool,
        _reserved3: u8,
        dma1: bool,
        dma2: bool,
        _reserved4: u9,
    };

    const AHB2EN = packed struct(u32) {
        _reserved1: u7,
        usb_otg_fs: bool,
        _reserved2: u24,
    };

    const APB1EN = packed struct(u32) {
        timer2: bool,
        timer3: bool,
        timer4: bool,
        timer5: bool,
        _reserved1: u7,
        window_watchdog: bool,
        _reserved2: u2,
        spi2: bool,
        spi3: bool,
        _reserved3: u1,
        usart2: bool,
        _reserved4: u3,
        i2c1: bool,
        i2c2: bool,
        i2c3: bool,
        _reserved5: u4,
        power_interface: bool,
        _reserved6: u3,
    };

    const APB2EN = packed struct(u32) {
        timer1: bool,
        _reserved1: u3,
        usart1: bool,
        usart6: bool,
        _reserved2: u2,
        adc1: bool,
        _reserved3: u2,
        sdio: bool,
        spi1: bool,
        spi4: bool,
        sys_cfg: bool,
        _reserved4: u1,
        timer9: bool,
        timer10: bool,
        timer11: bool,
        _reserved5: u1,
        spi5: bool,
        _reserved6: u11,
    };

    const AHB1LPEN = packed struct(u32) {
        gpio_a: bool,
        gpio_b: bool,
        gpio_c: bool,
        gpio_d: bool,
        gpio_e: bool,
        _reserved1: u2,
        gpio_h: bool,
        _reserved3: u4,
        crc: bool,
        _reserved4: u2,
        flash_interface: bool,
        sram1: bool,
        _reserved5: u4,
        dma1: bool,
        dma2: bool,
        _reserved6: u9,
    };

    const AHB2LPEN = packed struct(u32) {
        _reserved1: u7,
        usb_otg_fs: bool,
        _reserved2: u24,
    };

    cr: CR,
    pllcfg: PLLCFGR,
    cfgr: CFGR,
    cir: CIR,
    ahb1rst: AHB1RST,
    ahb2rst: AHB2RST,
    _reserved1: u64,
    apb1rst: APB1RST,
    apb2rst: APB2RST,
    _reserved2: u64,
    ahb1en: AHB1EN,
    ahb2en: AHB2EN,
    _reserved3: u64,
    apb1en: APB1EN,
    apb2en: APB2EN,
    _reserved4: u64,
    ahb1lpen: AHB1LPEN,
    ahb2lpen: AHB2LPEN,
    _reserved5: u64,
};

pub const rcc: *volatile ResetAndClockControl = @ptrFromInt(0x40023800);

test "field_offsets" {
    const expect = @import("std").testing.expect;

    try expect(@offsetOf(ResetAndClockControl, "cr") == 0x00);
    try expect(@offsetOf(ResetAndClockControl, "pllcfg") == 0x04);
    try expect(@offsetOf(ResetAndClockControl, "cfgr") == 0x08);
    try expect(@offsetOf(ResetAndClockControl, "cir") == 0x0C);
    try expect(@offsetOf(ResetAndClockControl, "ahb1rst") == 0x10);
    try expect(@offsetOf(ResetAndClockControl, "ahb2rst") == 0x14);
    try expect(@offsetOf(ResetAndClockControl, "apb1rst") == 0x20);
    try expect(@offsetOf(ResetAndClockControl, "apb2rst") == 0x24);
    try expect(@offsetOf(ResetAndClockControl, "ahb1en") == 0x30);
    try expect(@offsetOf(ResetAndClockControl, "ahb2en") == 0x34);
    try expect(@offsetOf(ResetAndClockControl, "apb1en") == 0x40);
    try expect(@offsetOf(ResetAndClockControl, "apb2en") == 0x44);
    try expect(@offsetOf(ResetAndClockControl, "ahb1lpen") == 0x50);
    try expect(@offsetOf(ResetAndClockControl, "ahb2lpen") == 0x54);
}
