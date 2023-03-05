import unittest
# import test_module
# from test_module import

# import intermediate_step

import libfoo_binding_bin


class FooTest(unittest.TestCase):
    def setUp(self) -> None:
        pass

    def test_sum(self):
        # self.assertEqual(5, test_module.bar(2, 3))
        self.assertEqual(True, True)
        print("SISKI")
        # print(dir(test_module))
        # self.assertEqual(3, libfoo_binding_bin.sum(1, 2))


if __name__ == "__main__":
    unittest.main()
