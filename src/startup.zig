const main = @import("main.zig");

extern var _data_loadaddr: u8;
extern var _data: u8;
extern var _edata: u8;
extern var _bss: u8;
extern var _ebss: u8;

export fn reset_handler() void {
    // Copy data segment from flash to sram
    const data: [*]u8 = @ptrCast(&_data);
    const data_loadaddr: [*]u8 = @ptrCast(&_data_loadaddr);
    const data_size = @intFromPtr(&_edata) - @intFromPtr(&_data);

    @memcpy(data[0..data_size], data_loadaddr[0..data_size]);

    // fill bss segment with 0
    const bss: [*]u8 = @ptrCast(&_bss);
    const bss_size = @intFromPtr(&_ebss) - @intFromPtr(&_bss);

    @memset(bss[0..bss_size], 0);

    // Call program main
    main.main();

    // main should never exit
    unreachable;
}

// Pointer to the top of the stack. It isn't really a function
// but if not declared like this compiler keeps complaining so
// this is a temporary solution
extern fn _stack() void;

// Default handler, does absolutely nothing but to wait for
// inspection with a debugger
export fn default_handler() noreturn {
    while (true) {}
}

export const vector_table linksection(".vector") = [_]?*const fn () callconv(.C) void{
    _stack, // Pointer to the top of the Stack
    reset_handler, // Reset handler
    default_handler, // NMI handler
    default_handler, // Hard fault handler
    default_handler, // Memory management fault handler
    default_handler, // Bus fault handler
    default_handler, // Usage fault handler
    null, // Reserved
    null, // Reserved
    null, // Reserved
    null, // Reserved
    default_handler, // SVcall handler
    default_handler, // Debug monitor handler
    null, // Reserved
    default_handler, // PendSV handler
    default_handler, // Systick handler
};
