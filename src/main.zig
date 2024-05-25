const std = @import("std");
pub fn main() !void {
    //TODO: continue here
    const allocator = std.heap.page_allocator;
    var args = try std.process.argsWithAllocator(allocator);
    defer args.deinit();

    const c = std.http.Client{ .allocator = allocator };
    const fetch_options = std.http.Client.FetchOptions{
        .location = std.http.Client.FetchOptions.Location{
            .url = "https://httpbin.org/anything",
        },
    };
    var res = try c.fetch(fetch_options);

    // skip executable in args
    _ = args.skip();

    if (args.next()) |template| {
        std.debug.print("{s}\n", .{template});
        generate(template);
    }
}

fn generate(flang: []const u8) void {
    // std.debug.print("Typeof: {s}\n", .{flang});
    std.debug.print("Creating .gitignore for {s}\n", .{flang});
}
