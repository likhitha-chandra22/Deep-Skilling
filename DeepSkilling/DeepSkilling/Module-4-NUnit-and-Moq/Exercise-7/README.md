# Exercise 7 – Leap Year Calculator

## Introduction

This exercise demonstrates parameterized testing in NUnit using the `TestCase` attribute. Multiple input values are provided to a single test method to verify the leap year calculation logic for valid leap years, non-leap years, and invalid year values.

## Concepts Covered

- Parameterized Tests
- TestCase
- TestFixture
- SetUp
- Assert.AreEqual()

## Method Tested

- CheckLeapYear()

## Test Scenarios

- Verify valid leap years.
- Verify non-leap years.
- Validate invalid year inputs.
- Check the returned result for different year values.

## Learning Outcomes

- Learned how to create parameterized tests using the `TestCase` attribute.
- Tested multiple scenarios with a single test method.
- Verified leap year calculation for different categories of input.
- Improved test coverage while reducing duplicate code.

## Conclusion

This exercise highlights the advantages of parameterized testing in NUnit. Using `TestCase` allows multiple input combinations to be tested efficiently, resulting in cleaner, reusable, and more maintainable test cases.