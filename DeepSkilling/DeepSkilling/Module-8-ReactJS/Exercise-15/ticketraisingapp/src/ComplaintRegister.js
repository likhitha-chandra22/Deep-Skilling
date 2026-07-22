import { useState } from "react";

function ComplaintRegister() {
  const [ename, setEname] = useState("Likhitha");
  const [complaint, setComplaint] = useState("");

  const handleSubmit = (event) => {
    event.preventDefault();

    const refId = Math.floor(Math.random() * 100);

    alert(
      `Thanks ${ename}\nYour Complaint was Submitted.\nReference ID is: ${refId}`
    );
  };

  return (
    <div style={{ textAlign: "center", marginTop: "40px" }}>
      <h1 style={{ color: "red" }}>Register your complaints here!!!</h1>

      <form onSubmit={handleSubmit}>
        <table style={{ margin: "auto" }}>
          <tbody>
            <tr>
              <td>Name:</td>
              <td>
                <input
                  type="text"
                  value={ename}
                  onChange={(e) => setEname(e.target.value)}
                />
              </td>
            </tr>

            <tr>
              <td>Complaint:</td>
              <td>
                <textarea
                  rows="3"
                  cols="20"
                  value={complaint}
                  onChange={(e) => setComplaint(e.target.value)}
                ></textarea>
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

export default ComplaintRegister;