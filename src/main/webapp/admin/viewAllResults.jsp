<%@page import="java.util.List"%>
<%@page import="com.quiz.model.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String name = (String) session.getAttribute("adminName");
if (name == null) {
    response.sendRedirect("login.jsp");
    return;
}
List<Result> results = (List<Result>) request.getAttribute("results");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Quiz Results | Admin</title>
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
    <h2 class="text-center">All Quiz Results</h2>
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover text-center">
            <thead>
                <tr>
                    <th>S.No.</th>
                    <th>User Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Score</th>
                    <th>Total Questions</th>
                    <th>Percentage</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    if (results != null && !results.isEmpty()) {
                        for (Result r : results) {
                            int percentage = (int)(((double)r.getScore() / 10) * 100);
                %>
                    <tr>
                        <td><%= count++ %></td>
                        <td class="text-capitalize"><%= r.getUser().getName() %></td>
                        <td><%= r.getUser().getEmail() %></td>
                        <td class="text-capitalize"><%= r.getSubject().getName() %></td>
                        <td><%= r.getScore() %></td>
                        <td>10</td>
                        <td><%= percentage %> %</td>
                        <td><%= r.getQuizDate() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="8">No results found.</td>
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
