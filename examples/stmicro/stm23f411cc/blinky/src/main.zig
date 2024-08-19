const UniMicro = @import("UniMicro");

const gpio = UniMicro.gpio;
const rcc = UniMicro.rcc;

pub fn main() !void {
    rcc.AHB1EN.gpio_c = true;

    gpio.portC.MODE.pin13 = .OUTPUT;

    while (true) {
        gpio.portC.ODATA.pin13 = true;
        for (1..1_000_000) |_| {
            asm volatile ("");
        }

        gpio.portC.ODATA.pin13 = false;
        for (1..1_000_000) |_| {
            asm volatile ("");
        }
    }
}

fn example_interrupt() void {
    while (true) {
        gpio.portC.ODATA.pin13 = true;
        for (1..1_000_000) |_| {
            asm volatile ("");
        }

        gpio.portC.ODATA.pin13 = false;
        for (1..1_000_000) |_| {
            asm volatile ("");
        }
    }
}

comptime {
    UniMicro.interrupts.create_nvic(&.{
        .{ .source = .spi5_global, .handler = example_interrupt },
    });
}
