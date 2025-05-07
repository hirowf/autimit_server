const std = @import("std");

pub const Config = struct {
    dbUrl: []const u8,
    port: u16,

    pub fn load() !Config {
        const dbUrl = try std.os.getenv("DB_URL");
        const portStr = try std.os.getenv("PORT");
        const port = try std.fmt.parseInt(u16, portStr, 10) catch return error.InvalidPort;
        return Config{
            .dbUrl = dbUrl,
            .port = port,
        };
    }
};
