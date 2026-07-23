# Exercise 03 - Branching and Merging

## Objective

Learn how to create a branch, switch between branches, commit changes, compare branches, merge a branch into the master branch, and delete the merged branch.

## Tools Used

- Git
- Git Bash / PowerShell
- Visual Studio Code

## Commands Executed

```bash
git init
echo "Branching Demo" > welcome.txt
git add .
git commit -m "Initial commit"

git branch GitNewBranch
git branch

git checkout GitNewBranch
echo "This file is created in GitNewBranch" > branch.txt
git add .
git commit -m "Added branch.txt in GitNewBranch"

git status

git checkout master
git diff master GitNewBranch
git merge GitNewBranch

git log --oneline --graph --decorate

git branch -d GitNewBranch
git status
```

## Files Created

- welcome.txt
- branch.txt
- Outputs/Lab10_Exercise03_Output.txt

## Result

Successfully created a new branch, committed changes in the branch, switched back to the master branch, compared the branches, merged the branch into the master branch, viewed the commit history using the graph, deleted the merged branch, and verified the repository status.