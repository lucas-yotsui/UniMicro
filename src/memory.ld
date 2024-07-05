MEMORY {
  FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 256K
  SRAM(rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS {
  .text : {
    _text = .;
    KEEP(*(.vectors*))
    *(.text*)
    *(.rodata)
    _etext = .;
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
