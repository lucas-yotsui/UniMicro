const interrupts = @import("interrupts.zig");

comptime {
    const default_nvic: interrupts.NestedVectorInterruptController = .{};

    @export(default_nvic, .{ .name = "vector_table", .section = ".vector", .linkage = .weak });
}
