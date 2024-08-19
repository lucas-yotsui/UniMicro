const app = @import("app");

extern var _data_loadaddr: u8;
extern var _data: u8;
extern var _edata: u8;
extern var _bss: u8;
extern var _ebss: u8;

pub inline fn startup() void {
    // Copy data segment from flash to sram
    const data: [*]u8 = @ptrCast(&_data);
    const data_loadaddr: [*]u8 = @ptrCast(&_data_loadaddr);
    const data_size = @intFromPtr(&_edata) - @intFromPtr(&_data);

    @memcpy(data[0..data_size], data_loadaddr[0..data_size]);

    // fill bss segment with 0
    const bss: [*]u8 = @ptrCast(&_bss);
    const bss_size = @intFromPtr(&_ebss) - @intFromPtr(&_bss);

    @memset(bss[0..bss_size], 0);
}

pub fn hang() noreturn {
    while (true) asm volatile ("");
}
