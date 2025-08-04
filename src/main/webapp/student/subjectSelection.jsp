<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.quiz.model.Subject"%>
<%@ page import="com.quiz.model.User" %>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("student/login.jsp");
        return;
    }

    List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Subject | QuizzMaster</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
            min-height: 100vh;
            padding-top: 70px;
        }
        .navbar-custom {
            background-color: #6f42c1;
        }
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .btn-purple {
            background-color: #6f42c1;
            color: white;
            transition: all 0.3s ease;
        }
        .btn-purple:hover {
            background-color: #563d7c;
            transform: scale(1.05);
        }
        .form-check-input {
            transform: scale(1.2);
            margin-right: 10px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="#">🧠 QuizzMaster</a>
        <div class="ms-auto">
            <span class="text-white me-2">Hi, <%= user.getName() %>!</span>
            <a href="../LogoutServlet" class="btn btn-light btn-sm">Logout</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container d-flex justify-content-center align-items-center">
    <div class="card p-4 mt-5 w-100" style="max-width: 600px;">
        <div class="card-body">
            <h3 class="text-center mb-4 text-primary">Select a Subject to Start Quiz</h3>
            <form action="QuizServlet" method="post">
                <div class="form-group">
                    <% for(Subject s : subjects) { %>
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="radio" name="subject_id" value="<%= s.getId() %>" id="subject<%= s.getId() %>" required>
                            <label class="form-check-label" for="subject<%= s.getId() %>">
                                <%= s.getName() %>
                            </label>
                        </div>
                    <% } %>
                </div>
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-purple w-100">Start Quiz</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
