java_import(
    name = "deps",
    jars = [],
    exports = [
        "@maven//:org_springframework_boot_spring_boot_starter_web",
        # dependencies below are transitive
        # build fails if you remove them
        "@maven//:org_springframework_boot_spring_boot",
        "@maven//:org_springframework_boot_spring_boot_autoconfigure",
    ],
)

java_library(
    name = "lib",
    srcs = ["Main.java"],
    deps = [":deps"],
)

java_binary(
    name = "jar",
    main_class = "showcase.Main",
    runtime_deps = [":lib"],
)
