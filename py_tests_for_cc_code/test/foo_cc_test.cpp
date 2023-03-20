#include "src/foo.h"
#include <gtest/gtest.h>

namespace
{
TEST(foo, positive_number_plus_positive_number_without_overlapping)
{
    EXPECT_EQ(5, foo(2, 3));
}
}