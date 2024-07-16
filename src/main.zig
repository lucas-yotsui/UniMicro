const portC = @import("hal/gpio.zig").portC;
const rcc = @import("hal/rcc.zig").rcc;

pub fn main() noreturn {
    rcc.ahb1en.gpio_c = true;
    portC.enable_pin(13, .OUTPUT);

    while (true) {
        portC.set_pin(13, true);
        for (1..100_000) |_| {}

        portC.set_pin(13, false);
        for (1..100_000) |_| {}
    }
}
