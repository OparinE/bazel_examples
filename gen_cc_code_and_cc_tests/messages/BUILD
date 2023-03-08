load("//messages:generate_msgs.bzl", "generate_msgs")
load("//messages:msg_list.bzl", "message_list")

exports_files([
    "private/msg.h.tpl",
    "private/test_msg_name.cpp.tpl",
    "private/test_data_type_is_default_constructible.cpp.tpl",
])

cc_library(
    name = "i_msg",
    hdrs = ["i_msg.h"],
    visibility = ["//visibility:public"],
)

generate_msgs(msg_list=message_list)
