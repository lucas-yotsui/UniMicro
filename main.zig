const std = @import("std");
const app = @import("app");
const cpu = @import("cpu");

// Panic handler for the application, if not defined by user defaults to a simple wrapper to call unimicro.hang().
const panic: fn (msg: []const u8, stack_trace: ?*std.builtin.StackTrace, ret_addr: ?usize) noreturn = if (@hasDecl(app, "panic")) app.panic else struct {
    pub fn panic(msg: []const u8, stack_trace: ?*std.builtin.StackTrace, ret_addr: ?usize) noreturn {
        _ = msg;
        _ = stack_trace;
        _ = ret_addr;
    }
}.panic;

export fn unimicro_main() callconv(.C) noreturn {
    // ------------------------------------ Check if there is a main ------------------------------------ \\
    // Check if user defined a main
    if (!@hasDecl(app, "main"))
        @compileError("The root source file must provide a public main function!");

    const main_info = @typeInfo(@TypeOf(app.main));

    // ------------------------------------- Check if main is valid ------------------------------------- \\
    // If it is not a function
    if (main_info != .Fn)
        @compileError(std.fmt.comptimePrint("You have declared a 'main' symbol, but it isn't a function! It is declared as a {s}", .{main_info.Type}));

    // If it takes any arguments
    if (main_info.Fn.params.len > 0)
        @compileError(std.fmt.comptimePrint("You have declared a 'main' function that takes parameters! It should take none, but takes {s}", .{main_info.Fn.params}));

    // If it is async
    // TODO: Investigate if it's possible to support async...
    if (main_info.Fn.calling_convention == .Async)
        @compileError("You have declared an async 'main' function! This is not supported! Maybe in the future it might, feel free to open a discussion on the repo!");

    // -------------------------------------- Call startup routine -------------------------------------- \\
    // If user provided a custom startup function, call it.
    if (@hasDecl(app, "startup")) {
        // Check if user's startup is valid.
        const startup_info = @typeInfo(@TypeOf(app.main));

        // If it is not a function
        if (startup_info != .Fn)
            @compileError(std.fmt.comptimePrint("You have declared a 'main' symbol, but it isn't a function! It is declared as a {s}", .{startup_info.Type}));

        // If it takes any arguments
        if (startup_info.Fn.params.len > 0)
            @compileError(std.fmt.comptimePrint("You have declared a 'main' function that takes parameters! It should take none, but takes {s}", .{startup_info.Fn.params}));

        // If it returns anything
        const startup_return_type = startup_info.Fn.return_type orelse u8;
        if (startup_return_type != void)
            @compileError(std.fmt.comptimePrint("You have declared a 'main' function that returns something! It should be void, but it returns {s}", .{main_info.Fn.return_type}));

        app.startup();
    } else {
        cpu.startup();
    }

    // --------------------------------------- Call main function --------------------------------------- \\
    const return_type = @typeInfo(main_info.Fn.return_type orelse @compileError("Could not determine main function's return type. Please check it and try again!"));
    if (return_type == .ErrorUnion) {
        app.main() catch |err| {
            var msg: [64]u8 = undefined;
            @panic(std.fmt.bufPrint(&msg, "main() returned error {s}!", .{@errorName(err)}) catch @panic("main() returned an error!"));
        };
    } else {
        app.main();
    }

    // ---- If main returns and there's no error information available, hang for debugger inspection ---- \\
    // Yes, this is basically the same as a simple while(true). However, it must be this way,
    // since the while(true) statement might be optimized away by the compiler. This however,
    // is implemented as as assembly function that will definetely not be optimized away,
    // regardless of the optimization option picked.
    cpu.hang();
}
