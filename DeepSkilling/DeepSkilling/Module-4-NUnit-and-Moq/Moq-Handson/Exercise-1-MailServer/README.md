# Moq Exercise 1 – Mock Mail Server

## Objective

Use the Moq framework to mock an external mail server while testing email functionality.

## Concepts Covered

- Moq
- Mock Objects
- Dependency Injection
- Constructor Injection
- Setup()
- Verify()
- Times.Once
- TestFixture
- Assert.That()

## Method Tested

- SendMailToCustomer()

## Mocked Dependency

- IMailSender

## Test Scenarios

- Verify SendMailToCustomer() returns true.
- Verify SendMail() is invoked exactly once.

## Expected Result

Successfully mocked the mail server and verified the SendMail() method invocation without sending a real email.