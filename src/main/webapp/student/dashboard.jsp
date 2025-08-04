<%@page import="com.quiz.model.Result"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.User" %>
<%
  User user = (User)session.getAttribute("currentuser");
  if(user == null){
      response.sendRedirect("login.jsp");
      return;
  }
  
  List<Result> results = (List<Result>)session.getAttribute("results");
 
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Dashboard | QuizzMaster</title>
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
      height: 100%;
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
    .profile-label {
      font-weight: 600;
      color: #6f42c1;
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
<div class="container mt-5">
  <!-- Welcome -->
  <div class="text-center mb-4">
    <h2 class="fw-bold">Welcome, <%= user.getName() %> 👋</h2>
    <p class="text-muted">Here is your profile and quiz options</p>
  </div>

  <!-- Cards Row -->
  <div class="row justify-content-center g-4">
    
    <!-- Profile Card -->
    <div class="col-md-5 d-flex">
      <div class="card w-100 p-4 d-flex flex-column justify-content-between">
        <div>
          <h4 class="mb-3 fw-semibold text-center">👤 Your Profile</h4>
          <p class="profile-label">Name: <span class="text-dark"><%= user.getName() %></span></p>
          <p class="profile-label">Email: <span class="text-dark"><%= user.getEmail() %></span></p>
        </div>
        
      </div>
    </div>

    <!-- Subject Card -->
    <div class="col-md-5 d-flex">
      <div class="card w-100 p-4 d-flex flex-column justify-content-center text-center">
        <h4 class="mb-4 fw-semibold">📚 Take a Quiz</h4>
        <a href="<%=request.getContextPath()%>/SubjectServlet" class="btn btn-purple px-4 py-2 fs-5">Show Subjects</a>
      </div>
    </div>

  </div>
</div>
    <!-- Previous Results Section -->
<div class="container mt-5 mb-5">
  <h3 class="fw-bold mb-3 text-center">📝 Previous Quiz Results</h3>
  
  <% if(results != null && !results.isEmpty()) { %>
    <div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">
      <% int id=0;
      for(Result r : results) {
    	 id++ ;%>
        <div class="col">
          <div class="card h-100 p-3">
            <div class="card-body">
              <h5 class="card-title text-primary">Quiz ID: <%=id%></h5>
              <p class="mb-2"><strong>Subject:</strong> <%= r.getSubjectName() %></p>
              <p class="mb-2"><strong>Score:</strong> <%= r.getScore() %></p>
              <p class="mb-0"><strong>Date:</strong> <%= r.getQuizDate() %></p>
            </div>
          </div>
        </div>
      <% } %>
    </div>
  <% } else { %>
    <div class="text-center mt-3">
      <p class="text-muted">No quiz attempts yet. Take a quiz to see your results here.</p>
    </div>
  <% } %>
</div>

</body>
</html>
