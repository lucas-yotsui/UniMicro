/// External interrupt/event controller register map.
const EXTI = packed struct {
    /// Interrupt mask register.
    IMR: packed struct(u32) {
        const InterruptMask = enum(u1) {
            INTERRUPT_NOT_MASKED = 0,
            INTERRUPT_MASKED = 1,
        };

        /// Interrupt mask on line 0
        MR0: InterruptMask,
        /// Interrupt mask on line 1
        MR1: InterruptMask,
        /// Interrupt mask on line 2
        MR2: InterruptMask,
        /// Interrupt mask on line 3
        MR3: InterruptMask,
        /// Interrupt mask on line 4
        MR4: InterruptMask,
        /// Interrupt mask on line 5
        MR5: InterruptMask,
        /// Interrupt mask on line 6
        MR6: InterruptMask,
        /// Interrupt mask on line 7
        MR7: InterruptMask,
        /// Interrupt mask on line 8
        MR8: InterruptMask,
        /// Interrupt mask on line 9
        MR9: InterruptMask,
        /// Interrupt mask on line 10
        MR10: InterruptMask,
        /// Interrupt mask on line 11
        MR11: InterruptMask,
        /// Interrupt mask on line 12
        MR12: InterruptMask,
        /// Interrupt mask on line 13
        MR13: InterruptMask,
        /// Interrupt mask on line 14
        MR14: InterruptMask,
        /// Interrupt mask on line 15
        MR15: InterruptMask,
        /// Interrupt mask on line 16
        MR16: InterruptMask,
        /// Interrupt mask on line 17
        MR17: InterruptMask,
        /// Interrupt mask on line 18
        MR18: InterruptMask,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// Interrupt mask on line 21
        MR21: InterruptMask,
        /// Interrupt mask on line 22
        MR22: InterruptMask,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Event mask register.
    EMR: packed struct(u32) {
        const EventMask = enum(u1) {
            EVENT_NOT_MASKED = 0,
            EVENT_MASKED = 1,
        };

        /// Event mask on line 0
        MR0: EventMask,
        /// Event mask on line 1
        MR1: EventMask,
        /// Event mask on line 2
        MR2: EventMask,
        /// Event mask on line 3
        MR3: EventMask,
        /// Event mask on line 4
        MR4: EventMask,
        /// Event mask on line 5
        MR5: EventMask,
        /// Event mask on line 6
        MR6: EventMask,
        /// Event mask on line 7
        MR7: EventMask,
        /// Event mask on line 8
        MR8: EventMask,
        /// Event mask on line 9
        MR9: EventMask,
        /// Event mask on line 10
        MR10: EventMask,
        /// Event mask on line 11
        MR11: EventMask,
        /// Event mask on line 12
        MR12: EventMask,
        /// Event mask on line 13
        MR13: EventMask,
        /// Event mask on line 14
        MR14: EventMask,
        /// Event mask on line 15
        MR15: EventMask,
        /// Event mask on line 16
        MR16: EventMask,
        /// Event mask on line 17
        MR17: EventMask,
        /// Event mask on line 18
        MR18: EventMask,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// Event mask on line 21
        MR21: EventMask,
        /// Event mask on line 22
        MR22: EventMask,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Rising trigger selection register.
    RTSR: packed struct(u32) {
        const RisingTrigger = enum(u1) {
            DISABLED = 0,
            ENABLED = 1,
        };

        /// Rising trigger event configuration bit of line 0
        TR0: RisingTrigger,
        /// Rising trigger event configuration bit of line 1
        TR1: RisingTrigger,
        /// Rising trigger event configuration bit of line 2
        TR2: RisingTrigger,
        /// Rising trigger event configuration bit of line 3
        TR3: RisingTrigger,
        /// Rising trigger event configuration bit of line 4
        TR4: RisingTrigger,
        /// Rising trigger event configuration bit of line 5
        TR5: RisingTrigger,
        /// Rising trigger event configuration bit of line 6
        TR6: RisingTrigger,
        /// Rising trigger event configuration bit of line 7
        TR7: RisingTrigger,
        /// Rising trigger event configuration bit of line 8
        TR8: RisingTrigger,
        /// Rising trigger event configuration bit of line 9
        TR9: RisingTrigger,
        /// Rising trigger event configuration bit of line 10
        TR10: RisingTrigger,
        /// Rising trigger event configuration bit of line 11
        TR11: RisingTrigger,
        /// Rising trigger event configuration bit of line 12
        TR12: RisingTrigger,
        /// Rising trigger event configuration bit of line 13
        TR13: RisingTrigger,
        /// Rising trigger event configuration bit of line 14
        TR14: RisingTrigger,
        /// Rising trigger event configuration bit of line 15
        TR15: RisingTrigger,
        /// Rising trigger event configuration bit of line 16
        TR16: RisingTrigger,
        /// Rising trigger event configuration bit of line 17
        TR17: RisingTrigger,
        /// Rising trigger event configuration bit of line 18
        TR18: RisingTrigger,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// Rising trigger event configuration bit of line 21
        TR21: RisingTrigger,
        /// Rising trigger event configuration bit of line 22
        TR22: RisingTrigger,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Falling trigger selection register.
    FTSR: packed struct(u32) {
        const FallingTrigger = enum(u1) {
            DISABLED = 0,
            ENABLED = 1,
        };

        /// Falling trigger event configuration bit of line 0
        TR0: FallingTrigger,
        /// Falling trigger event configuration bit of line 1
        TR1: FallingTrigger,
        /// Falling trigger event configuration bit of line 2
        TR2: FallingTrigger,
        /// Falling trigger event configuration bit of line 3
        TR3: FallingTrigger,
        /// Falling trigger event configuration bit of line 4
        TR4: FallingTrigger,
        /// Falling trigger event configuration bit of line 5
        TR5: FallingTrigger,
        /// Falling trigger event configuration bit of line 6
        TR6: FallingTrigger,
        /// Falling trigger event configuration bit of line 7
        TR7: FallingTrigger,
        /// Falling trigger event configuration bit of line 8
        TR8: FallingTrigger,
        /// Falling trigger event configuration bit of line 9
        TR9: FallingTrigger,
        /// Falling trigger event configuration bit of line 10
        TR10: FallingTrigger,
        /// Falling trigger event configuration bit of line 11
        TR11: FallingTrigger,
        /// Falling trigger event configuration bit of line 12
        TR12: FallingTrigger,
        /// Falling trigger event configuration bit of line 13
        TR13: FallingTrigger,
        /// Falling trigger event configuration bit of line 14
        TR14: FallingTrigger,
        /// Falling trigger event configuration bit of line 15
        TR15: FallingTrigger,
        /// Falling trigger event configuration bit of line 16
        TR16: FallingTrigger,
        /// Falling trigger event configuration bit of line 17
        TR17: FallingTrigger,
        /// Falling trigger event configuration bit of line 18
        TR18: FallingTrigger,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// Falling trigger event configuration bit of line 21
        TR21: FallingTrigger,
        /// Falling trigger event configuration bit of line 22
        TR22: FallingTrigger,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Software interrupt event register.
    SWIER: packed struct(u32) {
        const SoftwareInterrupt = enum(u1) {
            TRIGGER_INTERRUPT = 1,
        };

        /// Software Interrupt on line 0
        SWIER0: SoftwareInterrupt,
        /// Software Interrupt on line 1
        SWIER1: SoftwareInterrupt,
        /// Software Interrupt on line 2
        SWIER2: SoftwareInterrupt,
        /// Software Interrupt on line 3
        SWIER3: SoftwareInterrupt,
        /// Software Interrupt on line 4
        SWIER4: SoftwareInterrupt,
        /// Software Interrupt on line 5
        SWIER5: SoftwareInterrupt,
        /// Software Interrupt on line 6
        SWIER6: SoftwareInterrupt,
        /// Software Interrupt on line 7
        SWIER7: SoftwareInterrupt,
        /// Software Interrupt on line 8
        SWIER8: SoftwareInterrupt,
        /// Software Interrupt on line 9
        SWIER9: SoftwareInterrupt,
        /// Software Interrupt on line 10
        SWIER10: SoftwareInterrupt,
        /// Software Interrupt on line 11
        SWIER11: SoftwareInterrupt,
        /// Software Interrupt on line 12
        SWIER12: SoftwareInterrupt,
        /// Software Interrupt on line 13
        SWIER13: SoftwareInterrupt,
        /// Software Interrupt on line 14
        SWIER14: SoftwareInterrupt,
        /// Software Interrupt on line 15
        SWIER15: SoftwareInterrupt,
        /// Software Interrupt on line 16
        SWIER16: SoftwareInterrupt,
        /// Software Interrupt on line 17
        SWIER17: SoftwareInterrupt,
        /// Software Interrupt on line 18
        SWIER18: SoftwareInterrupt,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// Software Interrupt on line 21
        SWIER21: SoftwareInterrupt,
        /// Software Interrupt on line 22
        SWIER22: SoftwareInterrupt,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Pending interrupt register.
    PR: packed struct(u32) {
        const PendingBit = packed union {
            read: enum(u1) {
                NO_TRIGGER = 0,
                TRIGGER_OCCURED = 1,
            },
            write: enum(u1) {
                CLEAR = 1,
            },
        };

        /// Pending bit 0
        PR0: PendingBit,
        /// Pending bit 1
        PR1: PendingBit,
        /// Pending bit 2
        PR2: PendingBit,
        /// Pending bit 3
        PR3: PendingBit,
        /// Pending bit 4
        PR4: PendingBit,
        /// Pending bit 5
        PR5: PendingBit,
        /// Pending bit 6
        PR6: PendingBit,
        /// Pending bit 7
        PR7: PendingBit,
        /// Pending bit 8
        PR8: PendingBit,
        /// Pending bit 9
        PR9: PendingBit,
        /// Pending bit 10
        PR10: PendingBit,
        /// Pending bit 11
        PR11: PendingBit,
        /// Pending bit 12
        PR12: PendingBit,
        /// Pending bit 13
        PR13: PendingBit,
        /// Pending bit 14
        PR14: PendingBit,
        /// Pending bit 15
        PR15: PendingBit,
        /// Pending bit 16
        PR16: PendingBit,
        /// Pending bit 17
        PR17: PendingBit,
        /// Pending bit 18
        PR18: PendingBit,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// Pending bit 21
        PR21: PendingBit,
        /// Pending bit 22
        PR22: PendingBit,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },

    // TODO(Lucas): Implement the HAL functions
};

pub const exti: *volatile EXTI = @ptrFromInt(0x40013C00);

test "field_offsets" {
    const expect = @import("std").testing.expect;

    try expect(@offsetOf(EXTI, "IMR") == 0x00);
    try expect(@offsetOf(EXTI, "EMR") == 0x04);
    try expect(@offsetOf(EXTI, "RTSR") == 0x08);
    try expect(@offsetOf(EXTI, "FTSR") == 0x0C);
    try expect(@offsetOf(EXTI, "SWIER") == 0x10);
    try expect(@offsetOf(EXTI, "PR") == 0x14);
}
