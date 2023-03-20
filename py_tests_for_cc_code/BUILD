cc_library(
    name = "foo",
    srcs = [
        "src/foo.cpp",
    ],
    hdrs = [
        "src/foo.h",
    ]
)

cc_test(
   name = "foo_cc_test",
   srcs = [
       "test/foo_cc_test.cpp",
   ],
   deps = [
        "foo",
       "@googletest//:gtest",
       "@googletest//:gtest_main",
   ],
)

py_test(
    name = "foo_py_test",
    srcs = [
        "test/foo_py_test.py",
    ],
    data = [":foo_binding"],
)

cc_binary(
    name = "foo_binding",
    srcs = [
        "test/foo_binding.cpp",
    ],
    linkshared = True,
    linkstatic = False,
    deps = [
        ":foo",
        "//3rd_party/pybind11:pybind11_py3",
    ],
)
