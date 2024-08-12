const InterruptSource = enum {
    NMI,
    HARD_FAULT,
    MEMORY_MANAGEMENT_FAULT,
    BUS_FAULT,
    USAGE_FAULT,
    SVCALL,
    DEBUG_MONITOR,
    PENDSV,
    SYSTICK,
    WINDOW_WATCHDOG,
    EXTI_16_PVD,
    EXTI_21_TAMPER_TIMESTAMP,
    EXTI_22_RTC_WAKEUP,
    FLASH,
    RCC,
    EXTI_LINE_0,
    EXTI_LINE_1,
    EXTI_LINE_2,
    EXTI_LINE_3,
    EXTI_LINE_4,
    DMA1_STREAM0,
    DMA1_STREAM1,
    DMA1_STREAM2,
    DMA1_STREAM3,
    DMA1_STREAM4,
    DMA1_STREAM5,
    DMA1_STREAM6,
    ADC,
    EXTI_LINE_5_TO_9,
    TIMER1_BREAK_AND_TIMER9_GLOBAL,
    TIMER1_UPDATE_AND_TIMER10_GLOBAL,
    TIMER1_TRIGGER_AND_COMMUTATION_AND_TIMER11_GLOBAL,
    TIMER1_CAPTURE_COMPARE,
    TIMER2_GLOBAL,
    TIMER3_GLOBAL,
    TIMER4_GLOBAL,
    I2C1_EVENT,
    I2C1_ERROR,
    I2C2_EVENT,
    I2C2_ERROR,
    SPI1_GLOBAL,
    SPI2_GLOBAL,
    USART1_GLOBAL,
    USART2_GLOBAL,
    EXTI_LINE_10_TO_15,
    EXTI_LINE_17_AND_RTC_ALARM,
    EXTI_LINE_18_AND_USB_OTG_FS_WAKEUP,
    DMA1_STREAM7,
    SDIO_GLOBAL,
    TIMER5_GLOBAL,
    SPI3_GLOBAL,
    DMA2_STREAM0,
    DMA2_STREAM1,
    DMA2_STREAM2,
    DMA2_STREAM3,
    DMA2_STREAM4,
    USB_OTG_FS_GLOBAL,
    DMA2_STREAM5,
    DMA2_STREAM6,
    DMA2_STREAM7,
    USART6_GLOBAL,
    I2C3_EVENT,
    I2C3_ERROR,
    FPU_GLOBAL,
    SPI4_GLOBAL,
    SPI5_GLOBAL,
};

pub inline fn register_interrupt_handler(comptime callback: anytype, source: InterruptSource) void {
    const symbol_name = switch (source) {
        .NMI => "nmi_fault_handler",
        .HARD_FAULT => "hard_fault_handler",
        .MEMORY_MANAGEMENT_FAULT => "memory_management_fault_handler",
        .BUS_FAULT => "bus_fault_handler",
        .USAGE_FAULT => "usage_fault_handler",
        .SVCALL => "svcall_handler",
        .DEBUG_MONITOR => "debug_monitor_handler",
        .PENDSV => "pendsv_handler",
        .SYSTICK => "systick_handler",
        .WINDOW_WATCHDOG => "window_watchdog_handler",
        .EXTI_16_PVD => "exti_16_pvd_handler",
        .EXTI_21_TAMPER_TIMESTAMP => "exti_21_tamper_timestamp_handler",
        .EXTI_22_RTC_WAKEUP => "exti_22_rtc_wakeup_handler",
        .FLASH => "flash_handler",
        .RCC => "rcc_handler",
        .EXTI_LINE_0 => "exti_line_0_handler",
        .EXTI_LINE_1 => "exti_line_1_handler",
        .EXTI_LINE_2 => "exti_line_2_handler",
        .EXTI_LINE_3 => "exti_line_3_handler",
        .EXTI_LINE_4 => "exti_line_4_handler",
        .DMA1_STREAM0 => "dma1_stream0_handler",
        .DMA1_STREAM1 => "dma1_stream1_handler",
        .DMA1_STREAM2 => "dma1_stream2_handler",
        .DMA1_STREAM3 => "dma1_stream3_handler",
        .DMA1_STREAM4 => "dma1_stream4_handler",
        .DMA1_STREAM5 => "dma1_stream5_handler",
        .DMA1_STREAM6 => "dma1_stream6_handler",
        .ADC => "adc_handler",
        .EXTI_LINE_5_TO_9 => "exti_line_5_to_9_handler",
        .TIMER1_BREAK_AND_TIMER9_GLOBAL => "timer1_break_and_timer9_global_handler",
        .TIMER1_UPDATE_AND_TIMER10_GLOBAL => "timer1_update_and_timer10_global_handler",
        .TIMER1_TRIGGER_AND_COMMUTATION_AND_TIMER11_GLOBAL => "timer1_trigger_and_commutation_and_timer11_global_handler",
        .TIMER1_CAPTURE_COMPARE => "timer1_capture_compare_handler",
        .TIMER2_GLOBAL => "timer2_global_handler",
        .TIMER3_GLOBAL => "timer3_global_handler",
        .TIMER4_GLOBAL => "timer4_global_handler",
        .I2C1_EVENT => "i2c1_event_handler",
        .I2C1_ERROR => "i2c1_error_handler",
        .I2C2_EVENT => "i2c2_event_handler",
        .I2C2_ERROR => "i2c2_error_handler",
        .SPI1_GLOBAL => "spi1_global_handler",
        .SPI2_GLOBAL => "spi2_global_handler",
        .USART1_GLOBAL => "usart1_global_handler",
        .USART2_GLOBAL => "usart2_global_handler",
        .EXTI_LINE_10_TO_15 => "exti_line_10_to_15_handler",
        .EXTI_LINE_17_AND_RTC_ALARM => "exti_line_17_and_rtc_alarm_handler",
        .EXTI_LINE_18_AND_USB_OTG_FS_WAKEUP => "exti_line_18_and_usb_otg_fs_wakeup_handler",
        .DMA1_STREAM7 => "dma1_stream7_handler",
        .SDIO_GLOBAL => "sdio_global_handler",
        .TIMER5_GLOBAL => "timer5_global_handler",
        .SPI3_GLOBAL => "spi3_global_handler",
        .DMA2_STREAM0 => "dma2_stream0_handler",
        .DMA2_STREAM1 => "dma2_stream1_handler",
        .DMA2_STREAM2 => "dma2_stream2_handler",
        .DMA2_STREAM3 => "dma2_stream3_handler",
        .DMA2_STREAM4 => "dma2_stream4_handler",
        .USB_OTG_FS_GLOBAL => "usb_otg_fs_global_handler",
        .DMA2_STREAM5 => "dma2_stream5_handler",
        .DMA2_STREAM6 => "dma2_stream6_handler",
        .DMA2_STREAM7 => "dma2_stream7_handler",
        .USART6_GLOBAL => "usart6_global_handler",
        .I2C3_EVENT => "i2c3_event_handler",
        .I2C3_ERROR => "i2c3_error_handler",
        .FPU_GLOBAL => "fpu_global_handler",
        .SPI4_GLOBAL => "spi4_global_handler",
        .SPI5_GLOBAL => "spi5_global_handler",
    };

    // If the calling convention is wrong, create a small wrapper around the function
    const handler = switch (@typeInfo(@TypeOf(callback)).Fn.calling_convention) {
        .C, .Naked => callback,
        .Unspecified => struct {
            fn wrapper() callconv(.C) void {
                @call(.always_inline, callback, .{});
            }
        }.wrapper,
        else => @compileError("Unsupported call convention!"),
    };

    @export(handler, .{ .name = symbol_name, .linkage = .strong });
}

const EXTI = packed struct {
    IMR: packed struct(u32) {
        line_0: bool,
        line_1: bool,
        line_2: bool,
        line_3: bool,
        line_4: bool,
        line_5: bool,
        line_6: bool,
        line_7: bool,
        line_8: bool,
        line_9: bool,
        line_10: bool,
        line_11: bool,
        line_12: bool,
        line_13: bool,
        line_14: bool,
        line_15: bool,
        line_16: bool,
        line_17: bool,
        line_18: bool,
        _reserved1: u2,
        line_21: bool,
        line_22: bool,
        _reserved2: u9,
    },
    EMR: packed struct(u32) {
        line_0: bool,
        line_1: bool,
        line_2: bool,
        line_3: bool,
        line_4: bool,
        line_5: bool,
        line_6: bool,
        line_7: bool,
        line_8: bool,
        line_9: bool,
        line_10: bool,
        line_11: bool,
        line_12: bool,
        line_13: bool,
        line_14: bool,
        line_15: bool,
        line_16: bool,
        line_17: bool,
        line_18: bool,
        _reserved1: u2,
        line_21: bool,
        line_22: bool,
        _reserved2: u9,
    },
    RTSR: packed struct(u32) {
        line_0: bool,
        line_1: bool,
        line_2: bool,
        line_3: bool,
        line_4: bool,
        line_5: bool,
        line_6: bool,
        line_7: bool,
        line_8: bool,
        line_9: bool,
        line_10: bool,
        line_11: bool,
        line_12: bool,
        line_13: bool,
        line_14: bool,
        line_15: bool,
        line_16: bool,
        line_17: bool,
        line_18: bool,
        _reserved1: u2,
        line_21: bool,
        line_22: bool,
        _reserved2: u9,
    },
    FTSR: packed struct(u32) {
        line_0: bool,
        line_1: bool,
        line_2: bool,
        line_3: bool,
        line_4: bool,
        line_5: bool,
        line_6: bool,
        line_7: bool,
        line_8: bool,
        line_9: bool,
        line_10: bool,
        line_11: bool,
        line_12: bool,
        line_13: bool,
        line_14: bool,
        line_15: bool,
        line_16: bool,
        line_17: bool,
        line_18: bool,
        _reserved1: u2,
        line_21: bool,
        line_22: bool,
        _reserved2: u9,
    },
    SWIER: packed struct(u32) {
        line_0: bool,
        line_1: bool,
        line_2: bool,
        line_3: bool,
        line_4: bool,
        line_5: bool,
        line_6: bool,
        line_7: bool,
        line_8: bool,
        line_9: bool,
        line_10: bool,
        line_11: bool,
        line_12: bool,
        line_13: bool,
        line_14: bool,
        line_15: bool,
        line_16: bool,
        line_17: bool,
        line_18: bool,
        _reserved1: u2,
        line_21: bool,
        line_22: bool,
        _reserved2: u9,
    },
    PR: packed struct(u32) {
        line_0: bool,
        line_1: bool,
        line_2: bool,
        line_3: bool,
        line_4: bool,
        line_5: bool,
        line_6: bool,
        line_7: bool,
        line_8: bool,
        line_9: bool,
        line_10: bool,
        line_11: bool,
        line_12: bool,
        line_13: bool,
        line_14: bool,
        line_15: bool,
        line_16: bool,
        line_17: bool,
        line_18: bool,
        _reserved1: u2,
        line_21: bool,
        line_22: bool,
        _reserved2: u9,
    },
};

pub const exti: *volatile EXTI = @ptrFromInt(0x40013C00);

test "field_offsets" {
    const expect = @import("std").testing.expect;

    try expect(@offsetOf(EXTI, "IMR") == 0x00);
    try expect(@offsetOf(EXTI, "EMR") == 0x04);
    try expect(@offsetOf(EXTI, "RTSR") == 0x08);
    try expect(@offsetOf(EXTI, "FTSR") == 0x0C);
    try expect(@offsetOf(EXTI, "SWIER") == 0x10);
    try expect(@offsetOf(EXTI, "PR") == 0x14);
}

// Pointer to the top of the stack. It isn't really a function
// but if not declared like this compiler keeps complaining so
// this is a temporary solution
extern fn _stack_top() void;

extern fn unimicro_main() callconv(.C) noreturn;
extern fn nmi_fault_handler() callconv(.C) void;
extern fn hard_fault_handler() callconv(.C) void;
extern fn memory_management_fault_handler() callconv(.C) void;
extern fn bus_fault_handler() callconv(.C) void;
extern fn usage_fault_handler() callconv(.C) void;
extern fn svcall_handler() callconv(.C) void;
extern fn debug_monitor_handler() callconv(.C) void;
extern fn pendsv_handler() callconv(.C) void;
extern fn systick_handler() callconv(.C) void;
extern fn window_watchdog_handler() callconv(.C) void;
extern fn exti_16_pvd_handler() callconv(.C) void;
extern fn exti_21_tamper_timestamp_handler() callconv(.C) void;
extern fn exti_22_rtc_wakeup_handler() callconv(.C) void;
extern fn flash_handler() callconv(.C) void;
extern fn rcc_handler() callconv(.C) void;
extern fn exti_line_0_handler() callconv(.C) void;
extern fn exti_line_1_handler() callconv(.C) void;
extern fn exti_line_2_handler() callconv(.C) void;
extern fn exti_line_3_handler() callconv(.C) void;
extern fn exti_line_4_handler() callconv(.C) void;
extern fn dma1_stream0_handler() callconv(.C) void;
extern fn dma1_stream1_handler() callconv(.C) void;
extern fn dma1_stream2_handler() callconv(.C) void;
extern fn dma1_stream3_handler() callconv(.C) void;
extern fn dma1_stream4_handler() callconv(.C) void;
extern fn dma1_stream5_handler() callconv(.C) void;
extern fn dma1_stream6_handler() callconv(.C) void;
extern fn adc_handler() callconv(.C) void;
extern fn exti_line_5_to_9_handler() callconv(.C) void;
extern fn timer1_break_and_timer9_global_handler() callconv(.C) void;
extern fn timer1_update_and_timer10_global_handler() callconv(.C) void;
extern fn timer1_trigger_and_commutation_and_timer11_global_handler() callconv(.C) void;
extern fn timer1_capture_compare_handler() callconv(.C) void;
extern fn timer2_global_handler() callconv(.C) void;
extern fn timer3_global_handler() callconv(.C) void;
extern fn timer4_global_handler() callconv(.C) void;
extern fn i2c1_event_handler() callconv(.C) void;
extern fn i2c1_error_handler() callconv(.C) void;
extern fn i2c2_event_handler() callconv(.C) void;
extern fn i2c2_error_handler() callconv(.C) void;
extern fn spi1_global_handler() callconv(.C) void;
extern fn spi2_global_handler() callconv(.C) void;
extern fn usart1_global_handler() callconv(.C) void;
extern fn usart2_global_handler() callconv(.C) void;
extern fn exti_line_10_to_15_handler() callconv(.C) void;
extern fn exti_line_17_and_rtc_alarm_handler() callconv(.C) void;
extern fn exti_line_18_and_usb_otg_fs_wakeup_handler() callconv(.C) void;
extern fn dma1_stream7_handler() callconv(.C) void;
extern fn sdio_global_handler() callconv(.C) void;
extern fn timer5_global_handler() callconv(.C) void;
extern fn spi3_global_handler() callconv(.C) void;
extern fn dma2_stream0_handler() callconv(.C) void;
extern fn dma2_stream1_handler() callconv(.C) void;
extern fn dma2_stream2_handler() callconv(.C) void;
extern fn dma2_stream3_handler() callconv(.C) void;
extern fn dma2_stream4_handler() callconv(.C) void;
extern fn usb_otg_fs_global_handler() callconv(.C) void;
extern fn dma2_stream5_handler() callconv(.C) void;
extern fn dma2_stream6_handler() callconv(.C) void;
extern fn dma2_stream7_handler() callconv(.C) void;
extern fn usart6_global_handler() callconv(.C) void;
extern fn i2c3_event_handler() callconv(.C) void;
extern fn i2c3_error_handler() callconv(.C) void;
extern fn fpu_global_handler() callconv(.C) void;
extern fn spi4_global_handler() callconv(.C) void;
extern fn spi5_global_handler() callconv(.C) void;

// Default handler, does absolutely nothing but to wait for
// inspection with a debugger
export fn default_handler() noreturn {
    while (true) {}
}

export const vector_table linksection(".vector") = [_]?*const fn () callconv(.C) void{
    _stack_top, // Pointer to the top of the Stack
    unimicro_main, // Reset handler
    nmi_fault_handler, // NMI handler
    hard_fault_handler, // Hard fault handler
    memory_management_fault_handler, // Memory management fault handler
    bus_fault_handler, // Bus fault handler
    usage_fault_handler, // Usage fault handler
    null, // Reserved
    null, // Reserved
    null, // Reserved
    null, // Reserved
    svcall_handler, // SVcall handler
    debug_monitor_handler, // Debug monitor handler
    null, // Reserved
    pendsv_handler, // PendSV handler
    systick_handler, // Systick handler
    window_watchdog_handler, // Window Watchdog handler
    exti_16_pvd_handler, //exti_16_pvd_handler
    exti_21_tamper_timestamp_handler, //exti_21_tamper_timestamp_handler
    exti_22_rtc_wakeup_handler, //exti_22_rtc_wakeup_handler
    flash_handler, //flash_handler
    rcc_handler, //rcc_handler
    exti_line_0_handler, //exti_line_0_handler
    exti_line_1_handler, //exti_line_1_handler
    exti_line_2_handler, //exti_line_2_handler
    exti_line_3_handler, //exti_line_3_handler
    exti_line_4_handler, //exti_line_4_handler
    dma1_stream0_handler, //dma1_stream0_handler
    dma1_stream1_handler, //dma1_stream1_handler
    dma1_stream2_handler, //dma1_stream2_handler
    dma1_stream3_handler, //dma1_stream3_handler
    dma1_stream4_handler, //dma1_stream4_handler
    dma1_stream5_handler, //dma1_stream5_handler
    dma1_stream6_handler, //dma1_stream6_handler
    adc_handler, //adc_handler
    exti_line_5_to_9_handler, //exti_line_5_to_9_handler
    timer1_break_and_timer9_global_handler, //timer1_break_and_timer9_global_handler
    timer1_update_and_timer10_global_handler, //timer1_update_and_timer10_global_handler
    timer1_trigger_and_commutation_and_timer11_global_handler, //timer1_trigger_and_commutation_and_timer11_global_handler
    timer1_capture_compare_handler, //timer1_capture_compare_handler
    timer2_global_handler, //timer2_global_handler
    timer3_global_handler, //timer3_global_handler
    timer4_global_handler, //timer4_global_handler
    i2c1_event_handler, //i2c1_event_handler
    i2c1_error_handler, //i2c1_error_handler
    i2c2_event_handler, //i2c2_event_handler
    i2c2_error_handler, //i2c2_error_handler
    spi1_global_handler, //spi1_global_handler
    spi2_global_handler, //spi2_global_handler
    usart1_global_handler, //usart1_global_handler
    usart2_global_handler, //usart2_global_handler
    exti_line_10_to_15_handler, //exti_line_10_to_15_handler
    exti_line_17_and_rtc_alarm_handler, //exti_line_17_and_rtc_alarm_handler
    exti_line_18_and_usb_otg_fs_wakeup_handler, //exti_line_18_and_usb_otg_fs_wakeup_handler
    dma1_stream7_handler, //dma1_stream7_handler
    sdio_global_handler, //sdio_global_handler
    timer5_global_handler, //timer5_global_handler
    spi3_global_handler, //spi3_global_handler
    dma2_stream0_handler, //dma2_stream0_handler
    dma2_stream1_handler, //dma2_stream1_handler
    dma2_stream2_handler, //dma2_stream2_handler
    dma2_stream3_handler, //dma2_stream3_handler
    dma2_stream4_handler, //dma2_stream4_handler
    usb_otg_fs_global_handler, //usb_otg_fs_global_handler
    dma2_stream5_handler, //dma2_stream5_handler
    dma2_stream6_handler, //dma2_stream6_handler
    dma2_stream7_handler, //dma2_stream7_handler
    usart6_global_handler, //usart6_global_handler
    i2c3_event_handler, //i2c3_event_handler
    i2c3_error_handler, //i2c3_error_handler
    fpu_global_handler, //fpu_global_handler
    spi4_global_handler, //spi4_global_handler
    spi5_global_handler, //spi5_global_handler
};
