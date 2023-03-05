def _generate_msg(ctx):
    ctx.actions.expand_template(
        template = ctx.file._template_msg_h,
        output = ctx.outputs.msg_out_h,
        substitutions = {
            "{_INCLUDE_}": ctx.attr.msg_include,
            "{_MSG_CLASS_NAME_}": ctx.attr.msg_class,
            "{_MSG_PAYLOAD_}": ctx.attr.msg_payload,
        },
    )

generate_msg = rule(
    implementation = _generate_msg,
    attrs = {
        "msg_out_h": attr.output(mandatory = True),
        "msg_class": attr.string(mandatory = True),
        "msg_payload": attr.string(mandatory = True),
        "msg_include": attr.string(mandatory = True),
        "_template_msg_h": attr.label(
            doc = "Template file for message class header.",
            allow_single_file = True,
            default = "//:msg.tpl.h",
        ),
    },
)

def _generate_msg_name_test(ctx):
    ctx.actions.expand_template(
        template = ctx.file._template_test_msg_name_cpp,
        output = ctx.outputs.test_out_cpp,
        substitutions = {
            "{_INCLUDE_}": ctx.attr.msg_include,
            "{_MSG_CLASS_NAME_}": ctx.attr.msg_class,
        },
    )

generate_msg_name_test_ = rule(
    implementation = _generate_msg_name_test,
    attrs = {
        "test_out_cpp": attr.output(mandatory = True),
        "msg_class": attr.string(mandatory = True),
        "msg_include": attr.string(mandatory = True),
        "_template_test_msg_name_cpp": attr.label(
            doc = "Template file for message class header.",
            allow_single_file = True,
            default = "//:test_msg_name.tpl.cpp",
        ),
    },
)

def generate_msgs(msg_list):
    for msg_class_name, attrs in msg_list.items():
        msg_out_h = "{}_msg.h".format(msg_class_name)
        generate_msg(
            name = "generate_msg_{}".format(msg_class_name),
            msg_out_h = msg_out_h,
            msg_class = msg_class_name,
            msg_payload = attrs.payload,
            msg_include = attrs.include,
        )

        cc_library_name = "{}_msg".format(msg_class_name)
        native.cc_library(
            name = cc_library_name,
            hdrs = [msg_out_h],
            deps = [
                "//:i_msg",
                attrs.target,
            ],
            visibility = ["//visibility:public"],
        )

        test_out_cpp = "test_{}_msg_name.cpp".format(msg_class_name)
        generate_msg_name_test_(
            name = "generate_msg_name_test_for_{}".format(msg_class_name),
            test_out_cpp = test_out_cpp,
            msg_class = msg_class_name,
            msg_include = msg_out_h,
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
