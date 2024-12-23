const Gpio = packed struct {
    /// GPIO port mode register
    MODER: packed struct(u32) {
        /// Pin 0 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER0: Mode,
        /// Pin 1 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER1: Mode,
        /// Pin 2 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER2: Mode,
        /// Pin 3 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER3: Mode,
        /// Pin 4 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER4: Mode,
        /// Pin 5 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER5: Mode,
        /// Pin 6 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER6: Mode,
        /// Pin 7 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER7: Mode,
        /// Pin 8 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER8: Mode,
        /// Pin 9 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER9: Mode,
        /// Pin 10 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER10: Mode,
        /// Pin 11 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER11: Mode,
        /// Pin 12 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER12: Mode,
        /// Pin 13 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER13: Mode,
        /// Pin 14 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER14: Mode,
        /// Pin 15 configuration bit
        ///
        /// This bit is written by software to configure the I/O direction mode.
        MODER15: Mode,
    },
    /// GPIO port output type register
    OTYPER: packed struct(u32) {
        /// Pin 0 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT0: OutputType,
        /// Pin 1 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT1: OutputType,
        /// Pin 2 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT2: OutputType,
        /// Pin 3 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT3: OutputType,
        /// Pin 4 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT4: OutputType,
        /// Pin 5 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT5: OutputType,
        /// Pin 6 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT6: OutputType,
        /// Pin 7 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT7: OutputType,
        /// Pin 8 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT8: OutputType,
        /// Pin 9 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT9: OutputType,
        /// Pin 10 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT10: OutputType,
        /// Pin 11 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT11: OutputType,
        /// Pin 12 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT12: OutputType,
        /// Pin 13 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT13: OutputType,
        /// Pin 14 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT14: OutputType,
        /// Pin 15 configuration bits
        ///
        /// This bit is written by software to configure the output type of the I/O port.
        OT15: OutputType,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved: u16,
    },
    /// GPIO port output speed register
    OSPEEDR: packed struct(u32) {
        /// Pin 0 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED0: OutputSpeed,
        /// Pin 1 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED1: OutputSpeed,
        /// Pin 2 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED2: OutputSpeed,
        /// Pin 3 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED3: OutputSpeed,
        /// Pin 4 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED4: OutputSpeed,
        /// Pin 5 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED5: OutputSpeed,
        /// Pin 6 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED6: OutputSpeed,
        /// Pin 7 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED7: OutputSpeed,
        /// Pin 8 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED8: OutputSpeed,
        /// Pin 9 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED9: OutputSpeed,
        /// Pin 10 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED10: OutputSpeed,
        /// Pin 11 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED11: OutputSpeed,
        /// Pin 12 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED12: OutputSpeed,
        /// Pin 13 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED13: OutputSpeed,
        /// Pin 14 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED14: OutputSpeed,
        /// Pin 15 configuration bits
        ///
        /// This bit is written by software to configure the I/O output speed
        OSPEED15: OutputSpeed,
    },
    /// GPIO port pull-up/pull-down register
    PUPDR: packed struct(u32) {
        /// Pin 0 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD0: PullUpOrPullDown,
        /// Pin 1 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD1: PullUpOrPullDown,
        /// Pin 2 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD2: PullUpOrPullDown,
        /// Pin 3 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD3: PullUpOrPullDown,
        /// Pin 4 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD4: PullUpOrPullDown,
        /// Pin 5 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD5: PullUpOrPullDown,
        /// Pin 6 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD6: PullUpOrPullDown,
        /// Pin 7 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD7: PullUpOrPullDown,
        /// Pin 8 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD8: PullUpOrPullDown,
        /// Pin 9 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD9: PullUpOrPullDown,
        /// Pin 10 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD10: PullUpOrPullDown,
        /// Pin 11 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD11: PullUpOrPullDown,
        /// Pin 12 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD12: PullUpOrPullDown,
        /// Pin 13 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD13: PullUpOrPullDown,
        /// Pin 14 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD14: PullUpOrPullDown,
        /// Pin 15 configuration bits
        ///
        /// This bit is written by software to configure the I/O pull-up or pull-down
        PUPD15: PullUpOrPullDown,
    },
    /// GPIO port input data register
    IDR: packed struct(u32) {
        /// Pin 0 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 0
        IDR0: bool,
        /// Pin 1 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 1
        IDR1: bool,
        /// Pin 2 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 2
        IDR2: bool,
        /// Pin 3 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 3
        IDR3: bool,
        /// Pin 4 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 4
        IDR4: bool,
        /// Pin 5 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 5
        IDR5: bool,
        /// Pin 6 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 6
        IDR6: bool,
        /// Pin 7 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 7
        IDR7: bool,
        /// Pin 8 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 8
        IDR8: bool,
        /// Pin 9 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 9
        IDR9: bool,
        /// Pin 10 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 10
        IDR10: bool,
        /// Pin 11 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 11
        IDR11: bool,
        /// Pin 12 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 12
        IDR12: bool,
        /// Pin 13 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 13
        IDR13: bool,
        /// Pin 14 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 14
        IDR14: bool,
        /// Pin 15 input data
        ///
        /// This bit is read-only and can be accessed in word mode only. It contains the input value of the pin 15
        IDR15: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved: u16 = 0,
    },
    /// GPIO port output data register
    ODR: packed struct(u32) {
        /// Pin 0 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR0: bool,
        /// Pin 1 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR1: bool,
        /// Pin 2 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR2: bool,
        /// Pin 3 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR3: bool,
        /// Pin 4 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR4: bool,
        /// Pin 5 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR5: bool,
        /// Pin 6 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR6: bool,
        /// Pin 7 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR7: bool,
        /// Pin 8 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR8: bool,
        /// Pin 9 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR9: bool,
        /// Pin 10 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR10: bool,
        /// Pin 11 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR11: bool,
        /// Pin 12 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR12: bool,
        /// Pin 13 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR13: bool,
        /// Pin 14 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR14: bool,
        /// Pin 15 input data
        ///
        /// This bit can be read and written by software.
        ///
        /// Note: For atomic bit set/reset, the ODR bits can be individually set and reset by writing to the BSRR register
        ODR15: bool,
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved: u16 = 0,
    },
    /// GPIO port bit set/reset register
    BSRR: packed struct(u32) {
        /// Set bit ODR0
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS0: enum(u1) {
            /// No action on the ODR0 bit
            NO_ACTION = 0,
            /// Sets the ODR0 bit
            SET_ODR0 = 1,
        },
        /// Set bit ODR1
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS1: enum(u1) {
            /// No action on the ODR1 bit
            NO_ACTION = 0,
            /// Sets the ODR1 bit
            SET_ODR1 = 1,
        },
        /// Set bit ODR2
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS2: enum(u1) {
            /// No action on the ODR2 bit
            NO_ACTION = 0,
            /// Sets the ODR2 bit
            SET_ODR2 = 1,
        },
        /// Set bit ODR3
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS3: enum(u1) {
            /// No action on the ODR3 bit
            NO_ACTION = 0,
            /// Sets the ODR3 bit
            SET_ODR3 = 1,
        },
        /// Set bit ODR4
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS4: enum(u1) {
            /// No action on the ODR4 bit
            NO_ACTION = 0,
            /// Sets the ODR4 bit
            SET_ODR4 = 1,
        },
        /// Set bit ODR5
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS5: enum(u1) {
            /// No action on the ODR5 bit
            NO_ACTION = 0,
            /// Sets the ODR5 bit
            SET_ODR5 = 1,
        },
        /// Set bit ODR6
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS6: enum(u1) {
            /// No action on the ODR6 bit
            NO_ACTION = 0,
            /// Sets the ODR6 bit
            SET_ODR6 = 1,
        },
        /// Set bit ODR7
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS7: enum(u1) {
            /// No action on the ODR7 bit
            NO_ACTION = 0,
            /// Sets the ODR7 bit
            SET_ODR7 = 1,
        },
        /// Set bit ODR8
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS8: enum(u1) {
            /// No action on the ODR8 bit
            NO_ACTION = 0,
            /// Sets the ODR8 bit
            SET_ODR8 = 1,
        },
        /// Set bit ODR9
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS9: enum(u1) {
            /// No action on the ODR9 bit
            NO_ACTION = 0,
            /// Sets the ODR9 bit
            SET_ODR9 = 1,
        },
        /// Set bit ODR10
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS10: enum(u1) {
            /// No action on the ODR10 bit
            NO_ACTION = 0,
            /// Sets the ODR10 bit
            SET_ODR10 = 1,
        },
        /// Set bit ODR11
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS11: enum(u1) {
            /// No action on the ODR11 bit
            NO_ACTION = 0,
            /// Sets the ODR11 bit
            SET_ODR11 = 1,
        },
        /// Set bit ODR12
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS12: enum(u1) {
            /// No action on the ODR12 bit
            NO_ACTION = 0,
            /// Sets the ODR12 bit
            SET_ODR12 = 1,
        },
        /// Set bit ODR13
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS13: enum(u1) {
            /// No action on the ODR13 bit
            NO_ACTION = 0,
            /// Sets the ODR13 bit
            SET_ODR13 = 1,
        },
        /// Set bit ODR14
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS14: enum(u1) {
            /// No action on the ODR14 bit
            NO_ACTION = 0,
            /// Sets the ODR14 bit
            SET_ODR14 = 1,
        },
        /// Set bit ODR15
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BS15: enum(u1) {
            /// No action on the ODR15 bit
            NO_ACTION = 0,
            /// Sets the ODR15 bit
            SET_ODR15 = 1,
        },
        /// Reset bit ODR0
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR0: enum(u1) {
            /// No action on the ODR0 bit
            NO_ACTION = 0,
            /// Sets the ODR0 bit
            RESET_ODR0 = 1,
        },
        /// Reset bit ODR1
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR1: enum(u1) {
            /// No action on the ODR1 bit
            NO_ACTION = 0,
            /// Sets the ODR1 bit
            RESET_ODR1 = 1,
        },
        /// Reset bit ODR2
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR2: enum(u1) {
            /// No action on the ODR2 bit
            NO_ACTION = 0,
            /// Sets the ODR2 bit
            RESET_ODR2 = 1,
        },
        /// Reset bit ODR3
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR3: enum(u1) {
            /// No action on the ODR3 bit
            NO_ACTION = 0,
            /// Sets the ODR3 bit
            RESET_ODR3 = 1,
        },
        /// Reset bit ODR4
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR4: enum(u1) {
            /// No action on the ODR4 bit
            NO_ACTION = 0,
            /// Sets the ODR4 bit
            RESET_ODR4 = 1,
        },
        /// Reset bit ODR5
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR5: enum(u1) {
            /// No action on the ODR5 bit
            NO_ACTION = 0,
            /// Sets the ODR5 bit
            RESET_ODR5 = 1,
        },
        /// Reset bit ODR6
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR6: enum(u1) {
            /// No action on the ODR6 bit
            NO_ACTION = 0,
            /// Sets the ODR6 bit
            RESET_ODR6 = 1,
        },
        /// Reset bit ODR7
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR7: enum(u1) {
            /// No action on the ODR7 bit
            NO_ACTION = 0,
            /// Sets the ODR7 bit
            RESET_ODR7 = 1,
        },
        /// Reset bit ODR8
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR8: enum(u1) {
            /// No action on the ODR8 bit
            NO_ACTION = 0,
            /// Sets the ODR8 bit
            RESET_ODR8 = 1,
        },
        /// Reset bit ODR9
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR9: enum(u1) {
            /// No action on the ODR9 bit
            NO_ACTION = 0,
            /// Sets the ODR9 bit
            RESET_ODR9 = 1,
        },
        /// Reset bit ODR10
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR10: enum(u1) {
            /// No action on the ODR10 bit
            NO_ACTION = 0,
            /// Sets the ODR10 bit
            RESET_ODR10 = 1,
        },
        /// Reset bit ODR11
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR11: enum(u1) {
            /// No action on the ODR11 bit
            NO_ACTION = 0,
            /// Sets the ODR11 bit
            RESET_ODR11 = 1,
        },
        /// Reset bit ODR12
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR12: enum(u1) {
            /// No action on the ODR12 bit
            NO_ACTION = 0,
            /// Sets the ODR12 bit
            RESET_ODR12 = 1,
        },
        /// Reset bit ODR13
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR13: enum(u1) {
            /// No action on the ODR13 bit
            NO_ACTION = 0,
            /// Sets the ODR13 bit
            RESET_ODR13 = 1,
        },
        /// Reset bit ODR14
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR14: enum(u1) {
            /// No action on the ODR14 bit
            NO_ACTION = 0,
            /// Sets the ODR14 bit
            RESET_ODR14 = 1,
        },
        /// Reset bit ODR15
        ///
        /// This bit is write-only and can be accessed in word, half-word or byte mode. A read to this bit returns the value 0
        BR15: enum(u1) {
            /// No action on the ODR15 bit
            NO_ACTION = 0,
            /// Sets the ODR15 bit
            RESET_ODR15 = 1,
        },
    },
    /// GPIO port configuration lock register
    LCKR: packed struct(u32) {
        const Lock = enum(u1) {
            /// Pin 0 configuration not locked
            DONT_LOCK = 0,
            /// Pin 0 configuration locked
            LOCK = 1,
        };

        /// Lock pin 0 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK0: Lock,
        /// Lock pin 1 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK1: Lock,
        /// Lock pin 2 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK2: Lock,
        /// Lock pin 3 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK3: Lock,
        /// Lock pin 4 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK4: Lock,
        /// Lock pin 5 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK5: Lock,
        /// Lock pin 6 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK6: Lock,
        /// Lock pin 7 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK7: Lock,
        /// Lock pin 8 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK8: Lock,
        /// Lock pin 9 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK9: Lock,
        /// Lock pin 10 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK10: Lock,
        /// Lock pin 11 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK11: Lock,
        /// Lock pin 12 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK12: Lock,
        /// Lock pin 13 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK13: Lock,
        /// Lock pin 14 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK14: Lock,
        /// Lock pin 15 configuration
        ///
        /// This bit is read/write but can only be written when the LCKK bit is 0.
        LCK15: Lock,
        /// Lock key
        ///
        /// This bit can be read any time. It can only be modified using the lock key write sequence.
        ///
        /// LOCK key write sequence:
        ///
        /// • Write LCKK = ‘1’ + LCKR[15:0]
        ///
        /// • Write LCKK = ‘0’ + LCKR[15:0]
        ///
        /// • Write LCKK = ‘1’ + LCKR[15:0]
        ///
        /// • Read LCKR
        LCKK: packed union {
            write: u1,
            read: enum(u1) {
                /// Port configuration lock key not active
                UNLOCKED = 0,
                /// Port configuration lock key active. The LCKR register is locked until an MCU reset or a peripheral reset occurs.
                LOCKED = 1,
            },
        },
        /// This field is reserved. DO NOT ACCESS IT!
        _reserved: u15,
    },
    /// GPIO alternate function low register
    AFRL: packed struct(u32) {
        /// Alternate function selection for pin 0
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRL0: AlternateFunction,
        /// Alternate function selection for pin 1
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRL1: AlternateFunction,
        /// Alternate function selection for pin 2
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRL2: AlternateFunction,
        /// Alternate function selection for pin 3
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRL3: AlternateFunction,
        /// Alternate function selection for pin 4
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRL4: AlternateFunction,
        /// Alternate function selection for pin 5
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRL5: AlternateFunction,
        /// Alternate function selection for pin 6
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRL6: AlternateFunction,
        /// Alternate function selection for pin 7
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRL7: AlternateFunction,
    },
    /// GPIO alternate function high register
    AFRH: packed struct(u32) {
        /// Alternate function selection for pin 8
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRH8: AlternateFunction,
        /// Alternate function selection for pin 9
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRH9: AlternateFunction,
        /// Alternate function selection for pin 10
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRH10: AlternateFunction,
        /// Alternate function selection for pin 11
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRH11: AlternateFunction,
        /// Alternate function selection for pin 12
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRH12: AlternateFunction,
        /// Alternate function selection for pin 13
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRH13: AlternateFunction,
        /// Alternate function selection for pin 14
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRH14: AlternateFunction,
        /// Alternate function selection for pin 15
        ///
        /// This bit is written by software to configure alternate function I/O
        AFRH15: AlternateFunction,
    },

    const Mode = enum(u2) {
        /// General purpose input mode
        INPUT = 0b00,
        /// General purpose output mode
        OUTPUT = 0b01,
        /// Alternate function mode
        ALTERNATE_FUNCTION = 0b10,
        /// Analog mode
        ANALOG = 0b11,
    };

    const OutputType = enum(u1) {
        /// Output push-pull
        PUSH_PULL = 0,
        /// Output open-drain
        OPEN_DRAIN = 1,
    };

    const PullUpOrPullDown = enum(u2) {
        /// No pull-up, pull-down
        NO_PULL = 0b00,
        /// Pull-up
        PULL_UP = 0b01,
        /// Pull-down
        PULL_DOWN = 0b10,
    };

    const OutputSpeed = enum(u2) {
        /// Low speed
        LOW = 0b00,
        /// Medium speed
        MEDIUM = 0b01,
        /// Fast speed
        FAST = 0b10,
        /// High speed
        HIGH = 0b11,
    };

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

    /// Set of pin + configuration to be passed to the configure_pins function.
    const PinAndConfig = struct {
        /// Number of the pin to be configured
        number: comptime_int,
        /// Mode to be set for this pin
        mode: Mode,
        /// If the mode is ALTERNATE_FUNCTION, which one?
        alt_function: ?AlternateFunction = null,
        /// Is the output Push-Pull or Open-Drain?
        output_type: ?OutputType = null,
        /// How fast is this pin meant to operate?
        output_speed: ?OutputSpeed = null,
        /// Should the pin be in Pull-Up, Pull-Down or neither?
        pullup_or_pulldown: ?PullUpOrPullDown = null,
    };

    /// Configure one or more pins.
    ///
    /// This is where all the configuration of a pin is done, for each pin the user must pass what mode they want to be set.
    ///
    /// All other parameters, like Alternate Function, Output Type, Output Speed and Pull-Up or Pull-Down are optional and kept at reset value if omitted.
    ///
    /// OBS: This function does not enable the clock to the peripheral, this must be done previously by the user (using the RCC interface).
    pub fn configure_pins(self: *volatile Gpio, comptime pins: []const PinAndConfig) void {
        const std = @import("std");

        inline for (pins) |pin| {
            const mode_bit = comptime blk: {
                var buffer: [6 + (pin.number / 10)]u8 = undefined;
                break :blk try std.fmt.bufPrint(&buffer, "MODER{d}", .{pin.number});
            };

            @field(self.MODER, mode_bit) = pin.mode;

            if (pin.alt_function) |function| {
                if (pin.mode != .ALTERNATE_FUNCTION)
                    @compileError("An alternate function was passed but the mode selected is not ALTERNATE_FUNCTION!");

                var alt_function_bit: [5 + (pin.number / 10)]u8 = undefined;

                if (pin.number > 7) {
                    try std.fmt.bufPrint(&alt_function_bit, "AFRL{d}", .{pin.number});
                    @field(self.AFRL, alt_function_bit) = function;
                } else {
                    try std.fmt.bufPrint(&alt_function_bit, "AFRH{d}", .{pin.number});
                    @field(self.AFRL, alt_function_bit) = function;
                }
            }

            if (pin.output_type) |output_type| {
                const output_type_bit = comptime blk: {
                    var buffer: [3 + (pin.number / 10)]u8 = undefined;
                    break :blk try std.fmt.bufPrint(&buffer, "OT{d}", .{pin.number});
                };

                @field(self.OTYPER, output_type_bit) = output_type;
            }

            if (pin.output_speed) |output_speed| {
                const output_speed_bit = comptime blk: {
                    var buffer: [7 + (pin.number / 10)]u8 = undefined;
                    break :blk try std.fmt.bufPrint(&buffer, "OSPEED{d}", .{pin.number});
                };

                @field(self.OSPEEDR, output_speed_bit) = output_speed;
            }

            if (pin.pullup_or_pulldown) |pullup_or_pulldown| {
                const pullup_or_pulldown_bit = comptime blk: {
                    var buffer: [5 + (pin.number / 10)]u8 = undefined;
                    break :blk try std.fmt.bufPrint(&buffer, "PUPD{d}", .{pin.number});
                };

                @field(self.PUPDR, pullup_or_pulldown_bit) = pullup_or_pulldown;
            }
        }
    }

    /// Lock the desired pins' configuration so that they cannot be altered until the next MCU or peripheral reset.
    ///
    /// Takes an array of pins as argument to determine which pins should have their configuration locked.
    pub fn lock_configuration(self: *volatile Gpio, comptime pins: []const comptime_int) !void {
        const pins_mask: u32 = comptime blk: {
            var pins_mask: u32 = 0;

            for (pins) |pin|
                pins_mask |= (1 << pin);

            break :blk pins_mask;
        };

        // Only word access (32 bits long) is allowed during the lock sequence
        self.LCKR = @bitCast((1 << 16) | pins_mask);
        self.LCKR = @bitCast(pins_mask);
        self.LCKR = @bitCast((1 << 16) | pins_mask);

        // Locking sequence demands a read to the register at the end
        _ = self.LCKR;

        if (self.LCKR.LCKK.read != .LOCKED)
            return error.LockFailed;
    }

    /// Set an output pin's value.
    ///
    /// OBS: This function checks if the pin passed is configured as Output at every call. If performance is critical, consider accessing the ODR register directly instead of using this.
    pub fn set_pin(self: *volatile Gpio, pin: comptime_int, state: bool) void {
        const std = @import("std");

        const mode_bit = comptime blk: {
            var buffer: [6 + (pin / 10)]u8 = undefined;
            break :blk try std.fmt.bufPrint(&buffer, "MODER{d}", .{pin});
        };

        if (@field(self.MODER, mode_bit) != .OUTPUT)
            @panic(std.fmt.comptimePrint("set_pin is valid only for pins set as Output, but pin {d} is not configured as such!", .{pin}));

        const output_bit = comptime blk: {
            var buffer: [4 + (pin / 10)]u8 = undefined;
            break :blk try std.fmt.bufPrint(&buffer, "ODR{d}", .{pin});
        };

        @field(self.ODR, output_bit) = state;
    }

    /// Read an input pin's value.
    ///
    /// OBS: This function checks if the pin passed is configured as Input at every call. If performance is critical, consider accessing the IDR register directly instead of using this.
    pub fn read_pin(self: *volatile Gpio, pin: comptime_int) bool {
        const std = @import("std");

        const mode_bit = comptime blk: {
            var buffer: [6 + (pin / 10)]u8 = undefined;
            break :blk try std.fmt.bufPrint(&buffer, "MODER{d}", .{pin});
        };

        if (@field(self.MODER, mode_bit) != .INPUT)
            @panic(std.fmt.comptimePrint("read_pin is valid only for pins set as Input, but pin {d} is not configured as such!", .{pin}));

        const input_bit = comptime blk: {
            var buffer: [4 + (pin / 10)]u8 = undefined;
            break :blk try @import("std").fmt.bufPrint(&buffer, "IDR{d}", .{pin});
        };

        return @field(self.IDR, input_bit);
    }
};

/// GPIO Port A
pub const portA: *volatile Gpio = @ptrFromInt(0x40020000);
/// GPIO Port B
pub const portB: *volatile Gpio = @ptrFromInt(0x40020400);
/// GPIO Port C
pub const portC: *volatile Gpio = @ptrFromInt(0x40020800);
/// GPIO Port D
pub const portD: *volatile Gpio = @ptrFromInt(0x40020C00);
/// GPIO Port E
pub const portE: *volatile Gpio = @ptrFromInt(0x40021000);
/// GPIO Port H
pub const portH: *volatile Gpio = @ptrFromInt(0x40021C00);

test "field_offsets" {
    const expect = @import("std").testing.expect;

    try expect(@offsetOf(Gpio, "MODER") == 0x00);
    try expect(@offsetOf(Gpio, "OTYPER") == 0x04);
    try expect(@offsetOf(Gpio, "OSPEEDR") == 0x08);
    try expect(@offsetOf(Gpio, "PUPDR") == 0x0C);
    try expect(@offsetOf(Gpio, "IDR") == 0x10);
    try expect(@offsetOf(Gpio, "ODR") == 0x14);
    try expect(@offsetOf(Gpio, "BSRR") == 0x18);
    try expect(@offsetOf(Gpio, "LCKR") == 0x1C);
    try expect(@offsetOf(Gpio, "AFRL") == 0x20);
    try expect(@offsetOf(Gpio, "AFRH") == 0x24);
}
