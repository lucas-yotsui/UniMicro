const Gpio = packed struct {
    MODE: packed struct(u32) {
        pub const Mode = enum(u2) {
            INPUT = 0b00,
            OUTPUT = 0b01,
            ALTERNATE_FUNCTION = 0b10,
            ANALOG = 0b11,
        };

        pin0: Mode,
        pin1: Mode,
        pin2: Mode,
        pin3: Mode,
        pin4: Mode,
        pin5: Mode,
        pin6: Mode,
        pin7: Mode,
        pin8: Mode,
        pin9: Mode,
        pin10: Mode,
        pin11: Mode,
        pin12: Mode,
        pin13: Mode,
        pin14: Mode,
        pin15: Mode,
    },
    OTYPE: packed struct(u32) {
        const Config = enum(u1) {
            PUSH_PULL = 0,
            OPEN_DRAIN = 1,
        };

        pin0: Config,
        pin1: Config,
        pin2: Config,
        pin3: Config,
        pin4: Config,
        pin5: Config,
        pin6: Config,
        pin7: Config,
        pin8: Config,
        pin9: Config,
        pin10: Config,
        pin11: Config,
        pin12: Config,
        pin13: Config,
        pin14: Config,
        pin15: Config,
        _reserved: u16,
    },
    OSPEED: packed struct(u32) {
        const Speed = enum(u2) {
            LOW = 0b00,
            MEDIUM = 0b01,
            FAST = 0b10,
            HIGH = 0b11,
        };

        pin0: Speed,
        pin1: Speed,
        pin2: Speed,
        pin3: Speed,
        pin4: Speed,
        pin5: Speed,
        pin6: Speed,
        pin7: Speed,
        pin8: Speed,
        pin9: Speed,
        pin10: Speed,
        pin11: Speed,
        pin12: Speed,
        pin13: Speed,
        pin14: Speed,
        pin15: Speed,
    },
    PUPD: packed struct(u32) {
        const PullUpOrPullDown = enum(u2) {
            NO_PULL = 0b00,
            PULL_UP = 0b01,
            PULL_DOWN = 0b10,
            _RESERVED = 0b11,
        };

        pin0: PullUpOrPullDown,
        pin1: PullUpOrPullDown,
        pin2: PullUpOrPullDown,
        pin3: PullUpOrPullDown,
        pin4: PullUpOrPullDown,
        pin5: PullUpOrPullDown,
        pin6: PullUpOrPullDown,
        pin7: PullUpOrPullDown,
        pin8: PullUpOrPullDown,
        pin9: PullUpOrPullDown,
        pin10: PullUpOrPullDown,
        pin11: PullUpOrPullDown,
        pin12: PullUpOrPullDown,
        pin13: PullUpOrPullDown,
        pin14: PullUpOrPullDown,
        pin15: PullUpOrPullDown,
    },
    IDATA: packed struct(u32) {
        pin0: bool,
        pin1: bool,
        pin2: bool,
        pin3: bool,
        pin4: bool,
        pin5: bool,
        pin6: bool,
        pin7: bool,
        pin8: bool,
        pin9: bool,
        pin10: bool,
        pin11: bool,
        pin12: bool,
        pin13: bool,
        pin14: bool,
        pin15: bool,
        _reserved: u16 = 0,
    },
    ODATA: packed struct(u32) {
        pin0: bool,
        pin1: bool,
        pin2: bool,
        pin3: bool,
        pin4: bool,
        pin5: bool,
        pin6: bool,
        pin7: bool,
        pin8: bool,
        pin9: bool,
        pin10: bool,
        pin11: bool,
        pin12: bool,
        pin13: bool,
        pin14: bool,
        pin15: bool,
        _reserved: u16 = 0,
    },
    BSR: packed struct(u32) {
        set_pin0: bool,
        set_pin1: bool,
        set_pin2: bool,
        set_pin3: bool,
        set_pin4: bool,
        set_pin5: bool,
        set_pin6: bool,
        set_pin7: bool,
        set_pin8: bool,
        set_pin9: bool,
        set_pin10: bool,
        set_pin11: bool,
        set_pin12: bool,
        set_pin13: bool,
        set_pin14: bool,
        set_pin15: bool,
        reset_pin0: bool,
        reset_pin1: bool,
        reset_pin2: bool,
        reset_pin3: bool,
        reset_pin4: bool,
        reset_pin5: bool,
        reset_pin6: bool,
        reset_pin7: bool,
        reset_pin8: bool,
        reset_pin9: bool,
        reset_pin10: bool,
        reset_pin11: bool,
        reset_pin12: bool,
        reset_pin13: bool,
        reset_pin14: bool,
        reset_pin15: bool,
    },
    LCK: packed struct(u32) {
        pin0: bool,
        pin1: bool,
        pin2: bool,
        pin3: bool,
        pin4: bool,
        pin5: bool,
        pin6: bool,
        pin7: bool,
        pin8: bool,
        pin9: bool,
        pin10: bool,
        pin11: bool,
        pin12: bool,
        pin13: bool,
        pin14: bool,
        pin15: bool,
        lock_bit: bool,
        _reserved: u15,
    },
    AFRL: packed struct(u32) {
        pin0: AlternateFunction,
        pin1: AlternateFunction,
        pin2: AlternateFunction,
        pin3: AlternateFunction,
        pin4: AlternateFunction,
        pin5: AlternateFunction,
        pin6: AlternateFunction,
        pin7: AlternateFunction,
    },
    AFRH: packed struct(u32) {
        pin8: AlternateFunction,
        pin9: AlternateFunction,
        pin10: AlternateFunction,
        pin11: AlternateFunction,
        pin12: AlternateFunction,
        pin13: AlternateFunction,
        pin14: AlternateFunction,
        pin15: AlternateFunction,
    },

    const AlternateFunction = enum(u4) {
        ALT_FUNCTION_0 = 0b0000,
        ALT_FUNCTION_1 = 0b0001,
        ALT_FUNCTION_2 = 0b0010,
        ALT_FUNCTION_3 = 0b0011,
        ALT_FUNCTION_4 = 0b0100,
        ALT_FUNCTION_5 = 0b0101,
        ALT_FUNCTION_6 = 0b0110,
        ALT_FUNCTION_7 = 0b0111,
        ALT_FUNCTION_8 = 0b1000,
        ALT_FUNCTION_9 = 0b1001,
        ALT_FUNCTION_10 = 0b1010,
        ALT_FUNCTION_11 = 0b1011,
        ALT_FUNCTION_12 = 0b1100,
        ALT_FUNCTION_13 = 0b1101,
        ALT_FUNCTION_14 = 0b1110,
        ALT_FUNCTION_15 = 0b1111,
    };

    pub fn enable_pin(self: *volatile Gpio, pin: comptime_int, pin_mode: @TypeOf(Gpio.MODE).Mode) void {
        const field_name = comptime blk: {
            var buffer: [4 + (pin / 10)]u8 = undefined;
            break :blk try @import("std").fmt.bufPrint(&buffer, "pin{d}", .{pin});
        };

        @field(self.MODE, field_name) = pin_mode;
    }

    pub fn set_pin(self: *volatile Gpio, pin: comptime_int, state: bool) void {
        const field_name = comptime blk: {
            var buffer: [4 + (pin / 10)]u8 = undefined;
            break :blk try @import("std").fmt.bufPrint(&buffer, "pin{d}", .{pin});
        };

        // This function only works if the pin is set as Output
        if (@field(self.MODE, field_name) != .OUTPUT) return;

        @field(self.ODATA, field_name) = state;
    }
};

pub const portA: *volatile Gpio = @ptrFromInt(0x40020000);
pub const portB: *volatile Gpio = @ptrFromInt(0x40020400);
pub const portC: *volatile Gpio = @ptrFromInt(0x40020800);
pub const portD: *volatile Gpio = @ptrFromInt(0x40020C00);
pub const portE: *volatile Gpio = @ptrFromInt(0x40021000);
pub const portH: *volatile Gpio = @ptrFromInt(0x40021C00);

test "field_offsets" {
    const expect = @import("std").testing.expect;

    try expect(@offsetOf(Gpio, "MODE") == 0x00);
    try expect(@offsetOf(Gpio, "OTYPE") == 0x04);
    try expect(@offsetOf(Gpio, "OSPEED") == 0x08);
    try expect(@offsetOf(Gpio, "PUPD") == 0x0C);
    try expect(@offsetOf(Gpio, "IDATA") == 0x10);
    try expect(@offsetOf(Gpio, "ODATA") == 0x14);
    try expect(@offsetOf(Gpio, "BSR") == 0x18);
    try expect(@offsetOf(Gpio, "LCK") == 0x1C);
    try expect(@offsetOf(Gpio, "AFRL") == 0x20);
    try expect(@offsetOf(Gpio, "AFRH") == 0x24);
}
