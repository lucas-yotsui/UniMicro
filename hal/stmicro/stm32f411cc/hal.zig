pub const flash = @import("flash.zig").flash;
pub const rcc = @import("rcc.zig").rcc;
pub const gpio = @import("gpio.zig");
pub const exti = @import("exti.zig").exti;
pub const interrupts = @import("interrupts.zig");

test {
    @import("std").testing.refAllDeclsRecursive(@This());
}
