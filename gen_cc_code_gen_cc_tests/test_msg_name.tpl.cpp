#include "{_INCLUDE_}"
#include <gtest/gtest.h>
#include <memory>
#include <string>

namespace
{
TEST({_MSG_CLASS_NAME_}, Trivial)
{
    const auto message = std::make_unique<const msg::{_MSG_CLASS_NAME_}>();
    EXPECT_EQ("{_MSG_CLASS_NAME_}", message->MsgName());
}
}