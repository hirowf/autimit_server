pub const packages = struct {
    pub const @"zap-0.8.0-AAAAAHquIwC7Et6QVdWF7gsZyMnaQa1JpmD12ovhNyx7" = struct {
        pub const build_root = "/home/hirowf/.cache/zig/p/zap-0.8.0-AAAAAHquIwC7Et6QVdWF7gsZyMnaQa1JpmD12ovhNyx7";
        pub const build_zig = @import("zap-0.8.0-AAAAAHquIwC7Et6QVdWF7gsZyMnaQa1JpmD12ovhNyx7");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"zpg-0.1.0-zdtMHRlGAACLmfpmq9sbQTk8BGHhcbUnztIYGKtlbB4A" = struct {
        pub const build_root = "/home/hirowf/.cache/zig/p/zpg-0.1.0-zdtMHRlGAACLmfpmq9sbQTk8BGHhcbUnztIYGKtlbB4A";
        pub const build_zig = @import("zpg-0.1.0-zdtMHRlGAACLmfpmq9sbQTk8BGHhcbUnztIYGKtlbB4A");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "zap", "zap-0.8.0-AAAAAHquIwC7Et6QVdWF7gsZyMnaQa1JpmD12ovhNyx7" },
    .{ "zpg", "zpg-0.1.0-zdtMHRlGAACLmfpmq9sbQTk8BGHhcbUnztIYGKtlbB4A" },
};
