MEMORY {
  FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 256K
  SRAM(rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

_stack_top = ORIGIN(SRAM) + LENGTH(SRAM);

PROVIDE(reset_handler = default_handler);
PROVIDE(nmi_handler = default_handler);
PROVIDE(hard_fault_handler = default_handler);
PROVIDE(memory_management_fault_handler = default_handler);
PROVIDE(bus_fault_handler = default_handler);
PROVIDE(usage_fault_handler = default_handler);
PROVIDE(svcall_handler = default_handler);
PROVIDE(debug_monitor_handler = default_handler);
PROVIDE(pendsv_handler = default_handler);
PROVIDE(systick_handler = default_handler);
PROVIDE(window_watchdog_handler = default_handler);
PROVIDE(exti_16_pvd_handler = default_handler);
PROVIDE(exti_21_tamper_timestamp_handler = default_handler);
PROVIDE(exti_22_rtc_wakeup_handler = default_handler);
PROVIDE(flash_handler = default_handler);
PROVIDE(rcc_handler = default_handler);
PROVIDE(exti_line_0_handler = default_handler);
PROVIDE(exti_line_1_handler = default_handler);
PROVIDE(exti_line_2_handler = default_handler);
PROVIDE(exti_line_3_handler = default_handler);
PROVIDE(exti_line_4_handler = default_handler);
PROVIDE(dma1_stream0_handler = default_handler);
PROVIDE(dma1_stream1_handler = default_handler);
PROVIDE(dma1_stream2_handler = default_handler);
PROVIDE(dma1_stream3_handler = default_handler);
PROVIDE(dma1_stream4_handler = default_handler);
PROVIDE(dma1_stream5_handler = default_handler);
PROVIDE(dma1_stream6_handler = default_handler);
PROVIDE(adc_handler = default_handler);
PROVIDE(exti_line_5_to_9_handler = default_handler);
PROVIDE(timer1_break_and_timer9_global_handler = default_handler);
PROVIDE(timer1_update_and_timer10_global_handler = default_handler);
PROVIDE(timer1_trigger_and_commutation_and_timer11_global_handler = default_handler);
PROVIDE(timer1_capture_compare_handler = default_handler);
PROVIDE(timer2_global_handler = default_handler);
PROVIDE(timer3_global_handler = default_handler);
PROVIDE(timer4_global_handler = default_handler);
PROVIDE(i2c1_event_handler = default_handler);
PROVIDE(i2c1_error_handler = default_handler);
PROVIDE(i2c2_event_handler = default_handler);
PROVIDE(i2c2_error_handler = default_handler);
PROVIDE(spi1_global_handler = default_handler);
PROVIDE(spi2_global_handler = default_handler);
PROVIDE(usart1_global_handler = default_handler);
PROVIDE(usart2_global_handler = default_handler);
PROVIDE(exti_line_10_to_15_handler = default_handler);
PROVIDE(exti_line_17_and_rtc_alarm_handler = default_handler);
PROVIDE(exti_line_18_and_usb_otg_fs_wakeup_handler = default_handler);
PROVIDE(dma1_stream7_handler = default_handler);
PROVIDE(sdio_global_handler = default_handler);
PROVIDE(timer5_global_handler = default_handler);
PROVIDE(spi3_global_handler = default_handler);
PROVIDE(dma2_stream0_handler = default_handler);
PROVIDE(dma2_stream1_handler = default_handler);
PROVIDE(dma2_stream2_handler = default_handler);
PROVIDE(dma2_stream3_handler = default_handler);
PROVIDE(dma2_stream4_handler = default_handler);
PROVIDE(usb_otg_fs_global_handler = default_handler);
PROVIDE(dma2_stream5_handler = default_handler);
PROVIDE(dma2_stream6_handler = default_handler);
PROVIDE(dma2_stream7_handler = default_handler);
PROVIDE(usart6_global_handler = default_handler);
PROVIDE(i2c3_event_handler = default_handler);
PROVIDE(i2c3_error_handler = default_handler);
PROVIDE(fpu_global_handler = default_handler);
PROVIDE(spi4_global_handler = default_handler);
PROVIDE(spi5_global_handler = default_handler);

SECTIONS {
  .text : {
    _text = .;
    KEEP(*(.vector*))
    *(.text*)
    *(.rodata)
    _etext = .;
  } >FLASH

  .ARM.exidx : {
    *(.ARM.exidx*)
  } >FLASH

  .data : {
    _data = .;
    *(.data*)
    _edata = .;
  } >SRAM AT >FLASH
  _data_loadaddr = LOADADDR(.data);

  .bss : {
    _bss = .;
    *(.bss*)
    *(COMMON)
    _ebss = .;
  } >SRAM
}
