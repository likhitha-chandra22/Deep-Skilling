using NUnit.Framework;
using FourSeasonsLib;
using System.Collections;

namespace FourSeasonsLib.Tests
{
    [TestFixture]
    public class SeasonTests
    {
        private FourSeasons seasonManager;

        [SetUp]
        public void Initialize()
        {
            seasonManager = new FourSeasons();
        }

        // Test Data
        public static IEnumerable GetSeasonData()
        {
            yield return new TestCaseData("January", "Winter");
            yield return new TestCaseData("February", "Spring");
            yield return new TestCaseData("March", "Spring");

            yield return new TestCaseData("April", "Summer");
            yield return new TestCaseData("May", "Summer");
            yield return new TestCaseData("June", "Summer");

            yield return new TestCaseData("July", "Monsoon");
            yield return new TestCaseData("August", "Monsoon");
            yield return new TestCaseData("September", "Monsoon");

            yield return new TestCaseData("October", "Autumn");
            yield return new TestCaseData("November", "Autumn");
            yield return new TestCaseData("December", "Winter");
        }

        [Test]
        [TestCaseSource(nameof(GetSeasonData))]
        public void CheckSeason_ReturnsExpectedResult(string monthName, string expectedSeason)
        {
            string result = seasonManager.GetSeason(monthName);

            Assert.AreEqual(expectedSeason, result);
        }
    }
}