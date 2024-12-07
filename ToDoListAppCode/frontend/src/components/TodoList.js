// src/components/TodoList.js
import React from 'react';

const TodoList = ({ todos, deleteTodo }) => (
    <ul>
        {todos.map(todo => (
            <li key={todo._id}>
                {todo.text}
                <button onClick={() => deleteTodo(todo._id)} style={{ marginLeft: '10px' }}>
                    Delete
                </button>
            </li>
        ))}
    </ul>
);

export default TodoList;
