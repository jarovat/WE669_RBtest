from covert import bmi_cal, dollar2bath, celsiustofahrenheit
import unittest

class Test_convert(unittest.TestCase):
    def testBMI(self):
        self.assertEqual(bmi_cal(55,160),21.48)
    
    def test_Dollar(self):
        self.assertEqual(dollar2bath(5),173.80)
    
    def test_celsius(self):
        self.assertEqual(celsiustofahrenheit(24),75.20)
