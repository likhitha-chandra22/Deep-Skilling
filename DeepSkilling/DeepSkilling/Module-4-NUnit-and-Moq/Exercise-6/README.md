# Exercise 6 – TestCaseSource

## Introduction

This exercise demonstrates the use of NUnit's `TestCaseSource` attribute to supply multiple sets of input data to a single test method. It helps reduce code duplication and improves the readability and maintainability of test cases.

## Concepts Covered

- TestCaseSource
- TestFixture
- SetUp
- Assert.AreEqual()
- TestCaseData

## Method Tested

- GetSeason()

## Test Scenarios

- Verify the season for Spring months.
- Verify the season for Summer months.
- Verify the season for Monsoon months.
- Verify the season for Autumn months.
- Verify the season for Winter months.

## Learning Outcomes

- Learned how to use `TestCaseSource` to provide test data.
- Executed multiple test cases using a single test method.
- Improved test code reusability and maintainability.
- Verified correct season mapping for different months.

## Conclusion

This exercise illustrates how `TestCaseSource` simplifies data-driven testing in NUnit. By supplying multiple inputs through a single data source, test cases become more organized, reusable, and easier to maintain.