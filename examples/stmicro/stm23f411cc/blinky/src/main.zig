const UniMicro = @import("UniMicro");

const gpio = UniMicro.gpio;
const rcc = UniMicro.rcc;

pub fn main() !void {
    rcc.set_system_clock(.{ .clock = .{ .MHz = 96 }, .using_usb_or_sdio = true });
    rcc.enable_peripherals(&.{.GPIO_C});

    gpio.portC.configure_pins(&.{
        .{ .number = 13, .mode = .OUTPUT, .output_speed = .FAST },
    });

    gpio.portC.lock_configuration(&.{13}) catch |err| switch (err) {
        error.LockFailed => @panic("Failed to lock gpio configuration!"),
    };

    while (true) {
        // OBS: For some reason, the builtin LED on blackpill
        // boards turns ON on when pin C13 is set to LOW.
        gpio.portC.set_pin(13, true);
        for (1..5_000_000) |_| asm volatile ("");
        gpio.portC.set_pin(13, false);
        for (1..5_000_000) |_| asm volatile ("");
    }
}
