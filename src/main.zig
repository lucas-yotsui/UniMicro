pub const RCC_APB2ENR: *volatile u32 = @ptrFromInt(0x40023800 + 0x30);
pub const GPIOC_MODER: *volatile u32 = @ptrFromInt(0x40020800);
pub const GPIOC_ODR: *volatile u32 = @ptrFromInt(0x40020800 + 0x14);

pub fn main() noreturn {
    RCC_APB2ENR.* |= @as(u32, 0b1 << 2); // Enable GPIOC clk
    GPIOC_MODER.* |= @as(u32, 0b1 << 26); // Set GPIOC13 as Output

    while (true) {
        var i: u32 = 0;
        GPIOC_ODR.* ^= @as(u32, 0b1 << 13); // Toggle the bit corresponding to GPIOC13

        while (i < 100_000) { // Wait a bit
            i += 1;
        }
    }
}
