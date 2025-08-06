<%@page import="com.quiz.model.Subject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String name = (String) session.getAttribute("adminName");
    if (name == null) {
        response.sendRedirect("admin/login.jsp");
        return;
    }
    List<Subject> subjects = (List<Subject>) request.getAttribute("subjectList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Subjects | Admin</title>
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
        .table th {
            background-color: #6f42c1;
            color: white;
            text-transform: uppercase;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2e8fc;
        }
        .table-hover tbody tr:hover {
            background-color: #e5d4fa;
            cursor: pointer;
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
        .table td, .table th {
            vertical-align: middle;
        }
        form.add-subject-form {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 30px;
        }
        .form-control {
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
<div class="container mt-4">
    <h2 class="text-center">Manage Subjects</h2>

    <!-- Add Subject Form -->
    <form action="<%= request.getContextPath() %>/AdminSubjectServlet" method="post" class="add-subject-form">
        <input type="hidden" name="action" value="add">
        <input type="text" name="subjectName" class="form-control w-50" placeholder="Enter new subject name" required>
        <button type="submit" class="btn btn-success">Add Subject</button>
    </form>

    <!-- Subjects Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover text-center">
            <thead>
                <tr>
                    <th>S.No.</th>
                    <th>Subject Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 1;
                    if (subjects != null && !subjects.isEmpty()) {
                        for (Subject s : subjects) {
                %>
                    <tr>
                        <td><%= i++ %></td>
                        <td class="text-capitalize"><%= s.getName() %></td>
                        <td>
                            <form action="<%= request.getContextPath() %>/AdminSubjectServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this subject?');">
                                <input type="hidden" name="id" value="<%= s.getId() %>">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="3">No subjects found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
