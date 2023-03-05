package(default_visibility = ["//visibility:public"])

cc_library(
    name = "pybind11_py3",
    hdrs = glob(["include/pybind11/**"]),
    includes = ["include/"],
    visibility = ["//visibility:public"],
    deps = ["//3rd_party/python3"],
    #    select(
    #        {
    #            "@//:python_38": ["@python3_host_linux//:python3"],
    #            "//conditions:default": ["@python3_linux//:python3_dev"],
    #        },
    #    ),
)
