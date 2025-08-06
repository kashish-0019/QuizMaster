<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("adminName");
    if (name == null) {
        response.sendRedirect("admin/login.jsp");
        return;
    }

    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | QuizMaster</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #a18cd1, #fbc2eb);
            min-height: 100vh;
            margin: 0;
        }
        .navbar-custom {
            background-color: #6f42c1;
        }
        .dashboard-card {
            margin-top: 100px;
            background-color: white;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
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
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="#">🧠 QuizMaster - Admin</a>
        <div class="ms-auto text-white me-3">
            Welcome, <%= name %>
        </div>
        <a href="<%= request.getContextPath() %>/home.jsp" class="btn btn-light btn-sm me-2">Back to Home</a>
    </div>
</nav>

<!-- Alert Message -->
<% if (message != null && !message.isEmpty()) { %>
    <div class="container mt-5 pt-4">
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
<% } %>

<!-- Dashboard Content -->
<div class="container d-flex justify-content-center align-items-center">
    <div class="dashboard-card col-md-8 text-center">
        <h2 class="mb-4 fw-bold text-dark">Admin Dashboard</h2>
        <p class="text-muted mb-4">Manage the QuizMaster platform</p>

        <div class="row">
            <div class="col-md-4 mb-3">
                <a href="<%=request.getContextPath() %>/UsersServlet" class="btn btn-purple w-100">View All Students</a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="<%=request.getContextPath() %>/AdminSubjectServlet" class="btn btn-purple w-100">Manage Subjects</a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="<%=request.getContextPath() %>/AdminAddQuiz" class="btn btn-purple w-100">Add New Quiz</a>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-4 mb-3">
                <a href="<%=request.getContextPath() %>/ResultServlet" class="btn btn-purple w-100">View Results</a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="<%=request.getContextPath() %>/home.jsp" class="btn btn-purple w-100">Go Back to Home</a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="<%= request.getContextPath() %>/LogoutServlet" class="btn btn-danger w-100">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
