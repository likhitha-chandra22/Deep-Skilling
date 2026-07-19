# Moq Exercise 2 – Mock File System

## Objective

Use the Moq framework to mock file system access while testing file retrieval functionality.

## Concepts Covered

- Moq
- Mock Objects
- Dependency Injection
- Setup()
- Verify()
- Times.Once
- TestFixture
- Assert.That()

## Method Tested

- GetFiles()

## Mocked Dependency

- IDirectoryExplorer

## Test Scenarios

- Verify GetFiles() returns the expected files.
- Verify GetFiles() is called exactly once.

## Expected Result

Successfully mocked the file system and verified file retrieval without accessing the actual file system.