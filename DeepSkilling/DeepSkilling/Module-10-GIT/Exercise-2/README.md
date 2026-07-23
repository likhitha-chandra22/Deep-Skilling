# Exercise 02 - Git Ignore

## Objective

Learn how to ignore unwanted files and folders using `.gitignore`.

## Tools Used

- Git
- Git Bash / PowerShell
- Visual Studio Code

## Commands Executed

```bash
echo "This is a log file" > sample.log
mkdir log
echo "Error log" > log/error.txt
notepad .gitignore
git status
git check-ignore -v sample.log
git check-ignore -v log/error.txt
```

## .gitignore Content

```text
*.log
log/
```

## Files Created

- sample.log
- log/error.txt
- .gitignore
- Outputs

## Result

Successfully ignored all `.log` files and the `log` directory using `.gitignore` and verified the ignore rules using Git.