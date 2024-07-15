// pub const rcc = @import("hal/rcc.zig");
// pub const gpio = @import("hal/gpio.zig");

// test {
//     @import("std").testing.refAllDeclsRecursive(@This());
// }
comptime {
    _ = @import("hal/rcc.zig");
    _ = @import("hal/gpio.zig");
}
