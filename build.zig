const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimization_level = b.standardOptimizeOption(.{ .preferred_optimize_mode = std.builtin.OptimizeMode.ReleaseSafe });
    const target = b.resolveTargetQuery(.{
        // Blackpill has a Cortex-m4
        .cpu_model = std.zig.CrossTarget.CpuModel{ .explicit = &std.Target.arm.cpu.cortex_m4 },
        // Use thumb instructions set
        .cpu_arch = .thumb,
        // I think this one enables the FPU, but still need to check
        .cpu_features_add = std.Target.arm.featureSet(&[_]std.Target.arm.Feature{std.Target.arm.Feature.vfp4d16}),
        .os_tag = .freestanding,
        .abi = .none,
    });

    const elf = b.addExecutable(.{
        .name = "project.elf",
        .target = target,
        .root_source_file = b.path("src/startup.zig"),
        .optimize = optimization_level,
        .single_threaded = true,
    });
    elf.entry = .{ .symbol_name = "reset_handler" };
    elf.setLinkerScript(b.path("src/memory.ld"));

    // Copy elf to output dir
    const copy_elf = b.addInstallArtifact(elf, .{});
    b.default_step.dependOn(&copy_elf.step);

    // Make a bin out of elf
    const bin = b.addObjCopy(elf.getEmittedBin(), .{
        .format = .bin,
    });
    bin.step.dependOn(&elf.step);

    // Copy bin to the output directory
    const copy_bin = b.addInstallBinFile(bin.getOutput(), "project.bin");
    b.default_step.dependOn(&copy_bin.step);

    // Target for flashing the binary to the board
    const flash_cmd = b.addSystemCommand(&[_][]const u8{"openocd"});
    flash_cmd.addArgs(&[_][]const u8{
        "-f",
        "/usr/share/openocd/scripts/interface/stlink.cfg",
        "-f",
        "/usr/share/openocd/scripts/target/stm32f4x.cfg",
        "-c",
        b.fmt("program {s} 0x08000000 verify reset exit", .{b.getInstallPath(copy_bin.dir, copy_bin.dest_rel_path)}),
    });
    flash_cmd.step.dependOn(&copy_bin.step);

    const flash_step = b.step("flash", "Flash the application to a connected board");
    flash_step.dependOn(&flash_cmd.step);

    // Target for monitoring the board's serial port.
    const serial_port = b.option([]const u8, "serial_port", "Connected board's serial port (defaults to '/dev/ttyUSB0').") orelse "/dev/ttyUSB0";
    const baud_rate = b.option(u32, "baud_rate", "Connected board's baud rate (defaults to 115200).") orelse 115200;

    const monitor_cmd = b.addSystemCommand(&[_][]const u8{"screen"});
    monitor_cmd.addArgs(&[_][]const u8{
        serial_port,
        b.fmt("{d}", .{baud_rate}),
    });

    const monitor_step = b.step("monitor", "Monitor the connected board's serial port. Note: requires FTDI adapter (for now...)");
    monitor_step.dependOn(&monitor_cmd.step);

    // Target for attaching a debugger to the board
    const debug_cmd = b.addSystemCommand(&[_][]const u8{"openocd"});
    debug_cmd.addArgs(&[_][]const u8{
        "-f",
        "/usr/share/openocd/scripts/interface/stlink.cfg",
        "-f",
        "/usr/share/openocd/scripts/target/stm32f4x.cfg",
        "-c",
        b.fmt("program {s} 0x08000000 verify reset", .{b.getInstallPath(copy_bin.dir, copy_bin.dest_rel_path)}),
    });
    debug_cmd.step.dependOn(&copy_bin.step);

    const debug_step = b.step("debug", "Flash the application to a connected board and attach a debugger to it");
    debug_step.dependOn(&debug_cmd.step);

    // Step to run unit tests
    const unit_tests = b.addTest(.{
        .root_source_file = b.path("src/testing.zig"),
        .optimize = optimization_level,
    });
    const run_unit_tests = b.addRunArtifact(unit_tests);

    const test_step = b.step("test", "Run all unit tests");
    test_step.dependOn(&run_unit_tests.step);
}
