package(default_visibility = ["//visibility:public"])

cc_library(
    name = "python3",
    srcs = [
        "lib/libpython3.8.so",
        "lib/libpython3.8.so.1",
        "lib/libpython3.8.so.1.0",
    ],
    hdrs = glob(["include/python3.8/**/*.h"]),  # + ["include/x86_64-linux-gnu/python3.8/pyconfig.h"],
    includes = [
        "include",
        "include/python3.8",
    ],
    #    target_compatible_with = ["@platforms//os:linux"],
    visibility = ["//visibility:public"],
)
