# Exercise 14 - React Context API

## Objective
Implemented React Context API to share theme data across nested components without prop drilling.

## Features
- Created ThemeContext using createContext().
- Wrapped the application with ThemeContext.Provider.
- Passed theme value through Context API.
- Removed theme prop from EmployeesList component.
- Accessed theme using useContext() in EmployeeCard.
- Applied Light and Dark themes dynamically to action buttons.

## Technologies Used
- React JS
- React Context API
- JavaScript (ES6)
- CSS Modules

## Project Structure
src/
│── App.js
│── Employee.js
│── EmployeesList.js
│── EmployeeCard.js
│── EmployeeCard.module.css
│── ThemeContext.js
│── index.js
│── App.css

## How to Run
1. Open the project in VS Code.
2. Install dependencies:
   npm install
3. Start the application:
   npm start

## Learning Outcomes
- Understood React Context API.
- Implemented createContext() and useContext().
- Used ThemeContext.Provider to share state.
- Eliminated prop drilling between components.
- Applied dynamic themes using Context API.