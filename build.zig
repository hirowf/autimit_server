const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "autimit_server",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const zpg_dep = b.dependency("zpg", .{
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("zpg", zpg_dep.module("zpg"));

    b.installArtifact(exe);
}
