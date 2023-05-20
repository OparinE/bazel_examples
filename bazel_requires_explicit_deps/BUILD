cc_library(
    name = "lib",
    srcs = ["src/lib.cpp"],
    # hdrs = ["src/lib.h"],
    includes = ["src"],
)

cc_binary(
    name = "main",
    srcs = ["src/main.cpp"],
    deps = [":lib"],
)
