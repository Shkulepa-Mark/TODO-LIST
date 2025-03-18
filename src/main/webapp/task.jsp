<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.todo.Task" %>
<!DOCTYPE html>
<html>
<head>
    <title>Task Manager</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1a1a1a; /* Темный фон */
            color: #e0e0e0; /* Светлый текст */
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background: #2c2c2c; /* Темно-серый фон для контейнера */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #4caf50; /* Зеленый цвет заголовка */
        }
        form {
            margin-bottom: 20px;
        }
        form input, form button {
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #4caf50; /* Зеленая рамка */
            border-radius: 4px;
            font-size: 16px;
        }
        form input {
            width: calc(100% - 22px);
            background-color: #3a3a3a; /* Темный фон для полей ввода */
            color: #e0e0e0; /* Светлый текст в полях */
        }
        form button {
            background-color: #4caf50; /* Зеленая кнопка */
            color: #fff;
            border: none;
            cursor: pointer;
        }
        form button:hover {
            background-color: #388e3c; /* Темнее зеленый при наведении */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #4caf50; /* Зеленая рамка для таблицы */
        }
        table th {
            background-color: #2c2c2c; /* Темный фон для заголовков таблицы */
        }
        .actions button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .actions .delete {
            background-color: #dc3545; /* Красная кнопка удаления */
            color: #fff;
        }
        .actions .delete:hover {
            background-color: #c82333; /* Темнее красный при наведении */
        }
        .actions .update {
            background-color: #007bff; /* Синяя кнопка обновления */
            color: #fff;
        }
        .actions .update:hover {
            background-color: #0056b3; /* Темнее синий при наведении */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Task Manager</h1>
    <!-- Форма для добавления задачи -->
    <form action="addTask" method="POST">
        <input type="text" name="title" placeholder="Title" required>
        <input type="text" name="description" placeholder="Description" required>
        <button type="submit">Add Task</button>
    </form>

    <!-- Таблица для отображения задач -->
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Получаем список задач из атрибута запроса
            List<Task> tasks = (List<Task>) request.getAttribute("tasks");
            if (tasks != null && !tasks.isEmpty()) {
                for (Task task : tasks) {
        %>
        <tr>
            <td><%= task.getId() %></td>
            <td><%= task.getTitle() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= task.isStatus() ? "Completed" : "Active" %></td>
            <td class="actions">
                <!-- Кнопка для обновления статуса -->
                <form action="updateTask" method="POST" style="display: inline;">
                    <input type="hidden" name="id" value="<%= task.getId() %>">
                    <button type="submit" class="update">Toggle Status</button>
                </form>
                <!-- Кнопка для удаления задачи -->
                <form action="delTask" method="POST" style="display: inline;">
                    <input type="hidden" name="id" value="<%= task.getId() %>">
                    <button type="submit" class="delete">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" style="text-align: center;">No tasks found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>