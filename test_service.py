from test import sum, multiply, minus , divide
import unittest
class Test_Calculator(unittest.TestCase):
    def testSumFunction(self):
        self.assertEqual(sum(1,2),3)

    def testMultiplyFunction(self):
        self.assertEqual(multiply(1,2),2)

    def testMinusFunction(self):
        self.assertEqual(minus(3,2),1)

    def testdivideFunction(self):
        self.assertEqual(divide(2,2),1)