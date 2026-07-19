# Moq Hands-on

## Overview

This hands-on demonstrates how to use the Moq framework to isolate external dependencies during unit testing. Mock objects replace real implementations such as mail servers, file systems, and databases, allowing unit tests to run quickly, independently, and reliably.

---

## Objectives

- Understand Mocking in Unit Testing
- Understand Test Doubles
- Learn Dependency Injection
- Understand Constructor Injection
- Create Mock Objects using Moq
- Isolate External Dependencies
- Write Unit Tests using NUnit and Moq

---

## Exercises

### Exercise 1 – Mock Mail Server

**Library:** CustomerCommLib

#### Concepts Covered

- IMailSender
- Mock Objects
- Dependency Injection
- Constructor Injection
- Setup()
- Verify()

#### Outcome

Successfully mocked the mail server and verified email sending without connecting to a real SMTP server.

---

### Exercise 2 – Mock File System

**Library:** MagicFilesLib

#### Concepts Covered

- IDirectoryExplorer
- Mock Objects
- File System Mocking
- Setup()
- Verify()

#### Outcome

Successfully mocked file system access and verified file retrieval without accessing the actual file system.

---

### Exercise 3 – Mock Database

**Library:** PlayersManagerLib

#### Concepts Covered

- IPlayerMapper
- Mock Objects
- Dependency Injection
- Setup()
- Verify()
- Exception Testing

#### Outcome

Successfully mocked database operations and verified player registration without connecting to the actual database.

---

## Technologies Used

- C#
- NUnit
- Moq
- Dependency Injection

---

## Learning Outcome

After completing this hands-on, I gained practical experience in:

- Writing isolated unit tests
- Creating mock objects using Moq
- Testing applications with external dependencies
- Applying Dependency Injection
- Improving application testability