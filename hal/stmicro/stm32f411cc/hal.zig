pub const modules = .{
    .gpio = @import("gpio.zig"),
    .rcc = @import("rcc.zig").rcc,
    .interrupts = @import("interrupts.zig"),
};
