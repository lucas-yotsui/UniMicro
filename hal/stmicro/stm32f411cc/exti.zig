/// External interrupt/event controller register map.
const EXTI = packed struct {
    /// Interrupt mask register.
    IMR: packed struct(u32) {
        /// If false, the interrupt request on EXTI line 0 is masked,
        /// if true, it isn't.
        line_0: bool,
        /// If false, the interrupt request on EXTI line 1 is masked,
        /// if true, it isn't.
        line_1: bool,
        /// If false, the interrupt request on EXTI line 2 is masked,
        /// if true, it isn't.
        line_2: bool,
        /// If false, the interrupt request on EXTI line 3 is masked,
        /// if true, it isn't.
        line_3: bool,
        /// If false, the interrupt request on EXTI line 4 is masked,
        /// if true, it isn't.
        line_4: bool,
        /// If false, the interrupt request on EXTI line 5 is masked,
        /// if true, it isn't.
        line_5: bool,
        /// If false, the interrupt request on EXTI line 6 is masked,
        /// if true, it isn't.
        line_6: bool,
        /// If false, the interrupt request on EXTI line 7 is masked,
        /// if true, it isn't.
        line_7: bool,
        /// If false, the interrupt request on EXTI line 8 is masked,
        /// if true, it isn't.
        line_8: bool,
        /// If false, the interrupt request on EXTI line 9 is masked,
        /// if true, it isn't.
        line_9: bool,
        /// If false, the interrupt request on EXTI line 10 is masked,
        /// if true, it isn't.
        line_10: bool,
        /// If false, the interrupt request on EXTI line 11 is masked,
        /// if true, it isn't.
        line_11: bool,
        /// If false, the interrupt request on EXTI line 12 is masked,
        /// if true, it isn't.
        line_12: bool,
        /// If false, the interrupt request on EXTI line 13 is masked,
        /// if true, it isn't.
        line_13: bool,
        /// If false, the interrupt request on EXTI line 14 is masked,
        /// if true, it isn't.
        line_14: bool,
        /// If false, the interrupt request on EXTI line 15 is masked,
        /// if true, it isn't.
        line_15: bool,
        /// If false, the interrupt request on EXTI line 16 is masked,
        /// if true, it isn't.
        line_16: bool,
        /// If false, the interrupt request on EXTI line 17 is masked,
        /// if true, it isn't.
        line_17: bool,
        /// If false, the interrupt request on EXTI line 18 is masked,
        /// if true, it isn't.
        line_18: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// If false, the interrupt request on EXTI line 21 is masked,
        /// if true, it isn't.
        line_21: bool,
        /// If false, the interrupt request on EXTI line 22 is masked,
        /// if true, it isn't.
        line_22: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Event mask register.
    EMR: packed struct(u32) {
        /// If false, the event request on EXTI line 0 is masked,
        /// if true, it isn't.
        line_0: bool,
        /// If false, the event request on EXTI line 1 is masked,
        /// if true, it isn't.
        line_1: bool,
        /// If false, the event request on EXTI line 2 is masked,
        /// if true, it isn't.
        line_2: bool,
        /// If false, the event request on EXTI line 3 is masked,
        /// if true, it isn't.
        line_3: bool,
        /// If false, the event request on EXTI line 4 is masked,
        /// if true, it isn't.
        line_4: bool,
        /// If false, the event request on EXTI line 5 is masked,
        /// if true, it isn't.
        line_5: bool,
        /// If false, the event request on EXTI line 6 is masked,
        /// if true, it isn't.
        line_6: bool,
        /// If false, the event request on EXTI line 7 is masked,
        /// if true, it isn't.
        line_7: bool,
        /// If false, the event request on EXTI line 8 is masked,
        /// if true, it isn't.
        line_8: bool,
        /// If false, the event request on EXTI line 9 is masked,
        /// if true, it isn't.
        line_9: bool,
        /// If false, the event request on EXTI line 10 is masked,
        /// if true, it isn't.
        line_10: bool,
        /// If false, the event request on EXTI line 11 is masked,
        /// if true, it isn't.
        line_11: bool,
        /// If false, the event request on EXTI line 12 is masked,
        /// if true, it isn't.
        line_12: bool,
        /// If false, the event request on EXTI line 13 is masked,
        /// if true, it isn't.
        line_13: bool,
        /// If false, the event request on EXTI line 14 is masked,
        /// if true, it isn't.
        line_14: bool,
        /// If false, the event request on EXTI line 15 is masked,
        /// if true, it isn't.
        line_15: bool,
        /// If false, the event request on EXTI line 16 is masked,
        /// if true, it isn't.
        line_16: bool,
        /// If false, the event request on EXTI line 17 is masked,
        /// if true, it isn't.
        line_17: bool,
        /// If false, the event request on EXTI line 18 is masked,
        /// if true, it isn't.
        line_18: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// If false, the event request on EXTI line 21 is masked,
        /// if true, it isn't.
        line_21: bool,
        /// If false, the event request on EXTI line 22 is masked,
        /// if true, it isn't.
        line_22: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Rising trigger selection register.
    RTSR: packed struct(u32) {
        /// If false, the rising trigger for EXTI line 0 is disabled,
        /// if true, it is enabled.
        line_0: bool,
        /// If false, the rising trigger for EXTI line 1 is disabled,
        /// if true, it is enabled.
        line_1: bool,
        /// If false, the rising trigger for EXTI line 2 is disabled,
        /// if true, it is enabled.
        line_2: bool,
        /// If false, the rising trigger for EXTI line 3 is disabled,
        /// if true, it is enabled.
        line_3: bool,
        /// If false, the rising trigger for EXTI line 4 is disabled,
        /// if true, it is enabled.
        line_4: bool,
        /// If false, the rising trigger for EXTI line 5 is disabled,
        /// if true, it is enabled.
        line_5: bool,
        /// If false, the rising trigger for EXTI line 6 is disabled,
        /// if true, it is enabled.
        line_6: bool,
        /// If false, the rising trigger for EXTI line 7 is disabled,
        /// if true, it is enabled.
        line_7: bool,
        /// If false, the rising trigger for EXTI line 8 is disabled,
        /// if true, it is enabled.
        line_8: bool,
        /// If false, the rising trigger for EXTI line 9 is disabled,
        /// if true, it is enabled.
        line_9: bool,
        /// If false, the rising trigger for EXTI line 10 is disabled,
        /// if true, it is enabled.
        line_10: bool,
        /// If false, the rising trigger for EXTI line 11 is disabled,
        /// if true, it is enabled.
        line_11: bool,
        /// If false, the rising trigger for EXTI line 12 is disabled,
        /// if true, it is enabled.
        line_12: bool,
        /// If false, the rising trigger for EXTI line 13 is disabled,
        /// if true, it is enabled.
        line_13: bool,
        /// If false, the rising trigger for EXTI line 14 is disabled,
        /// if true, it is enabled.
        line_14: bool,
        /// If false, the rising trigger for EXTI line 15 is disabled,
        /// if true, it is enabled.
        line_15: bool,
        /// If false, the rising trigger for EXTI line 16 is disabled,
        /// if true, it is enabled.
        line_16: bool,
        /// If false, the rising trigger for EXTI line 17 is disabled,
        /// if true, it is enabled.
        line_17: bool,
        /// If false, the rising trigger for EXTI line 18 is disabled,
        /// if true, it is enabled.
        line_18: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// If false, the rising trigger for EXTI line 21 is disabled,
        /// if true, it is enabled.
        line_21: bool,
        /// If false, the rising trigger for EXTI line 22 is disabled,
        /// if true, it is enabled.
        line_22: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Falling trigger selection register.
    FTSR: packed struct(u32) {
        /// If false, the falling trigger for EXTI line 0 is disabled,
        /// if true, it is enabled.
        line_0: bool,
        /// If false, the falling trigger for EXTI line 1 is disabled,
        /// if true, it is enabled.
        line_1: bool,
        /// If false, the falling trigger for EXTI line 2 is disabled,
        /// if true, it is enabled.
        line_2: bool,
        /// If false, the falling trigger for EXTI line 3 is disabled,
        /// if true, it is enabled.
        line_3: bool,
        /// If false, the falling trigger for EXTI line 4 is disabled,
        /// if true, it is enabled.
        line_4: bool,
        /// If false, the falling trigger for EXTI line 5 is disabled,
        /// if true, it is enabled.
        line_5: bool,
        /// If false, the falling trigger for EXTI line 6 is disabled,
        /// if true, it is enabled.
        line_6: bool,
        /// If false, the falling trigger for EXTI line 7 is disabled,
        /// if true, it is enabled.
        line_7: bool,
        /// If false, the falling trigger for EXTI line 8 is disabled,
        /// if true, it is enabled.
        line_8: bool,
        /// If false, the falling trigger for EXTI line 9 is disabled,
        /// if true, it is enabled.
        line_9: bool,
        /// If false, the falling trigger for EXTI line 10 is disabled,
        /// if true, it is enabled.
        line_10: bool,
        /// If false, the falling trigger for EXTI line 11 is disabled,
        /// if true, it is enabled.
        line_11: bool,
        /// If false, the falling trigger for EXTI line 12 is disabled,
        /// if true, it is enabled.
        line_12: bool,
        /// If false, the falling trigger for EXTI line 13 is disabled,
        /// if true, it is enabled.
        line_13: bool,
        /// If false, the falling trigger for EXTI line 14 is disabled,
        /// if true, it is enabled.
        line_14: bool,
        /// If false, the falling trigger for EXTI line 15 is disabled,
        /// if true, it is enabled.
        line_15: bool,
        /// If false, the falling trigger for EXTI line 16 is disabled,
        /// if true, it is enabled.
        line_16: bool,
        /// If false, the falling trigger for EXTI line 17 is disabled,
        /// if true, it is enabled.
        line_17: bool,
        /// If false, the falling trigger for EXTI line 18 is disabled,
        /// if true, it is enabled.
        line_18: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// If false, the falling trigger for EXTI line 21 is disabled,
        /// if true, it is enabled.
        line_21: bool,
        /// If false, the falling trigger for EXTI line 22 is disabled,
        /// if true, it is enabled.
        line_22: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Software interrupt event register.
    SWIER: packed struct(u32) {
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 0.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_0: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 1.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_1: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 2.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_2: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 3.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_3: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 4.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_4: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 5.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_5: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 6.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_6: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 7.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_7: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 8.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_8: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 9.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_9: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 10.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_10: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 11.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_11: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 12.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_12: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 13.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_13: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 14.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_14: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 15.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_15: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 16.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_16: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 17.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_17: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 18.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_18: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 21.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_21: bool,
        /// If this line's interrupt is enabled (corresponding bit
        /// in the IMR register is set), setting this to true triggers
        /// an interrupt on line 22.
        ///
        /// This bit is cleared indirectly when the corresponding
        /// bit in the PR register is cleared.
        line_22: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
    /// Pending interrupt register.
    PR: packed struct(u32) {
        /// If this bit is set to false, then no events came
        /// to the EXTI line 0.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_0: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 1.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_1: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 2.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_2: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 3.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_3: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 4.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_4: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 5.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_5: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 6.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_6: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 7.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_7: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 8.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_8: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 9.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_9: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 10.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_10: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 11.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_11: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 12.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_12: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 13.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_13: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 14.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_14: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 15.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_15: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 16.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_16: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 17.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_17: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 18.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_18: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved1: u2,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 21.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_21: bool,
        /// If this bit is set to false, then no events came
        /// to the EXTI line 22.
        /// If it's set to true, then a trigger event occured.
        ///
        /// This bit is cleared by setting it to true.
        line_22: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved2: u9,
    },
};

/// External interrupt/event controller register map.
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
