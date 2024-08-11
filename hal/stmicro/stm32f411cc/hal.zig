pub const modules = struct {
    pub const gpio = @import("gpio.zig");
    pub const rcc = @import("rcc.zig").rcc;
    pub const interrupts = @import("interrupts.zig");
};
