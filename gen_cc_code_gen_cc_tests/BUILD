load("//:generate_msgs.bzl", "generate_msgs")
load("//:msg_list.bzl", "message_list")

exports_files([
    "msg.tpl.h",
    "test_msg_name.tpl.cpp",
])

cc_library(
    name = "i_msg",
    hdrs = ["i_msg.h"],
    visibility = ["//visibility:public"],
)

generate_msgs(msg_list=message_list)
