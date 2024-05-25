const std = @import("std");
pub fn main() !void {
    //TODO: continue here
    const allocator = std.heap.page_allocator;
    var args = try std.process.argsWithAllocator(allocator);
    defer args.deinit();

    // skip executable in args
    _ = args.skip();
    if (args.next()) |temp| {
        generate(temp);
    }
}

fn generate(flang: []const u8) void {
    // std.debug.print("Typeof: {s}\n", .{flang});
    std.debug.print("Creating .gitignore for {s}\n", .{flang});
}
