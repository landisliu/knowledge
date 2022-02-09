
import unittest
import test

class MyTest(unittest.TestCase):
    def test_format_name(self):
        formated = test.get_format_name('landis','liu')
        self.assertEqual(formated, "landis liu")

if __name__ == '__main__':
    unittest.main()