const Gpio = packed struct {
    const MODE = packed struct(u32) {
        const Mode = enum(u2) {
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
    };

    const OTYPE = packed struct(u32) {
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
    };

    const OSPEED = packed struct(u32) {
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
    };

    const PUPD = packed struct(u32) {
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
    };

    const IDATA = packed struct(u32) {
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
    };

    const ODATA = packed struct(u32) {
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
    };

    mode: MODE,
    output_type: OTYPE,
    output_speed: OSPEED,
    pull_up_or_pull_down: PUPD,
    input_data: IDATA,
    output_data: ODATA,

    pub fn enable_pin(self: *volatile Gpio, pin: comptime_int, pin_mode: MODE.Mode) void {
        switch (pin) {
            0 => self.mode.pin0 = pin_mode,
            1 => self.mode.pin1 = pin_mode,
            2 => self.mode.pin2 = pin_mode,
            3 => self.mode.pin3 = pin_mode,
            4 => self.mode.pin4 = pin_mode,
            5 => self.mode.pin5 = pin_mode,
            6 => self.mode.pin6 = pin_mode,
            7 => self.mode.pin7 = pin_mode,
            8 => self.mode.pin8 = pin_mode,
            9 => self.mode.pin9 = pin_mode,
            10 => self.mode.pin10 = pin_mode,
            11 => self.mode.pin11 = pin_mode,
            12 => self.mode.pin12 = pin_mode,
            13 => self.mode.pin13 = pin_mode,
            14 => self.mode.pin14 = pin_mode,
            15 => self.mode.pin15 = pin_mode,
            else => unreachable,
        }
    }

    pub fn set_pin(self: *volatile Gpio, pin: comptime_int) void {
        switch (pin) {
            0 => self.output_data.pin0 = true,
            1 => self.output_data.pin1 = true,
            2 => self.output_data.pin2 = true,
            3 => self.output_data.pin3 = true,
            4 => self.output_data.pin4 = true,
            5 => self.output_data.pin5 = true,
            6 => self.output_data.pin6 = true,
            7 => self.output_data.pin7 = true,
            8 => self.output_data.pin8 = true,
            9 => self.output_data.pin9 = true,
            10 => self.output_data.pin10 = true,
            11 => self.output_data.pin11 = true,
            12 => self.output_data.pin12 = true,
            13 => self.output_data.pin13 = true,
            14 => self.output_data.pin14 = true,
            15 => self.output_data.pin15 = true,
            else => unreachable,
        }
    }

    pub fn clear_pin(self: *volatile Gpio, pin: comptime_int) void {
        switch (pin) {
            0 => self.output_data.pin0 = false,
            1 => self.output_data.pin1 = false,
            2 => self.output_data.pin2 = false,
            3 => self.output_data.pin3 = false,
            4 => self.output_data.pin4 = false,
            5 => self.output_data.pin5 = false,
            6 => self.output_data.pin6 = false,
            7 => self.output_data.pin7 = false,
            8 => self.output_data.pin8 = false,
            9 => self.output_data.pin9 = false,
            10 => self.output_data.pin10 = false,
            11 => self.output_data.pin11 = false,
            12 => self.output_data.pin12 = false,
            13 => self.output_data.pin13 = false,
            14 => self.output_data.pin14 = false,
            15 => self.output_data.pin15 = false,
            else => unreachable,
        }
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

    try expect(@offsetOf(Gpio, "mode") == 0x00);
    try expect(@offsetOf(Gpio, "output_type") == 0x04);
    try expect(@offsetOf(Gpio, "output_speed") == 0x08);
    try expect(@offsetOf(Gpio, "pull_up_or_pull_down") == 0x0C);
    try expect(@offsetOf(Gpio, "input_data") == 0x10);
    try expect(@offsetOf(Gpio, "output_data") == 0x14);
}