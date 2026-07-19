# Exercise 5 – Collection Assertions

## Introduction

This exercise focuses on testing collections using NUnit. Collection assertions help verify the contents of arrays, lists, and other collections by checking conditions such as uniqueness, existence of elements, null values, and collection equality.

## Concepts Covered

- CollectionAssert
- Assert.That()
- LINQ
- Distinct()
- Any()
- AreEquivalent()

## Methods Tested

- GetEmployees()
- GetEmployeesWhoJoinedInPreviousYears()

## Test Scenarios

- Verify that the employee collection does not contain null values.
- Check whether an employee with ID 100 exists.
- Ensure all employee IDs are unique.
- Compare two employee collections for equivalent data.

## Learning Outcomes

- Learned how to validate collections using NUnit.
- Used LINQ methods such as `Any()` and `Distinct()` for collection testing.
- Compared collections using `CollectionAssert.AreEquivalent()`.
- Verified collection integrity through different test scenarios.

## Conclusion

This exercise demonstrates how NUnit collection assertions can be used to test lists and collections effectively. Proper collection testing helps ensure data accuracy, consistency, and reliability within an application.