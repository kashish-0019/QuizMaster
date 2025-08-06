<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Login | QuizMaster</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #ff758c, #ff7eb3);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
    .navbar-custom {
      background-color: #dc3545;
    }
    .card {
      border: none;
      border-radius: 20px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }
    .btn-red {
      background-color: #dc3545;
      color: white;
      transition: all 0.3s ease;
    }
    .btn-red:hover {
      background-color: #bd2130;
      transform: scale(1.05);
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold fs-4" href="#">🛠 Admin Panel - QuizMaster</a>
    <div class="ms-auto">
      <a href="<%= request.getContextPath() %>/home.jsp" class="btn btn-light btn-sm">Back to Home</a>
    </div>
  </div>
</nav>

<!-- Admin Login Form -->
<div class="container d-flex justify-content-center align-items-center" style="flex: 1; margin-top: 100px;">
  <div class="col-md-6 col-lg-5">
    <div class="card p-4">
      <div class="text-center mb-3">
        <h3 class="fw-bold">Admin Login</h3>
        <p class="text-muted">Restricted access for administrators only</p>
      </div>
      <form action="<%= request.getContextPath() %>/AdminServlet" method="post">
        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email" name="email" class="form-control" placeholder="Enter admin email" required />
        </div>
        <div class="mb-3">
          <label class="form-label">Password</label>
          <input type="password" name="password" class="form-control" placeholder="Enter admin password" required />
        </div>
        <button type="submit" class="btn btn-red w-100">Login</button>
      </form>
    </div>
  </div>
</div>

</body>
</html>
