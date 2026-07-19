using NUnit.Framework;
using Moq;
using CustomerCommLib;

namespace CustomerCommLib.Tests
{
    [TestFixture]
    public class CustomerCommTests
    {
        private Mock<IMailSender> mailSenderMock;
        private CustomerComm customerComm;

        [SetUp]
        public void SetUp()
        {
            mailSenderMock = new Mock<IMailSender>();

            mailSenderMock
                .Setup(x => x.SendMail(It.IsAny<string>(), It.IsAny<string>()))
                .Returns(true);

            customerComm = new CustomerComm(mailSenderMock.Object);
        }

        [Test]
        public void SendMailToCustomer_ReturnsTrue()
        {
            bool result = customerComm.SendMailToCustomer();

            Assert.That(result, Is.True);
        }

        [Test]
        public void SendMailToCustomer_CallsSendMailOnce()
        {
            customerComm.SendMailToCustomer();

            mailSenderMock.Verify(
                x => x.SendMail(It.IsAny<string>(), It.IsAny<string>()),
                Times.Once);
        }
    }
}