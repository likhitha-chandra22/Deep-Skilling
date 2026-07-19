using NUnit.Framework;
using CalcLibrary;

namespace CalcLibrary.Tests
{
    [TestFixture]
    public class CalculatorTests
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

        [TestCase(15, 10, 25)]
        [TestCase(100, 200, 300)]
        [TestCase(-10, -20, -30)]
        [TestCase(7.5, 2.5, 10)]
        public void Addition_ReturnsExpectedResult(double num1, double num2, double expected)
        {
            double actual = calculator.Addition(num1, num2);

            Assert.That(actual, Is.EqualTo(expected));
        }
    }
}