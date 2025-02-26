import React, { useState, useEffect } from "react";
import axios from "axios";
import "./App.css"; // 스타일 분리된 파일

const API_URL = process.env.REACT_APP_API_URL;

function App() {
    const [users, setUsers] = useState([]);
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");

    // 사용자 목록 가져오기
    useEffect(() => {
        axios.get(API_URL)
            .then(response => setUsers(response.data))
            .catch(error => console.error("Error fetching users:", error));
    }, []);

    // 사용자 추가하기
    const addUser = () => {
        if (!name || !email) {
            alert("이름과 이메일을 입력하세요.");
            return;
        }

        axios.post(API_URL, { name, email })
            .then(response => {
                setUsers([...users, response.data]); // 새 유저 추가
                setName("");
                setEmail(""); // 입력 필드 초기화
            })
            .catch(error => console.error("Error adding user:", error));
    };

    return (
        <div className="container">
            <h1 className="title">👥 User List</h1>
            <div className="input-container">
                <input
                    type="text"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    placeholder="Enter name"
                    className="input"
                />
                <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="Enter email"
                    className="input"
                />
                <button onClick={addUser} className="button">Add User</button>
            </div>
            <ul className="user-list">
                {users.map(user => (
                    <li key={user.id} className="user-card">
                        <strong>{user.name}</strong> <span>{user.email}</span>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default App;
