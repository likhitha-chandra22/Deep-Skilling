import React from "react";

function Scorebelow70(props) {

    const players70 = [];

    props.players.map((item) => {
        if (item.score <= 70) {
            players70.push(item);
        }
        return null;
    });

    return (
        <div>
            <ul>
                {
                    players70.map((item, index) => (
                        <li key={index}>
                            Mr. {item.name} <span>{item.score}</span>
                        </li>
                    ))
                }
            </ul>
        </div>
    );
}

export default Scorebelow70;