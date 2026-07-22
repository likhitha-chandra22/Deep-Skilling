import React, { useState } from "react";
import "./App.css";

function LoginButton(props) {
  return (
    <button onClick={props.onClick}>
      Login
    </button>
  );
}

function LogoutButton(props) {
  return (
    <button onClick={props.onClick}>
      Logout
    </button>
  );
}

function GuestGreeting() {
  return (
    <div>
      <h1>Please sign up.</h1>

      <h3>Flight Details</h3>

      <table border="1" cellPadding="8">
        <thead>
          <tr>
            <th>Flight</th>
            <th>From</th>
            <th>To</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>AI-202</td>
            <td>Hyderabad</td>
            <td>Delhi</td>
          </tr>

          <tr>
            <td>6E-315</td>
            <td>Chennai</td>
            <td>Mumbai</td>
          </tr>

          <tr>
            <td>UK-811</td>
            <td>Bangalore</td>
            <td>Kolkata</td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}

function UserGreeting() {
  return (
    <div>
      <h1>Welcome back</h1>
      <h3>You can now book your flight tickets.</h3>
    </div>
  );
}

function Greeting(props) {
  if (props.isLoggedIn) {
    return <UserGreeting />;
  }

  return <GuestGreeting />;
}

function App() {

  const [isLoggedIn, setIsLoggedIn] = useState(false);

  function handleLoginClick() {
    setIsLoggedIn(true);
  }

  function handleLogoutClick() {
    setIsLoggedIn(false);
  }

  let button;

  if (isLoggedIn) {
    button = <LogoutButton onClick={handleLogoutClick} />;
  } else {
    button = <LoginButton onClick={handleLoginClick} />;
  }

  return (
    <div style={{ margin: "50px" }}>
      <Greeting isLoggedIn={isLoggedIn} />

      <br />

      {button}
    </div>
  );
}

export default App;