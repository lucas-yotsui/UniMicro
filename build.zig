const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    const optimization_level = b.standardOptimizeOption(.{ .preferred_optimize_mode = std.builtin.OptimizeMode.ReleaseSmall });
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
        .root_source_file = .{ .path = "src/startup.zig" },
        .optimize = optimization_level,
        .single_threaded = true,
    });
    elf.entry = .{ .symbol_name = "reset_handler" };
    elf.setLinkerScript(.{ .path = "src/memory.ld" });

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

    // const flash_cli = fmt.allocPrint(allocator, "openocd ", ) catch "";
    const flash_cmd = b.addSystemCommand(&[_][]const u8{"openocd"});
    // std.debug.print(
    //     "-f /usr/share/openocd/scripts/interface/stlink.cfg -f /usr/share/openocd/scripts/target/stm32f4x.cfg -c \'program {s} 0x08000000 reset exit\'",
    //     .{b.getInstallPath(copy_bin.dir, copy_bin.dest_rel_path)},
    // );

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
}
