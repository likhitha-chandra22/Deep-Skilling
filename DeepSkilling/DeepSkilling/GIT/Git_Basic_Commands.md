Git Basic Commands

Introduction

Git provides a set of commands that help developers create repositories, track file changes, manage project history, and collaborate efficiently. Learning these basic commands is essential for working with Git and GitHub.

Setting Up Git

Before using Git, it should be installed and configured with your user information.

Check Git Version

Command

git --version

Purpose

Displays the installed version of Git on your system.

Configure Username

Command

git config --global user.name "Your Name"

Purpose

Sets the username that will be associated with all your Git commits.

Configure Email

Command

git config --global user.email "youremail@example.com"

Purpose

Configures the email address that will appear in your commit history.

View Git Configuration

Command

git config --list

Purpose

Displays all the current Git configuration settings.

Creating a Repository

Initialize a New Repository

Command

git init

Purpose

Creates a new Git repository in the current directory so that Git can start tracking the project.

Clone an Existing Repository

Command

git clone https://github.com/username/project.git

Purpose

Creates a local copy of an existing repository from GitHub or another remote server.

Basic Git Commands

Check Repository Status

Command

git status

Purpose

Shows the current state of the repository, including modified, staged, and untracked files.

Stage All Files

Command

git add .

Purpose

Adds all new and modified files to the staging area.

Stage a Specific File

Command

git add Program.cs

Purpose

Stages only the specified file for the next commit.

Commit Changes

Command

git commit -m "Initial Commit"

Purpose

Saves the staged changes permanently in the local repository with a descriptive commit message.

View Commit History

Command

git log

Purpose

Displays the complete history of commits, including commit IDs, author information, dates, and messages.

View Commit History in One Line

Command

git log --oneline

Purpose

Shows a concise version of the commit history, with one commit displayed per line.

Compare File Changes

Command

git diff

Purpose

Displays the differences between the current working directory and the staging area.

View Staged Changes

Command

git diff --staged

Purpose

Shows the changes that have been staged but not yet committed.

Remove a File from Staging

Command

git restore --staged Program.cs

Purpose

Removes the specified file from the staging area without deleting its changes.

Discard Local Changes

Command

git restore Program.cs

Purpose

Reverts the file to its last committed version, discarding any uncommitted changes.

Rename a File

Command

git mv OldFile.cs NewFile.cs

Purpose

Renames a file while allowing Git to track the change.

Delete a File

Command

git rm Program.cs

Purpose

Removes the file from both the working directory and the Git repository.

Conclusion

Git's basic commands provide the foundation for version control. By understanding how to configure Git, create repositories, stage files, commit changes, view project history, and compare modifications, developers can efficiently manage source code and collaborate with others using Git and GitHub.