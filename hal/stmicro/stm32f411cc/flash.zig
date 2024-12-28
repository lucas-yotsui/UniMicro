const Flash = packed struct {
    /// Flash access control register
    ///
    /// The Flash access control register is used to enable/disable the acceleration features and control the Flash memory access time according to CPU frequency
    ACR: packed struct(u32) {
        /// Latency
        ///
        /// These bits represent the ratio of the CPU clock period to the Flash memory access time
        LATENCY: u4,
        /// This field is reserved DO NOT ACCESS IT!
        _reserved1: u4,
        /// Prefetch enable
        PRFTEN: enum(u1) {
            /// Prefetch is disabled
            PREFETCH_DISABLED = 0,
            /// Prefetch is enabled
            PREFETCH_ENABLED = 1,
        },
        /// Instruction cache enable
        ICEN: enum(u1) {
            /// Instruction cache is disabled
            INSTRUCTION_CACHE_DISABLED = 0,
            /// Instruction cache is enabled
            INSTRUCTION_CACHE_ENABLED = 1,
        },
        /// Data cache enable
        DCEN: enum(u1) {
            /// Data cache is disabled
            DATA_CACHE_DISABLED = 0,
            /// Data cache is enabled
            DATA_CACHE_ENABLED = 1,
        },
        /// Instruction cache reset
        ///
        /// This bit can be written only when the I cache is disabled
        ICRST: enum(u1) {
            /// Instruction cache is not reset
            INSTRUCTION_CACHE_NOT_RESET = 0,
            /// Instruction cache is reset
            INSTRUCTION_CACHE_RESET = 1,
        },
        /// Data cache reset
        ///
        /// This bit can be written only when the D cache is disabled
        DCRST: enum(u1) {
            /// Data cache is not reset
            DATA_CACHE_NOT_RESET = 0,
            /// Data cache is reset
            DATA_CACHE_RESET = 1,
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved2: u19,
    },
    /// Flash key register
    ///
    /// The Flash key register is used to allow access to the Flash control register and so, to allow program and erase operations
    ///
    /// The values of KEY1 and KEY2 must be programmed consecutively to unlock the FLASH_CR register and allow programming/erasing it
    KEYR: enum(u32) {
        /// First key for unlocking the CR register
        KEY1 = 0x45670123,
        /// Second key for unlocking the CR register
        KEY2 = 0xCDEF89AB,
    },
    /// Flash option key register
    ///
    /// The Flash option key register is used to allow program and erase operations in the user configuration sector
    ///
    /// The values of OPTKEY1 and OPTKEY2 must be programmed consecutively to unlock the FLASH_OPTCR register and allow programming/erasing it
    OPTKEYR: enum(u32) {
        /// First key for unlocking the OPTCR register
        OPTKEY1 = 0x08192A3B,
        /// Second key for unlocking the OPTCR register
        OPTKEY2 = 0x4C5D6E7F,
    },
    /// Flash status register
    ///
    /// The Flash status register gives information on ongoing program and erase operations
    SR: packed struct(u32) {
        /// End of operation
        ///
        /// Set by hardware when one or more Flash memory operations (program/erase) has/have completed successfully It is set only if the end of operation interrupts are enabled
        EOP: packed union {
            /// Use this enum to interpret data when reading this bit
            read: enum(u1) {
                /// Operation has not completed successfully
                NOT_COMPLETED = 0,
                /// Operation has completed successfully
                COMPLETED = 1,
            },
            /// Use this enum when writing to this bit
            write: enum(u1) {
                /// Clear this bit
                CLEAR = 1,
            },
        },
        /// Operation error
        ///
        /// Set by hardware when a flash operation (programming / erase /read) request is detected and can not be run because of parallelism, alignment, or write protection error This bit is set only if error interrupts are enabled
        OPERR: enum(u1) {
            /// No error during the operation
            NO_ERROR = 0,
            /// Parallelism, alignment or write protection error during the operation
            ERROR = 1,
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved1: u2,
        /// Write protection error
        ///
        /// Set by hardware when an address to be erased/programmed belongs to a write-protected part of the Flash memory
        WRPERR: packed union {
            /// Use this enum to interpret data when reading this bit
            read: enum(u1) {
                /// No error during the operation
                NO_ERROR = 0,
                /// Address belongs to a write-protected part of the Flash memory
                ERROR = 1,
            },
            /// Use this enum when writing to this bit
            write: enum(u1) {
                /// Clear this bit
                CLEAR = 1,
            },
        },
        /// Programming alignment error
        ///
        /// Set by hardware when the data to program cannot be contained in the same 128-bit Flash memory row
        PGAERR: packed union {
            /// Use this enum to interpret data when reading this bit
            read: enum(u1) {
                /// No error during the operation
                NO_ERROR = 0,
                /// Data to program cannot be contained in the same 128-bit Flash memory row
                ERROR = 1,
            },
            /// Use this enum when writing to this bit
            write: enum(u1) {
                /// Clear this bit
                CLEAR = 1,
            },
        },
        /// Programming parallelism error
        ///
        /// Set by hardware when the size of the access (byte, half-word, word, double word) during the program sequence does not correspond to the parallelism configuration PSIZE (x8, x16, x32, x64)
        PGPERR: packed union {
            /// Use this enum to interpret data when reading this bit
            read: enum(u1) {
                /// No error during the operation
                NO_ERROR = 0,
                /// Size of the access (byte, half-word, word, double word) does not match the parallelism configuration
                ERROR = 1,
            },
            /// Use this enum when writing to this bit
            write: enum(u1) {
                /// Clear this bit
                CLEAR = 1,
            },
        },
        /// Programming sequence error
        ///
        /// Set by hardware when a write access to the Flash memory is performed by the code while the control register has not been correctly configured
        PGSERR: packed union {
            /// Use this enum to interpret data when reading this bit
            read: enum(u1) {
                /// No error during the operation
                NO_ERROR = 0,
                /// Code tried to write to the Flash memory while the control register has not been correctly configured
                ERROR = 1,
            },
            /// Use this enum when writing to this bit
            write: enum(u1) {
                /// Clear this bit
                CLEAR = 1,
            },
        },
        /// Read Protection Error (pcrop)
        ///
        /// Set by hardware when an address to be read through the Dbus belongs to a read protected part of the flash
        RDERR: packed union {
            /// Use this enum to interpret data when reading this bit
            read: enum(u1) {
                /// No error during the operation
                NO_ERROR = 0,
                /// Address to be read through the Dbus belongs to a read protected part of the Flash memory
                ERROR = 1,
            },
            /// Use this enum when writing to this bit
            write: enum(u1) {
                /// Clear this bit
                CLEAR = 1,
            },
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved2: u7,
        /// Busy
        ///
        /// Clear this bit
        /// This bit indicates that a Flash memory operation is in progress. It is set at the beginning of a Flash memory operation and cleared when the operation finishes or an error occurs
        BSY: enum(u1) {
            /// No Flash memory operation ongoing
            NO_OPERATION_ONGOING = 0,
            /// Flash memory operation ongoing
            OPERATION_ONGOING = 1,
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved3: u15,
    },
    /// Flash control register
    ///
    /// The Flash control register is used to configure and start Flash memory operations
    CR: packed struct(u32) {
        /// Programming
        PG: enum(u1) {
            /// Flash programming deactivated
            PROGRAMMING_DEACTIVATED = 0,
            /// Flash programming activated
            PROGRAMMING_ACTIVATED = 1,
        },
        /// Sector Erase
        SER: enum(u1) {
            /// Sector erase deactivated
            SECTOR_ERASE_DEACTIVATED = 0,
            /// Sector erase activated
            SECTOR_ERASE_ACTIVATED = 1,
        },
        /// Mass Erase
        MER: enum(u1) {
            /// Erase for all user sectors deactivated
            MASS_ERASE_DEACTIVATED = 0,
            /// Erase activated for all user sectors
            MASS_ERASE_ACTIVATED = 1,
        },
        /// Sector number
        ///
        /// These bits select the sector to erase
        SNB: enum(u4) {
            /// Sector 0
            SECTOR_0 = 0,
            /// Sector 1
            SECTOR_1 = 1,
            /// Sector 2
            SECTOR_2 = 2,
            /// Sector 3
            SECTOR_3 = 3,
            /// Sector 4
            SECTOR_4 = 4,
            /// Sector 5
            SECTOR_5 = 5,
            /// Sector 6
            SECTOR_6 = 6,
            /// Sector 7
            SECTOR_7 = 7,
            /// User specific sector
            USER_SPECIFIC_SECTOR = 0b1100,
            /// User configuration sector
            USER_CONFIGURATION_SECTOR = 0b1101,
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved1: u1,
        /// Program size
        ///
        /// These bits select the program parallelism
        PSIZE: enum(u2) {
            /// program x8
            BYTE = 0b00,
            /// program x16
            HALF_WORD = 0b01,
            /// program x32
            WORD = 0b10,
            /// program x64
            DOUBLE_WORD = 0b11,
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved2: u6,
        /// Start
        ///
        /// This bit triggers an erase operation when set. It is set only by software and cleared when the BSY bit is cleared
        STRT: enum(u1) {
            /// Trigger an erase operation
            CLEAR = 1,
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved3: u7,
        /// End of operation interrupt enable
        ///
        /// This bit enables the interrupt generation when the EOP bit in the FLASH_SR register goes to 1
        EOPIE: enum(u1) {
            /// Error interrupt generation disabled
            END_OF_OPERATION_INTERRUPT_DISABLED = 0,
            /// Error interrupt generation enabled
            END_OF_OPERATION_INTERRUPT_ENABLED = 1,
        },
        /// Error interrupt enable
        ///
        /// This bit enables the interrupt generation when the OPERR bit in the FLASH_SR register is set to 1
        ERRIE: enum(u1) {
            /// Error interrupt generation disabled
            ERROR_INTERRUPT_DISABLED = 0,
            /// Error interrupt generation enabled
            ERROR_INTERRUPT_ENABLED = 1,
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved4: u5,
        /// Lock
        ///
        /// Write to 1 only. When it is set, this bit indicates that the FLASH_CR register is locked. It is cleared by hardware after detecting the unlock sequence.
        ///
        /// In the event of an unsuccessful unlock operation, this bit remains set until the next reset.
        LOCK: packed union {
            /// Use this enum to interpret data when reading this bit
            read: enum(u1) {
                /// CR register is unlocked
                UNLOCKED = 0,
                /// CR register is locked
                LOCKED = 1,
            },
            /// Use this enum when writing to this bit
            write: enum(u1) {
                /// Lock the CR register
                LOCK = 1,
            },
        },
    },
    /// Flash option control register
    ///
    /// The FLASH_OPTCR register is used to modify the user option bytes
    OPTCR: packed struct(u32) {
        /// Option lock
        ///
        /// Write to 1 only. When this bit is set, it indicates that the FLASH_OPTCR register is locked. This bit is cleared by hardware after detecting the unlock sequence.
        ///
        /// In the event of an unsuccessful unlock operation, this bit remains set until the next reset
        OPTLOCK: packed union {
            /// Use this enum to interpret data when reading this bit
            read: enum(u1) {
                /// OPTCR register is unlocked
                UNLOCKED = 0,
                /// OPTCR register is locked
                LOCKED = 1,
            },
            /// Use this enum when writing to this bit
            write: enum(u1) {
                /// Lock the OPTCR register
                LOCK = 1,
            },
        },
        /// Option start
        ///
        /// This bit triggers a user option operation when set. It is set only by software and cleared when the BSY bit is cleared
        OPTSTRT: enum(u1) {
            /// Trigger a user option operation
            CLEAR = 1,
        },
        /// BOR reset Level
        ///
        /// These bits contain the supply level threshold that activates/releases the reset. They can be written to program a new BOR level. By default, BOR is off. When the supply voltage (VDD) drops below the selected BOR level, a device reset is generated
        BOR_LEV: enum(u2) {
            /// BOR Level 3 (VBOR3), brownout threshold level 3
            BOR_LEVEL_3 = 0b00,
            /// BOR Level 2 (VBOR2), brownout threshold level 2
            BOR_LEVEL_2 = 0b01,
            /// BOR Level 1 (VBOR1), brownout threshold level 1
            BOR_LEVEL_1 = 0b10,
            /// BOR off, POR/PDR reset threshold level is applied
            BOR_OFF = 0b11,
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved1: u1,
        /// User option bytes
        ///
        /// These bits contain the value of the user option byte after reset. They can be written to program a new user option byte value into Flash memory
        USER: packed struct(u3) {
            WDG_SW: bool,
            nRST_STOP: bool,
            nRST_STDBY: bool,
        },
        /// Read protect
        ///
        /// These bits contain the value of the read-protection option level after reset. They can be written to program a new read protection value into Flash memory
        RDP: enum(u8) {
            /// Read protection not active
            LEVEL_0 = 0xAA,
            /// Read protection of memories active
            LEVEL_1 = 0xBB,
            /// Chip read protection active
            LEVEL_2 = 0xCC,
        },

        // FIXME: The field below is probably all wrong. The reference manual is a confusing piece of garbage and I can't understand that shit of a section
        // I'll not even document this properly, since it'll probably be wrong

        /// Not write protect
        ///
        /// These bits contain the value of the write-protection option bytes of sectors after reset. They can be written to program a new write protect value into Flash memory
        nWRP: packed struct(u8) {
            SECTOR_0: WriteProtectionOption,
            SECTOR_1: WriteProtectionOption,
            SECTOR_2: WriteProtectionOption,
            SECTOR_3: WriteProtectionOption,
            SECTOR_4: WriteProtectionOption,
            SECTOR_5: WriteProtectionOption,
            SECTOR_6: WriteProtectionOption,
            SECTOR_7: WriteProtectionOption,

            const WriteProtectionOption = packed union {
                SPRMOD_RESET: enum(u1) {
                    WRITE_PROTECTION_ACTIVE = 0,
                    WRITE_PROTECTION_NOT_ACTIVE = 1,
                },
                SPRMOD_SET: enum(u1) {
                    PCROP_PROTECTION_NOT_ACTIVE = 0,
                    PCROP_PROTECTION_ACTIVE = 1,
                },
            };
        },
        /// This field is reserved DO NOT ACCESS IT!
        _reserved2: u7,
        /// Selection of Protection Mode of nWPRi bits
        SPRMOD: enum(u1) {
            /// PCROP disabled, nWPRi bits used for Write Protection on sector i
            PCROP_DISABLED = 0,
            /// PCROP enabled, nWPRi bits used for PCROP Protection on sector i
            PCROP_ENABLED = 1,
        },
    },
};

/// Embedded Flash memory
pub const flash: *volatile Flash = @ptrFromInt(0x40023C00);

test "field_offsets" {
    const expect = @import("std").testing.expect;

    try expect(@offsetOf(Flash, "ACR") == 0x00);
    try expect(@offsetOf(Flash, "KEYR") == 0x04);
    try expect(@offsetOf(Flash, "OPTKEYR") == 0x08);
    try expect(@offsetOf(Flash, "SR") == 0x0C);
    try expect(@offsetOf(Flash, "CR") == 0x10);
    try expect(@offsetOf(Flash, "OPTCR") == 0x14);
}
