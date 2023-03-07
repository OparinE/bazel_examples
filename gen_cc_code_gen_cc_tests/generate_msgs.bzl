def _generate_file(ctx):
    ctx.actions.expand_template(
        output = ctx.outputs.output_file_name,
        template = ctx.file.template,        
        substitutions = ctx.attr.pattern_dict,
    )
    return DefaultInfo(files = depset([ctx.outputs.output_file_name]))

generate_file = rule(
    implementation = _generate_file,
    attrs = {
        "output_file_name": attr.output(mandatory = True),
        "pattern_dict": attr.string_dict(mandatory = True),
        "template": attr.label(
            doc = "Template file",
            allow_single_file = True,
            default = "//:test_msg_name.tpl.cpp",
        ),
    },
)

def generate_msgs(msg_list):
    for msg_class_name, attrs in msg_list.items():
        # generate msg.h
        msg_out_h = "{}_msg.h".format(msg_class_name)
        gen_h_name = "generate_msg_h_{}".format(msg_class_name)
        generate_file(
            name = gen_h_name,
            output_file_name = msg_out_h,
            template = "//:msg.tpl.h",
            pattern_dict = {
                "{_INCLUDE_}": attrs.include,
                "{_MSG_CLASS_NAME_}": msg_class_name,
                "{_MSG_PAYLOAD_}": attrs.payload,
            }
        )

        cc_library_name = "{}_msg".format(msg_class_name)
        native.cc_library(
            name = cc_library_name,
            hdrs = [gen_h_name],
            deps = [
                "//:i_msg",
                attrs.target,
            ],
            visibility = ["//visibility:public"],
        )

        # generate msg_name_test
        test_out_cpp = "test_{}_msg_name.cpp".format(msg_class_name)
        generate_file(
            name = "generate_msg_name_test_for_{}".format(msg_class_name),
            output_file_name = test_out_cpp,
            template = "//:test_msg_name.tpl.cpp",
            pattern_dict = {
                "{_INCLUDE_}": msg_out_h,
                "{_MSG_CLASS_NAME_}": msg_class_name,
            }
        )
        native.cc_test(
            name = "{}_msg_name_test".format(msg_class_name),
            srcs = [test_out_cpp],
            deps = [
                cc_library_name,
                "@googletest//:gtest_main",
            ],
            copts = ["--std=c++1y"],
            visibility = ["//visibility:public"],
        )

        test_default_constructible_cpp = "test_{}_is_default_constructible.cpp".format(msg_class_name)
        generate_file(
            name = "generate_is_default_constructible_test_for_{}".format(msg_class_name),
            output_file_name = test_default_constructible_cpp,
            template = "//:test_data_type_is_default_constructible.tpl.cpp",
            pattern_dict = {
                "{_INCLUDE_}": attrs.include,
                "{_DATA_TYPE_}": attrs.payload,
                "{_MSG_CLASS_NAME_}": msg_class_name,
            }
        )
        native.cc_test(
            name = "{}_is_default_constructible_test".format(msg_class_name),
            srcs = [test_default_constructible_cpp],
            deps = [
                cc_library_name,
                "@googletest//:gtest_main",
            ],
            visibility = ["//visibility:public"],
        )
