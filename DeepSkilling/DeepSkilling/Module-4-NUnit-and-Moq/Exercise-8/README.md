# Exercise 8 – Exception Testing

## Introduction

This exercise demonstrates exception testing in NUnit by verifying both successful execution and error handling. The test cases ensure that the `CreateUser()` method accepts valid PAN numbers and throws the appropriate exceptions for invalid inputs.

## Concepts Covered

- Exception Testing
- Assert.Throws
- TestFixture
- SetUp
- Assert.IsTrue()

## Method Tested

- CreateUser()

## Test Scenarios

- Verify user creation with a valid PAN.
- Verify that a null PAN throws a `NullReferenceException`.
- Verify that an empty PAN throws a `NullReferenceException`.
- Verify that an invalid PAN length throws a `FormatException`.

## Learning Outcomes

- Learned how to test exceptions using `Assert.Throws()`.
- Verified successful execution for valid input.
- Validated error handling for invalid inputs.
- Improved application reliability by testing boundary and error conditions.

## Conclusion

This exercise highlights the importance of exception testing in unit testing. By validating both successful operations and exceptional scenarios, the application becomes more robust, reliable, and capable of handling invalid user input effectively.