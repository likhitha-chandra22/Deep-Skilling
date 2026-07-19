using NUnit.Framework;
using CalcLibrary;
using System;

namespace CalcLibrary.Tests
{
    [TestFixture]
    public class CalculatorAdvancedTests
    {
        private SimpleCalculator calculator;

        [SetUp]
        public void SetUp()
        {
            calculator = new SimpleCalculator();
        }

        [TearDown]
        public void TearDown()
        {
            calculator.AllClear();
        }

        // -----------------------------
        // Test Subtraction
        // -----------------------------

        [TestCase(50, 20, 30)]
        [TestCase(80, 100, -20)]
        [TestCase(-25, -15, -10)]
        [TestCase(12.5, 2.5, 10)]
        public void TestSubtraction(double num1, double num2, double expected)
        {
            double actual = calculator.Subtraction(num1, num2);

            Assert.AreEqual(expected, actual);
        }

        // -----------------------------
        // Test Multiplication
        // -----------------------------

        [TestCase(12, 4, 48)]
        [TestCase(-6, 3, -18)]
        [TestCase(1.5, 8, 12)]
        [TestCase(25, 0, 0)]
        public void TestMultiplication(double num1, double num2, double expected)
        {
            double actual = calculator.Multiplication(num1, num2);

            Assert.AreEqual(expected, actual);
        }

        // -----------------------------
        // Test Division
        // -----------------------------

        [TestCase(81, 9, 9)]
        [TestCase(144, 12, 12)]
        [TestCase(64, 8, 8)]
        public void TestDivision(double num1, double num2, double expected)
        {
            double actual = calculator.Division(num1, num2);

            Assert.AreEqual(expected, actual);
        }

        // -----------------------------
        // Division By Zero
        // -----------------------------

        [Test]
        public void TestDivisionByZero()
        {
            try
            {
                calculator.Division(25, 0);

                Assert.Fail("Division by zero should throw an exception.");
            }
            catch (ArgumentException ex)
            {
                Assert.AreEqual("Second Parameter Can't Be Zero", ex.Message);
            }
        }

        // -----------------------------
        // Test Void Method
        // -----------------------------

        [Test]
        public void TestAddAndClear()
        {
            calculator.Addition(40, 60);

            Assert.AreEqual(100, calculator.GetResult);

            calculator.AllClear();

            Assert.AreEqual(0, calculator.GetResult);
        }
    }
}