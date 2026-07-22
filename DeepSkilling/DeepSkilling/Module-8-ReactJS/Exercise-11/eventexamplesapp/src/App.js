import './App.css';
import { useState } from "react";
import CurrencyConvertor from "./CurrencyConvertor";

function App() {

  const [count, setCount] = useState(0);

  function increment() {
    setCount(count + 1);
  }

  function decrement() {
    setCount(count - 1);
  }

  function sayHello() {
    alert("Hello! Member!");
  }

  function increase() {
    increment();
    sayHello();
  }

  function sayWelcome(msg) {
    alert(msg);
  }

  function onPress() {
    alert("I was clicked");
  }

  return (
    <div style={{ margin: "20px" }}>

      <h2>{count}</h2>

      <button onClick={increase}>
        Increment
      </button>

      <br /><br />

      <button onClick={decrement}>
        Decrement
      </button>

      <br /><br />

      <button onClick={() => sayWelcome("Welcome")}>
        Say Welcome
      </button>

      <br /><br />

      <button onClick={onPress}>
        Click on me
      </button>

      <CurrencyConvertor />

    </div>
  );
}

export default App;