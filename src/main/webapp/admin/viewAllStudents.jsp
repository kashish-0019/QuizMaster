<%@page import="com.quiz.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String name = (String) session.getAttribute("adminName");
    if (name == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<User> students = (List<User>) request.getAttribute("students");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Students | QuizMaster Admin</title>
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
        .card-custom {
            margin-top: 200px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #6f42c1;
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: #f2f2f2;
        }
        .btn-purple {
            background-color: #6f42c1;
            color: white;
        }
        .btn-purple:hover {
            background-color: #563d7c;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top shadow ">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="#">🧠 QuizMaster - Admin</a>
        <div class="ms-auto text-white me-3">
            Welcome, <%= name %>
        </div>
        <a href="<%= request.getContextPath() %>/admin/dashboard.jsp" class="btn btn-light btn-sm me-2">Dashboard</a>
    </div>
</nav>

<!-- Page Content -->
<div class="container pt-5" style="padding-top: 120px;">

    <div class="card-custom mt-5">
        <h2 class="text-center mb-4 fw-bold text-dark">All Registered Students</h2>

        <% if (students != null && !students.isEmpty()) { %>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (User u : students) { %>
                        <tr>
                            <td><%= u.getId() %></td>
                            <td><%= u.getName() %></td>
                            <td><%= u.getEmail() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div class="alert alert-warning text-center">No students found!</div>
        <% } %>


    </div>
</div>

</body>
</html>
