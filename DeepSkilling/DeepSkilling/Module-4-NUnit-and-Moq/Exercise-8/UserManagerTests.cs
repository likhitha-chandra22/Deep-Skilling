using NUnit.Framework;
using System;
using UserManagerLib;

namespace UserManagerLib.Tests
{
    [TestFixture]
    public class CreateUserTests
    {
        private UserManager userManager;

        [SetUp]
        public void Initialize()
        {
            userManager = new UserManager();
        }

        // Valid PAN
        [Test]
        public void CreateUser_WithValidPAN_ReturnsTrue()
        {
            bool isCreated = userManager.CreateUser("PQRSX5678Z");

            Assert.IsTrue(isCreated);
        }

        // Null PAN
        [Test]
        public void CreateUser_WithNullPAN_ThrowsException()
        {
            var exception = Assert.Throws<NullReferenceException>(
                () => userManager.CreateUser(null));

            Assert.IsNotNull(exception);
        }

        // Empty PAN
        [Test]
        public void CreateUser_WithEmptyPAN_ThrowsException()
        {
            var exception = Assert.Throws<NullReferenceException>(
                () => userManager.CreateUser(string.Empty));

            Assert.IsNotNull(exception);
        }

        // Invalid PAN Length
        [Test]
        public void CreateUser_WithShortPAN_ThrowsFormatException()
        {
            var exception = Assert.Throws<FormatException>(
                () => userManager.CreateUser("AB123"));

            Assert.IsNotNull(exception);
        }
    }
}