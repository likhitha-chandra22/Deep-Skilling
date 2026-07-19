using NUnit.Framework;
using System;
using AccountsManagerLib;

namespace AccountsManagerLib.Tests
{
    [TestFixture]
    public class UserValidationTests
    {
        private AccountsManager accountManager;

        [SetUp]
        public void Initialize()
        {
            accountManager = new AccountsManager();
        }

        [Test]
        public void CheckValidUser1_ReturnsWelcomeMessage()
        {
            string response = accountManager.ValidateUser("user_11", "secret@user11");

            Assert.AreEqual("Welcome user_11!!!", response);
        }

        [Test]
        public void CheckValidUser2_ReturnsWelcomeMessage()
        {
            string response = accountManager.ValidateUser("user_22", "secret@user22");

            Assert.AreEqual("Welcome user_22!!!", response);
        }

        [Test]
        public void CheckInvalidCredentials_ReturnsErrorMessage()
        {
            string response = accountManager.ValidateUser("guest", "guest123");

            Assert.AreEqual("Invalid user id/password", response);
        }

        [Test]
        public void CheckEmptyUserId_ThrowsException()
        {
            var exception = Assert.Throws<FormatException>(
                () => accountManager.ValidateUser("", "secret@user11"));

            Assert.AreEqual("Both user id and password are mandatory", exception.Message);
        }

        [Test]
        public void CheckEmptyPassword_ThrowsException()
        {
            var exception = Assert.Throws<FormatException>(
                () => accountManager.ValidateUser("user_22", ""));

            Assert.AreEqual("Both user id and password are mandatory", exception.Message);
        }
    }
}