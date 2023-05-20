#include "{_INCLUDE_}"
#include <gtest/gtest.h>
#include <type_traits>

namespace
{
TEST({_MSG_CLASS_NAME_}, IsDefaultConstructible)
{
    bool result{std::is_default_constructible<{_DATA_TYPE_}>::value};
    EXPECT_TRUE(result);
}
}

