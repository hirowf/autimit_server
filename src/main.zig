const std = @import("std");

const zpg = @import("zpg");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = &gpa.allocator;
    defer gpa.deinit();

    const cfg = zpg.Config{
        .host = "127.0.0.1",
        .port = 5432,
        .username = "user",
        .database = "autimit_db",
        .password = "pass",
        .tls_mode = .disable,
        .timeout = 10_000,
    };
    try cfg.validate();

    var pool = try zpg.ConnectionPool.init(allocator, cfg, 5);
    defer pool.deinit();

    var pconn = try zpg.PooledConnection.init(&pool, null);
    defer pconn.deinit();

    var query = pconn.createQuery(allocator);
    defer query.deinit();

    const sql = "SELECT now()";
    const result = try query.run(sql, struct { now: []const u8 });
    defer allocator.free(result);

    if (result.len > 0) {
        std.debug.print("DB time: {s}\n", .{result[0].now});
    }
}
