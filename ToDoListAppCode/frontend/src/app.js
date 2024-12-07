// frontend/src/App.js
import React, { useState, useEffect } from 'react';
import TodoList from './components/TodoList';
import './app.css';

const API_BASE_URL = process.env.REACT_APP_API_BASE_URL || '/backend';

function App() {
    const [todos, setTodos] = useState([]);
    const [text, setText] = useState("");
    const [error, setError] = useState(null);

    // Fetch to-dos on component mount
    useEffect(() => {
        fetch(`${API_BASE_URL}/todos`)
            .then(res => {
                if (!res.ok) throw new Error("Failed to fetch todos");
                return res.json();
            })
            .then(data => setTodos(data))
            .catch(() => setError("Error fetching todos"));
    }, []);

    // Add a new to-do
    const addTodo = () => {
        if (text.trim() === "") return;
        fetch(`${API_BASE_URL}/todos`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ text })
        })
        .then(res => {
            if (!res.ok) throw new Error("Failed to add todo");
            return res.json();
        })
        .then(newTodo => setTodos([...todos, newTodo]))
        .catch(() => setError("Error adding todo"));
        setText("");
    };

    // Delete a to-do by ID
    const deleteTodo = (id) => {
        fetch(`${API_BASE_URL}/todos/${id}`, {
            method: 'DELETE'
        })
        .then(res => {
            if (!res.ok) throw new Error("Failed to delete todo");
            setTodos(todos.filter(todo => todo._id !== id));
        })
        .catch(() => setError("Error deleting todo"));
    };

    // Handle Enter key for submission
    const handleKeyDown = (e) => {
        if (e.key === 'Enter') addTodo();
    };

    return (
        <div className="container">
            <h1>To-Do List</h1>
            {error && <p className="error">{error}</p>}
            <input
                type="text"
                value={text}
                onChange={(e) => setText(e.target.value)}
                onKeyDown={handleKeyDown}
                placeholder="Enter new to-do"
            />
            <button onClick={addTodo}>Add</button>
            <TodoList todos={todos} deleteTodo={deleteTodo} />
        </div>
    );
}

export default App;
