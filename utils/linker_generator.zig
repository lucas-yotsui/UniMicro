const std = @import("std");
const Chip = @import("UniMicro/build").Chip;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    var arena = std.heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    const allocator = arena.allocator();
    const args = try std.process.argsAlloc(allocator);

    const json_args = args[1];
    const output_path = args[2];

    const parsed_args = try std.json.parseFromSlice(Chip, allocator, json_args, .{});
    const target = parsed_args.value;

    // ------------------------------ Create the linker file ------------------------------- \\
    const file = try std.fs.cwd().createFile(output_path, .{});
    defer file.close();

    const writer = file.writer();

    // ----------------------------------- Insert header ----------------------------------- \\
    try writer.print(
        \\/*
        \\ * This file was auto-generated by UniMicro
        \\ *
        \\ * Target CPU:  
        \\ *   manufacturer: {[cpu_manufacturer]s}
        \\ *   model: {[cpu_name]s}
        \\ *
        \\ * Target Chip:
        \\ *   manufacturer: {[chip_manufacturer]s}
        \\ *   model: {[chip_name]s}
        \\ */
        \\
    , .{
        .cpu_manufacturer = target.cpu.manufacturer,
        .cpu_name = target.cpu.name,
        .chip_manufacturer = target.manufacturer,
        .chip_name = target.name,
    });

    // ------------------------------- Create memory regions ------------------------------- \\
    try writer.writeAll("MEMORY {\n");
    { // Create a scope so that variables created here are not dragged throughout the program
        var id = [3]usize{ 0, 0, 0 };
        for (target.memory_sections) |section| {
            switch (section.type) {
                .FLASH => {
                    try writer.print("  FLASH_{d} (rx!w) : ", .{id[0]});
                    id[0] += 1;
                },

                .RAM => {
                    try writer.print("  RAM_{d} (rwx) : ", .{id[1]});
                    id[1] += 1;
                },

                .RESERVED => {
                    try writer.print("  RESERVED_{d} (!rwx) : ", .{id[2]});
                    id[2] += 1;
                },

                .CUSTOM => |custom| {
                    const capitalized = try std.ascii.allocUpperString(std.heap.page_allocator, custom.name);

                    try writer.print("  {s} (", .{capitalized});
                    if (custom.permissions.readable) try writer.writeAll("r");
                    if (custom.permissions.writable) try writer.writeAll("w");
                    if (custom.permissions.executable) try writer.writeAll("x");

                    if (!custom.permissions.readable or !custom.permissions.writable or !custom.permissions.executable) {
                        try writer.writeAll("!");

                        if (!custom.permissions.readable) try writer.writeAll("r");
                        if (!custom.permissions.writable) try writer.writeAll("w");
                        if (!custom.permissions.executable) try writer.writeAll("x");
                    }

                    try writer.writeAll(") : ");
                },
            }

            try writer.print("ORIGIN = 0x{X:0>8}, LENGTH = 0x{X:0>8}\n", .{ section.origin, section.length });
        }
    }
    try writer.writeAll("}\n\n");

    // -------------------------- Provide symbols for use in code -------------------------- \\
    switch (target.cpu.target.cpu_arch.?) {
        // ARM architecture requires stack pointer to be placed on the very end of the RAM
        .arm, .thumb => try writer.writeAll("_stack_top = ORIGIN(RAM_0) + LENGTH(RAM_0);\n\n"),
        else => {},
    }

    // -------------------------------- Map memory sections -------------------------------- \\
    try writer.writeAll("\nSECTIONS {\n");
    try writer.writeAll(
        \\  .text :
        \\  {
        \\    _text = .;
        \\    KEEP(*(.vector*))
        \\    *(.text*)
        \\    *(.rodata)
        \\    _etext = .;
        \\  } >FLASH_0
        \\
        \\
    );

    switch (target.cpu.target.cpu_arch.?) {
        .arm, .thumb => try writer.writeAll(
            \\  .ARM.exidx : 
            \\  {
            \\    *(.ARM.exidx* .gnu.linkonce.armexidx.*)
            \\  } >FLASH_0
            \\
            \\
        ),
        else => {},
    }

    try writer.writeAll(
        \\  .data : 
        \\  {
        \\    _data = .;
        \\    *(.data*)
        \\    _edata = .;
        \\  } >RAM_0 AT >FLASH_0
        \\  _data_loadaddr = LOADADDR(.data);
        \\
        \\
    );

    try writer.writeAll(
        \\  .bss (NOLOAD) : 
        \\  {
        \\    _bss = .;
        \\    *(.bss*)
        \\    *(COMMON)
        \\    _ebss = .;
        \\  } >RAM_0
        \\
    );

    try writer.writeAll("}\n");
}
