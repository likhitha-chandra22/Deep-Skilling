import { useState } from "react";

function Register() {
  const [form, setForm] = useState({
    fullName: "",
    email: "",
    password: "",
  });

  const handleChange = (event) => {
    setForm({
      ...form,
      [event.target.name]: event.target.value,
    });
  };

  const handleSubmit = (event) => {
    event.preventDefault();

    if (form.fullName.length < 5) {
      alert("Full Name must be 5 characters long!");
      return;
    }

    if (!(form.email.includes("@") && form.email.includes("."))) {
      alert("Email is not valid!");
      return;
    }

    if (form.password.length < 8) {
      alert("Password must be 8 characters long!");
      return;
    }

    alert("Valid Form");
  };

  return (
    <div style={{ textAlign: "center", marginTop: "40px" }}>
      <h1 style={{ color: "red" }}>Register Here!!!</h1>

      <form onSubmit={handleSubmit}>
        <table style={{ margin: "auto" }}>
          <tbody>
            <tr>
              <td>Name:</td>
              <td>
                <input
                  type="text"
                  name="fullName"
                  value={form.fullName}
                  onChange={handleChange}
                />
              </td>
            </tr>

            <tr>
              <td>Email:</td>
              <td>
                <input
                  type="text"
                  name="email"
                  value={form.email}
                  onChange={handleChange}
                />
              </td>
            </tr>

            <tr>
              <td>Password:</td>
              <td>
                <input
                  type="password"
                  name="password"
                  value={form.password}
                  onChange={handleChange}
                />
              </td>
            </tr>

            <tr>
              <td></td>
              <td>
                <button type="submit">Submit</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  );
}

export default Register;