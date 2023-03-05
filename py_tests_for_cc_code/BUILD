cc_library(
    name = "foo",
    srcs = [
        "src/foo.cpp",
        "src/foo.h",
    ],
)

#cc_test(
#    name = "foo_cc_test",
#    srcs = [
#        "test/foo_test.cpp",
#    ],
#    deps = [
#        "@googletest//:gtest",
#        "@googletest//:gtest_main",
#    ],
#)

py_test(
    name = "foo_py_test",
    srcs = [
        "test/foo_py_test.py",
    ],
    #    data = [":foo_binding"],
    deps = [
        #        ":intermediate_step",
        #        ":test_module",
        "foo_binding",
    ],
)

py_library(
    name = "test_module",
    srcs = ["test/test_module.py"],
    data = [":foo_binding"],
)

py_library(
    name = "foo_binding",
    srcs = ["test/__init__.py"],
    data = [":foo_binding_bin"],
)

cc_binary(
    name = "foo_binding_bin",
    srcs = [
        "test/foo_binding.cpp",
    ],
    linkshared = True,
    linkstatic = True,
    deps = [
        ":foo",
        "//3rd_party/pybind11:pybind11_py3",
    ],
)
