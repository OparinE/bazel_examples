cc_library(
    name = "lowlevel",
    srcs = ["src/lowlevel.cpp"],
    hdrs = ["src/lowlevel.h"],
    includes = ["src"],
)

cc_library(
    name = "highlevel",
    hdrs = ["src/highlevel.h"],
    includes = ["src"],
    deps = [":lowlevel"],
)

cc_binary(
    name = "main",
    srcs = ["src/main.cpp"],
    deps = [":highlevel"],
)
