load("//messages:private/generate_file.bzl", "generate_file")

def generate_msgs(msg_list):
    for msg_class_name, attrs in msg_list.items():
        # generate msg.h
        msg_h = "{}_msg.h".format(msg_class_name)
        generate_file(
            name = "generate_file_msg_h_{}".format(msg_class_name),
            output_file_name = msg_h,
            template = "//messages:private/msg.h.tpl",
            pattern_dict = {
                "{_INCLUDE_}": attrs.include,
                "{_MSG_CLASS_NAME_}": msg_class_name,
                "{_DATA_TYPE_}": attrs.data_type,
            }
        )

        cc_library_msg = "{}_msg".format(msg_class_name)
        native.cc_library(
            name = cc_library_msg,
            hdrs = [msg_h],
            deps = [
                "//messages:i_msg",
                attrs.target,
            ],
            visibility = ["//visibility:public"],
        )

        # generate msg_name_test
        test_msg_name_cpp = "test_{}_msg_name.cpp".format(msg_class_name)
        generate_file(
            name = "generate_file_test_for_{}_msg_name".format(msg_class_name),
            output_file_name = test_msg_name_cpp,
            template = "//messages:private/test_msg_name.cpp.tpl",
            pattern_dict = {
                "{_INCLUDE_}": msg_h,
                "{_MSG_CLASS_NAME_}": msg_class_name,
            }
        )
        native.cc_test(
            name = "{}_msg_name_test".format(msg_class_name),
            srcs = [test_msg_name_cpp],
            deps = [
                cc_library_msg,
                "@googletest//:gtest_main",
            ],
            copts = ["--std=c++1y"],
            visibility = ["//visibility:public"],
        )

        test_data_type_default_constructible_cpp = "test_{}_is_default_constructible.cpp".format(msg_class_name)
        generate_file(
            name = "generate_file_test_is_default_constructible_test_for_{}".format(msg_class_name),
            output_file_name = test_data_type_default_constructible_cpp,
            template = "//messages:private/test_data_type_is_default_constructible.cpp.tpl",
            pattern_dict = {
                "{_INCLUDE_}": attrs.include,
                "{_DATA_TYPE_}": attrs.data_type,
                "{_MSG_CLASS_NAME_}": msg_class_name,
            }
        )
        native.cc_test(
            name = "{}_is_default_constructible_test".format(msg_class_name),
            srcs = [test_data_type_default_constructible_cpp],
            deps = [
                cc_library_msg,
                "@googletest//:gtest_main",
            ],
            visibility = ["//visibility:public"],
        )
