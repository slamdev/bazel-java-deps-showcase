load("@bazel_skylib//rules:write_file.bzl", "write_file")

def _impl(ctx):
    executable = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(
        output = executable,
        content = ctx.var["JAVA"] + " -version",
    )
    runfiles = ctx.runfiles(
        files = ctx.toolchains["@bazel_tools//tools/jdk:runtime_toolchain_type"].java_runtime.files.to_list(),
    )
    return [
        DefaultInfo(
            executable = executable,
            runfiles = runfiles,
        ),
    ]

java_nativerule = rule(
    implementation = _impl,
    attrs = {},
    executable = True,
    toolchains = ["@bazel_tools//tools/jdk:runtime_toolchain_type"],
)

def java_genrule(name):
    write_file(
        name = name + ".gen",
        out = "run.sh",
        content = ["external/local_jdk/bin/java -version"],
    )
    native.sh_binary(
        name = name,
        srcs = [":"+name + ".gen"],
        data = ["@bazel_tools//tools/jdk:current_java_runtime"],
        toolchains = ["@bazel_tools//tools/jdk:current_java_runtime"],
    )
