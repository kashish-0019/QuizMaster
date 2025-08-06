<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.quiz.model.Subject"%>
<%@page import="java.util.List"%>
<%
    String name = (String) session.getAttribute("adminName");
    if (name == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Subject> subjects = (List<Subject>) request.getAttribute("subjectList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Quiz | Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #a18cd1, #fbc2eb);
            padding-top: 100px;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.15);
        }
        h2 {
            color: #6f42c1;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .navbar-custom {
            background: linear-gradient(to right, #6f42c1, #9f79ee);
        }
        .form-label {
            font-weight: 600;
            color: #6f42c1;
        }
        .btn-purple {
            background-color: #6f42c1;
            color: white;
            font-weight: bold;
        }
        .btn-purple:hover {
            background-color: #563d7c;
        }
        .welcome-text {
            color: #fff;
            font-weight: 500;
            margin-right: 15px;
        }
        .btn-light {
            background-color: #f8f9fa;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top shadow-sm">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold fs-4" href="#">🧠 QuizMaster - Admin</a>
        <div class="ms-auto d-flex align-items-center">
            <span class="welcome-text">Welcome, <%= name %></span>
            <a href="<%= request.getContextPath() %>/admin/dashboard.jsp" class="btn btn-light btn-sm">Dashboard</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-4 col-md-8 mb-5">
    <h2 class="text-center">Add New Quiz Question</h2>
    <form action="<%=request.getContextPath()%>/AdminAddQuiz" method="post">
        <div class="mb-3">
            <label class="form-label">Select Subject:</label>
            <select class="form-select" name="subjectId" required>
                <option value="">--Select Subject--</option>
                <% for (Subject s : subjects) { %>
                    <option value="<%=s.getId()%>"><%=s.getName()%></option>
                <% } %>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Question:</label>
            <input type="text" class="form-control" name="question" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Option A:</label>
            <input type="text" class="form-control" name="optionA" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Option B:</label>
            <input type="text" class="form-control" name="optionB" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Option C:</label>
            <input type="text" class="form-control" name="optionC" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Option D:</label>
            <input type="text" class="form-control" name="optionD" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Correct Option:</label>
            <select class="form-select" name="correctOption" required>
                <option value="">--Select Correct Option--</option>
                <option value="A">Option A</option>
                <option value="B">Option B</option>
                <option value="C">Option C</option>
                <option value="D">Option D</option>
            </select>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-purple px-4">Add Question</button>
        </div>
    </form>
</div>

</body>
</html>
