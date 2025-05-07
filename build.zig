const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // main .exe
    const exe = b.addExecutable(.{
        .name = "rapt_saas",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // zap dependency
    const zap_dep = b.dependency("zap", .{
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("zap", zap_dep.module("zap"));

    // zpg dependency
    const zpg_dep = b.dependency("zpg", .{
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("zpg", zpg_dep.module("zpg"));

    b.installArtifact(exe);
}
