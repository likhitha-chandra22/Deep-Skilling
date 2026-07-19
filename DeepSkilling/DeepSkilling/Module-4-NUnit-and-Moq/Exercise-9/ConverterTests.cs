using NUnit.Framework;
using Moq;
using ConverterLib;

namespace ConverterLib.Tests
{
    [TestFixture]
    public class CurrencyConverterTests
    {
        private Mock<IDollarToEuroExchangeRateFeed> mockExchangeRate;
        private Converter currencyConverter;

        [SetUp]
        public void Initialize()
        {
            mockExchangeRate = new Mock<IDollarToEuroExchangeRateFeed>();

            mockExchangeRate
                .Setup(rate => rate.GetDollarToEuroExchangeRate())
                .Returns(0.90);

            currencyConverter = new Converter(mockExchangeRate.Object);
        }

        [TestCase(100, 90)]
        [TestCase(150, 135)]
        [TestCase(80, 72)]
        public void ConvertDollarToEuro_ReturnsExpectedValue(double dollarAmount, double expectedEuro)
        {
            double result = currencyConverter.USDToEuro(dollarAmount);

            Assert.AreEqual(expectedEuro, result);
        }

        [Test]
        public void ConvertDollarToEuro_VerifyExchangeRateCalledOnce()
        {
            currencyConverter.USDToEuro(250);

            mockExchangeRate.Verify(
                rate => rate.GetDollarToEuroExchangeRate(),
                Times.Once);
        }
    }
}