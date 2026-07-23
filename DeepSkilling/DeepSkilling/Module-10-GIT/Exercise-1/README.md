# Exercise 01 - Git Configuration and Repository Initialization

## Objective

Configure Git, set a default editor, initialize a local Git repository, create a file, stage it, and commit it.

## Tools Used

- Git
- Git Bash
- Notepad++
- Visual Studio Code

## Commands Executed

```bash
git --version
git config --global --list
git config --global core.editor "notepad++ -multiInst -nosession"
git config --global -e
git init GitDemo
cd GitDemo
echo "Welcome to the version control" > welcome.txt
ls -la
cat welcome.txt
git status
git add welcome.txt
git commit
git status
```

## Folder Structure

```
Exercise-1/
├── GitDemo/
│   └── welcome.txt
├── Outputs/
└── README.md
```

## Files Created

- GitDemo/
- welcome.txt
- Outputs/ (Screenshots)

## Result

Successfully configured Git, configured Notepad++ as the default editor, initialized a local Git repository, created `welcome.txt`, staged the file, committed it successfully, and verified that the working tree was clean.