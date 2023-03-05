import unittest
from libfoo_binding import foo


class FooTest(unittest.TestCase):
    def test_sum(self):
        self.assertEqual(3, foo(1, 2))


if __name__ == "__main__":
    unittest.main()
