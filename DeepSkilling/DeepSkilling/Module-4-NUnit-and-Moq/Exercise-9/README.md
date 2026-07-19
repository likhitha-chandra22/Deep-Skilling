# Exercise 9 – Moq Interaction Testing

## Objective

Perform interaction testing using the Moq framework by verifying that methods on mocked dependencies are called as expected.

## Concepts Covered

- Moq
- Mock Objects
- Interaction Testing
- Verify()
- Times.Once
- Dependency Injection
- TestFixture
- Assert.That()

## Method Tested

- USDToEuro()

## Mocked Dependency

- IDollarToEuroExchangeRateFeed

## Test Scenarios

- Verify correct currency conversion.
- Verify the exchange rate service is called exactly once.

## Expected Result

Successfully verified both the currency conversion result and the interaction with the mocked exchange rate service using Moq.