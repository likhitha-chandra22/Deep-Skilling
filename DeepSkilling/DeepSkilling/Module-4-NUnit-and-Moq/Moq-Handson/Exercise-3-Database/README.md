# Moq Exercise 3 – Mock Database

## Objective

Use the Moq framework to mock database access while testing player registration functionality.

## Concepts Covered

- Moq
- Mock Objects
- Dependency Injection
- Setup()
- Verify()
- Times.Once
- TestFixture
- Assert.Throws()

## Method Tested

- RegisterNewPlayer()

## Mocked Dependency

- IPlayerMapper

## Test Scenarios

- Verify a new player is registered successfully.
- Verify an exception is thrown when the player already exists.
- Verify an exception is thrown for an empty player name.
- Verify AddNewPlayerIntoDb() is called exactly once.

## Expected Result

Successfully mocked the database layer and verified player registration without connecting to the actual database.