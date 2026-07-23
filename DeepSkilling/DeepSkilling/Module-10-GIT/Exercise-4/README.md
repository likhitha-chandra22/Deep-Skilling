# Exercise 04 - Merge Conflict Resolution

## Objective

Learn how to resolve merge conflicts when multiple users modify the same file in different branches.

## Tools Used

- Git
- Git Bash / PowerShell
- Visual Studio Code

## Commands Executed

```bash
git init

echo "<message>Hello World</message>" > hello.xml
git add .
git commit -m "Initial commit"

git checkout -b GitWork

git add .
git commit -m "Updated hello.xml in GitWork"

git checkout master

git add .
git commit -m "Updated hello.xml in master"

git log --oneline --graph --decorate --all
git diff master GitWork

git merge GitWork

git add hello.xml
git commit -m "Resolved merge conflict"

git add .gitignore
git commit -m "Added backup file to gitignore"

git branch
git branch -d GitWork

git log --oneline --graph --decorate
git status
```

## Files Created

- hello.xml
- .gitignore
- backup.bak
- Output/Lab10_Exercise04_Output.txt

## Result

Successfully created a merge conflict, resolved the conflict manually, ignored backup files using `.gitignore`, deleted the merged branch, and verified the repository status.