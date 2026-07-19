using NUnit.Framework;
using LeapYearCalculatorLib;

namespace LeapYearCalculatorLib.Tests
{
    [TestFixture]
    public class LeapYearTests
    {
        private LeapYearCalculator leapYearCalculator;

        [SetUp]
        public void Initialize()
        {
            leapYearCalculator = new LeapYearCalculator();
        }

        // Leap Years
        [TestCase(2004, 1)]
        [TestCase(2008, 1)]
        [TestCase(2020, 1)]

        // Non-Leap Years
        [TestCase(2021, 0)]
        [TestCase(2022, 0)]
        [TestCase(2100, 0)]

        // Invalid Years
        [TestCase(1750, -1)]
        [TestCase(12000, -1)]

        public void VerifyLeapYear(int inputYear, int expectedResult)
        {
            int result = leapYearCalculator.CheckLeapYear(inputYear);

            Assert.AreEqual(expectedResult, result);
        }
    }
}