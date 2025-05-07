const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const zap_dep = b.dependency("zap", .{ .target = target, .optimize = optimize });
    const pg_dep = b.dependency("pg", .{ .target = target, .optimize = optimize });

    // main executable
    const exe = b.addExecutable(.{ .name = "autmit_server", .root_source_file = b.path("src/main.zig"), .target = target, .optimize = optimize });

    exe.linkDependency(zap_dep);
    exe.linkDependency(pg_dep);
}
