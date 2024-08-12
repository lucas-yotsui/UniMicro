const std = @import("std");
const UniMicro = @import("UniMicro/build");

pub fn build(b: *std.Build) void {
    const optimization_level = b.standardOptimizeOption(.{ .preferred_optimize_mode = .ReleaseSmall });

    var install_step = UniMicro.init(b, .{
        .name = "blinky",
        .main_file = .{ .cwd_relative = "src/main.zig" },
        .optimization_level = optimization_level,
        .target_platform = UniMicro.supported_chips.stmicro.stm32f411cc,
    });

    // Target for flashing the binary to the board
    const flash_cmd = b.addSystemCommand(&[_][]const u8{"openocd"});
    flash_cmd.addArgs(&[_][]const u8{
        "-f",
        "/usr/share/openocd/scripts/interface/stlink.cfg",
        "-f",
        "/usr/share/openocd/scripts/target/stm32f4x.cfg",
        "-c",
        b.fmt("program {s} 0x08000000 verify reset exit", .{b.getInstallPath(install_step.dir, install_step.dest_rel_path)}),
    });
    flash_cmd.step.dependOn(&install_step.step);

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
        b.fmt("program {s} 0x08000000 verify reset", .{b.getInstallPath(install_step.dir, install_step.dest_rel_path)}),
    });
    debug_cmd.step.dependOn(&install_step.step);

    const debug_step = b.step("debug", "Flash the application to a connected board and attach a debugger to it");
    debug_step.dependOn(&debug_cmd.step);
}
