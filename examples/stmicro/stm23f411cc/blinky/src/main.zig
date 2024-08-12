const UniMicro = @import("UniMicro");

const gpio = UniMicro.modules.gpio;
const rcc = UniMicro.modules.rcc;

pub fn main() !void {
    rcc.AHB1EN.gpio_c = true;

    gpio.portC.MODE.pin13 = .OUTPUT;

    while (true) {
        gpio.portC.ODATA.pin13 = true;
        for (1..100_000) |_| {
            asm volatile ("");
        }

        gpio.portC.ODATA.pin13 = false;
        for (1..100_000) |_| {
            asm volatile ("");
        }
    }
}
