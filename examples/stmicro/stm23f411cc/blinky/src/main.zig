const UniMicro = @import("UniMicro");

const gpio = UniMicro.gpio;
const rcc = UniMicro.rcc;

pub fn main() !void {
    rcc.set_system_clock(.{ .clock = .{ .MHz = 96 }, .using_usb_or_sdio = true });
    rcc.AHB1ENR.GPIOCEN = .CLOCK_ENABLED;

    gpio.portC.configure_pins(&.{
        .{ .number = 13, .mode = .OUTPUT, .output_speed = .FAST },
        .{ .number = 14, .mode = .INPUT, .pullup_or_pulldown = .PULL_DOWN },
    });

    gpio.portC.lock_configuration(&.{ 13, 14 }) catch |err| switch (err) {
        error.LockFailed => @panic("Failed to lock gpio configuration!"),
    };

    while (true) {
        // OBS: For some reason, the builtin LED on blackpill
        // boards turns ON on when pin C13 is set to LOW.
        gpio.portC.set_pin(13, !gpio.portC.read_pin(14));
        for (1..1_000_000) |_| asm volatile ("");
    }
}

fn example_interrupt() void {
    while (true) {}
}

comptime {
    UniMicro.interrupts.create_nvic(&.{
        .{ .source = .spi5_global, .handler = example_interrupt },
    });
}
