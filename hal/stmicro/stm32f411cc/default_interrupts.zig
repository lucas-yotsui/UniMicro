comptime {
    const NestedVectorInterruptController = extern struct {
        stack_top: *const u32 = @extern(*const u32, .{ .name = "_stack_top" }),
        reset: Handler = @extern(*const fn () callconv(.C) void, .{ .name = "unimicro_main" }),
        nmi_fault: Handler = default_int_handler,
        hard_fault: Handler = default_int_handler,
        memory_management_fault: Handler = default_int_handler,
        bus_fault: Handler = default_int_handler,
        usage_fault: Handler = default_int_handler,
        reserved_1: u32 = 0,
        reserved_2: u32 = 0,
        reserved_3: u32 = 0,
        reserved_4: u32 = 0,
        sv_call: Handler = default_int_handler,
        debug_monitor: Handler = default_int_handler,
        reserved_5: u32 = 0,
        pend_sv: Handler = default_int_handler,
        systick: Handler = default_int_handler,
        window_watchdog: Handler = default_int_handler,
        exti_16_pvd: Handler = default_int_handler,
        exti_21_tamper_timestamp: Handler = default_int_handler,
        exti_22_rtc_wakeup: Handler = default_int_handler,
        flash: Handler = default_int_handler,
        rcc: Handler = default_int_handler,
        exti_line_0: Handler = default_int_handler,
        exti_line_1: Handler = default_int_handler,
        exti_line_2: Handler = default_int_handler,
        exti_line_3: Handler = default_int_handler,
        exti_line_4: Handler = default_int_handler,
        dma1_stream0: Handler = default_int_handler,
        dma1_stream1: Handler = default_int_handler,
        dma1_stream2: Handler = default_int_handler,
        dma1_stream3: Handler = default_int_handler,
        dma1_stream4: Handler = default_int_handler,
        dma1_stream5: Handler = default_int_handler,
        dma1_stream6: Handler = default_int_handler,
        adc: Handler = default_int_handler,
        exti_line_5_to_9: Handler = default_int_handler,
        timer1_break_and_timer9_global: Handler = default_int_handler,
        timer1_update_and_timer10_global: Handler = default_int_handler,
        timer1_trigger_and_commutation_and_timer11_global: Handler = default_int_handler,
        timer1_capture_compare: Handler = default_int_handler,
        timer2_global: Handler = default_int_handler,
        timer3_global: Handler = default_int_handler,
        timer4_global: Handler = default_int_handler,
        i2c1_event: Handler = default_int_handler,
        i2c1_error: Handler = default_int_handler,
        i2c2_event: Handler = default_int_handler,
        i2c2_error: Handler = default_int_handler,
        spi1_global: Handler = default_int_handler,
        spi2_global: Handler = default_int_handler,
        usart1_global: Handler = default_int_handler,
        usart2_global: Handler = default_int_handler,
        exti_line_10_to_15: Handler = default_int_handler,
        exti_line_17_and_rtc_alarm: Handler = default_int_handler,
        exti_line_18_and_usb_otg_fs_wakeup: Handler = default_int_handler,
        dma1_stream7: Handler = default_int_handler,
        sdio_global: Handler = default_int_handler,
        timer5_global: Handler = default_int_handler,
        spi3_global: Handler = default_int_handler,
        dma2_stream0: Handler = default_int_handler,
        dma2_stream1: Handler = default_int_handler,
        dma2_stream2: Handler = default_int_handler,
        dma2_stream3: Handler = default_int_handler,
        dma2_stream4: Handler = default_int_handler,
        usb_otg_fs_global: Handler = default_int_handler,
        dma2_stream5: Handler = default_int_handler,
        dma2_stream6: Handler = default_int_handler,
        dma2_stream7: Handler = default_int_handler,
        usart6_global: Handler = default_int_handler,
        i2c3_event: Handler = default_int_handler,
        i2c3_error: Handler = default_int_handler,
        fpu_global: Handler = default_int_handler,
        spi4_global: Handler = default_int_handler,
        spi5_global: Handler = default_int_handler,

        const Handler = *const fn () callconv(.C) void;

        // Default handler, does absolutely nothing but to wait for
        // inspection with a debugger
        fn default_int_handler() callconv(.C) void {
            while (true) asm volatile ("");
        }

        comptime {
            @export(default_int_handler, .{ .name = "default_int_handler", .linkage = .weak });
        }
    };

    const default_nvic: NestedVectorInterruptController = .{};

    @export(default_nvic, .{ .name = "vector_table", .section = ".vector", .linkage = .weak });
}
