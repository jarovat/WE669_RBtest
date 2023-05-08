from calGrade import calGradefunc
import unittest

class Test_calGrade(unittest.TestCase):
    def testCalFunction(self):
        self.assertEqual(calGradefunc(80), "A")

    def testCalFunction(self):
        self.assertEqual(calGradefunc(70), "B")

    def testCalFunction(self):
        self.assertEqual(calGradefunc(60), "C")

    def testCalFunction(self):
        self.assertEqual(calGradefunc(50), "D")
    
    def testCalFunction(self):
        self.assertEqual(calGradefunc(40), "F")
