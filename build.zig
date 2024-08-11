const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b;
}

pub fn init(b: *std.Build, options: UniMicroOptions) *std.Build.Step.InstallFile {
    // Determine the architecture to be used.
    const target = b.resolveTargetQuery(options.target_platform.cpu.target);

    // Compile the ELF
    const elf = b.addExecutable(.{
        .name = b.fmt("{s}.elf", .{options.name}),
        .root_source_file = .{ .cwd_relative = root() ++ "/main.zig" },
        .target = target,
        .optimize = options.optimization_level,
        .single_threaded = options.target_platform.single_threaded,
        .linkage = .static,
    });

    // Set the entrypoint to the unimicro_main function. It prepares everything
    // and then calls the user's main function.
    elf.entry = .{ .symbol_name = "unimicro_main" };

    // Module with the HAL to be imported by the user.
    const hal_module = b.createModule(.{
        .root_source_file = .{
            .cwd_relative = b.fmt("{s}/hal/{s}/{s}/hal.zig", .{
                root(),
                options.target_platform.manufacturer,
                options.target_platform.name,
            }),
        },
        .target = target,
        .optimize = options.optimization_level,
        .single_threaded = options.target_platform.single_threaded,
    });

    // Create an app module containing the user's code.
    const app_module = b.createModule(.{
        .root_source_file = options.main_file,
        .target = target,
        .optimize = options.optimization_level,
        .single_threaded = options.target_platform.single_threaded,
        .imports = &.{
            .{ .name = "UniMicro", .module = hal_module },
        },
    });

    // Add the app module as an import on the main.zig file.
    elf.root_module.addImport("app", app_module);

    // Create a module containing the functions startup and hang, which are
    // processor specific and, threrefore, come from the cpus/ directory.
    const cpu_module = b.createModule(.{
        .root_source_file = .{ .cwd_relative = b.fmt("{s}/cpus/{s}/{s}.zig", .{
            root(),
            options.target_platform.cpu.manufacturer,
            options.target_platform.cpu.name,
        }) },
        .target = target,
        .optimize = options.optimization_level,
        .single_threaded = options.target_platform.single_threaded,
    });

    // Add the cpu module as an import on the main.zig file.
    elf.root_module.addImport("cpu", cpu_module);

    // Create the executable that generates the linker script.
    const linker_gen = b.addExecutable(.{
        .name = "linker_generator",
        .root_source_file = .{ .cwd_relative = root() ++ "/utils/linker_generator.zig" },
        .target = b.graph.host,
        .optimize = std.builtin.OptimizeMode.ReleaseFast,
    });

    // Add an import "UniMicro" to the linker_generator executable.
    linker_gen.root_module.addImport("UniMicro", b.createModule(.{
        .root_source_file = .{ .cwd_relative = root() ++ "/build.zig" },
    }));

    // Stringify the args to be passed to the linker_generator.
    const args_str = std.json.stringifyAlloc(b.allocator, options.target_platform, .{}) catch @panic("Out of Memory!");

    // Run the linker_generator.
    const linker_gen_run = b.addRunArtifact(linker_gen);
    linker_gen_run.addArg(args_str);

    // Set the linker script of the ELF to be that generated by the
    // linker generator executable.
    elf.setLinkerScript(linker_gen_run.addOutputFileArg("memory.ld"));

    // Copy elf to output dir
    const copy_elf = b.addInstallArtifact(elf, .{});
    b.default_step.dependOn(&copy_elf.step);

    // Make a bin out of elf
    const bin = b.addObjCopy(elf.getEmittedBin(), .{
        .format = .bin,
    });
    bin.step.dependOn(&copy_elf.step);

    // Copy bin to the output directory
    const copy_bin = b.addInstallBinFile(bin.getOutput(), b.fmt("{s}.bin", .{options.name}));
    b.default_step.dependOn(&copy_bin.step);

    return copy_bin;
}

inline fn root() []const u8 {
    return comptime (std.fs.path.dirname(@src().file) orelse ".");
}

pub const UniMicroOptions = struct {
    name: []const u8,
    main_file: std.Build.LazyPath,
    optimization_level: std.builtin.OptimizeMode,
    target_platform: Chip,
};

pub const supported_chips = .{
    .stmicro = .{
        .stm32f411cc = .{
            .manufacturer = "stmicro",
            .name = "stm32f411cc",
            .cpu = supported_cpus.arm.cortex_m4f,
            .memory_sections = &.{
                MemorySection{ .origin = 0x0800_0000, .length = 256 * Units.KB, .type = .FLASH },
                MemorySection{ .origin = 0x2000_0000, .length = 128 * Units.KB, .type = .RAM },
            },
            .interrupts = &.{
                "nmi_fault",
                "hard_fault",
                "memory_management_fault",
                "bus_fault",
                "usage_fault",
                "svcall",
                "debug_monitor",
                "pendsv",
                "systick",
                "window_watchdog",
                "exti_16_pvd",
                "exti_21_tamper_timestamp",
                "exti_22_rtc_wakeup",
                "flash",
                "rcc",
                "exti_line_0",
                "exti_line_1",
                "exti_line_2",
                "exti_line_3",
                "exti_line_4",
                "dma1_stream0",
                "dma1_stream1",
                "dma1_stream2",
                "dma1_stream3",
                "dma1_stream4",
                "dma1_stream5",
                "dma1_stream6",
                "adc",
                "exti_line_5_to_9",
                "timer1_break_and_timer9_global",
                "timer1_update_and_timer10_global",
                "timer1_trigger_and_commutation_and_timer11_global",
                "timer1_capture_compare",
                "timer2_global",
                "timer3_global",
                "timer4_global",
                "i2c1_event",
                "i2c1_error",
                "i2c2_event",
                "i2c2_error",
                "spi1_global",
                "spi2_global",
                "usart1_global",
                "usart2_global",
                "exti_line_10_to_15",
                "exti_line_17_and_rtc_alarm",
                "exti_line_18_and_usb_otg_fs_wakeup",
                "dma1_stream7",
                "sdio_global",
                "timer5_global",
                "spi3_global",
                "dma2_stream0",
                "dma2_stream1",
                "dma2_stream2",
                "dma2_stream3",
                "dma2_stream4",
                "usb_otg_fs_global",
                "dma2_stream5",
                "dma2_stream6",
                "dma2_stream7",
                "usart6_global",
                "i2c3_event",
                "i2c3_error",
                "fpu_global",
                "spi4_global",
                "spi5_global",
            },
        },
    },
};

pub const supported_cpus = .{
    .arm = .{
        .cortex_m4 = Cpu{
            .manufacturer = "arm",
            .name = "cortex_m4",
            .target = .{
                .cpu_model = std.zig.CrossTarget.CpuModel{ .explicit = &std.Target.arm.cpu.cortex_m4 },
                .cpu_arch = .thumb,
                .os_tag = .freestanding,
                .abi = .none,
            },
        },
        .cortex_m4f = Cpu{
            .manufacturer = "arm",
            .name = "cortex_m4",
            .target = .{
                .cpu_model = std.zig.CrossTarget.CpuModel{ .explicit = &std.Target.arm.cpu.cortex_m4 },
                .cpu_arch = .thumb,
                .cpu_features_add = std.Target.arm.featureSet(&[_]std.Target.arm.Feature{std.Target.arm.Feature.vfp4d16}),
                .os_tag = .freestanding,
                .abi = .none,
            },
        },
    },
};

pub const Chip = struct {
    name: []const u8,
    manufacturer: []const u8,

    cpu: Cpu,
    memory_sections: []const MemorySection,

    interrupts: []const []const u8,
    single_threaded: bool = false,
};

pub const Cpu = struct {
    name: []const u8,
    manufacturer: []const u8,

    target: std.Target.Query,
};

pub const MemorySection = struct {
    /// Origin of this memory region
    origin: usize,
    /// Size of this memory region
    length: usize,
    /// The type of memory this region is
    type: Type,

    const Type = union(enum) {
        /// Non-volatile storage memory. Code goes here
        FLASH,
        /// Volatile memory. Variables go here.
        RAM,
        /// Memory region that exists, but must not be accessed.
        RESERVED,
        /// Board-specific memory region
        CUSTOM: CustomRegion,
    };

    const CustomRegion = struct {
        /// Custom regions do not have automatic name assignment, it must
        /// be unique and provided by user. Compile error otherwise.
        name: []const u8,
        /// What can you do with this region?
        permissions: Permissions,

        const Permissions = packed struct(u3) {
            /// Can you read from this region?
            readable: bool,
            /// Can you write to this region?
            writable: bool,
            /// Can you execute code from this region?
            executable: bool,
        };
    };
};

/// Utility for handling different memory size units.
const Units = .{
    // Linker uses B by default, so no conversion required.
    .B = 1,
    // Convert KB to B
    .KB = 1024,
    // Convert MB to B
    .MB = 1024 * 1024,
};
