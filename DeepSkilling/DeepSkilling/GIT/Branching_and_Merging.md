Branching and Merging

Introduction

Branching is one of Git's most useful features. A branch represents an independent line of development where developers can work on new features, fix bugs, or test ideas without affecting the main project. This allows multiple developers to work on different tasks simultaneously while keeping the main branch stable.

Benefits of Branching

- Enables multiple developers to work in parallel.
- Keeps the main branch safe from unfinished changes.
- Makes feature development more organized.
- Allows bug fixes without interrupting ongoing development.
- Simplifies collaboration in team projects.

View Existing Branches

Command

git branch

Purpose

Displays all branches in the current repository. The active branch is indicated with an asterisk (*).

Create a New Branch

Command

git branch feature-login

Purpose

Creates a new branch named feature-login without switching to it.

Switch to Another Branch

Command

git checkout feature-login

or

git switch feature-login

Purpose

Moves from the current branch to the specified branch.

Create and Switch to a New Branch

Command

git checkout -b feature-login

or

git switch -c feature-login

Purpose

Creates a new branch and immediately switches to it, allowing development to begin right away.

Merge Branches

Before merging changes, switch to the branch that will receive the updates.

Command

git checkout main

Merge the feature branch into the main branch.

Command

git merge feature-login

Purpose

Combines the changes from the feature-login branch into the main branch.

Delete a Branch

Command

git branch -d feature-login

Purpose

Removes the specified branch after its changes have been successfully merged.

Merge Conflicts

A merge conflict occurs when Git cannot automatically combine changes because two branches have modified the same section of a file. These conflicts must be resolved manually before the merge can be completed.

Steps to Resolve Merge Conflicts

- Open the file containing the conflict.
- Review the conflicting sections.
- Edit the file and keep the desired changes.
- Save the updated file.
- Stage the resolved file.

Command

git add .

Purpose

Marks the conflict as resolved by adding the updated file to the staging area.

Commit the Merge

Command

git commit -m "Resolved merge conflict"

Purpose

Creates a commit that records the resolved merge.

Branching Strategies

Feature Branch Workflow

Each new feature or bug fix is developed in its own branch. After development and testing are complete, the branch is merged into the main branch through a pull request.

Release Branch Workflow

A separate release branch is created when the application is ready for deployment. Only final testing, bug fixes, and release-related changes are made in this branch before merging into the main branch.

Git Flow Workflow

Git Flow is a structured branching model designed for larger projects. It uses multiple branches to organize development activities.

Common branches include:

- Main
- Develop
- Feature
- Release
- Hotfix

This workflow helps teams manage new features, releases, and emergency fixes efficiently.

Best Practices

- Create a separate branch for every feature or bug fix.
- Use meaningful branch names.
- Keep branches focused on a single task.
- Merge completed branches as soon as possible.
- Pull the latest changes before starting new work.
- Delete branches that are no longer needed.
- Resolve merge conflicts carefully before committing.

Conclusion

Branching and merging are essential Git features that allow developers to work independently while maintaining a stable project. By following effective branching strategies and collaboration practices, teams can develop, test, and deliver software more efficiently.