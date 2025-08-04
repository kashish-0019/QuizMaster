package com.quiz.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.quiz.db.DBHandler;
import com.quiz.model.Result;
import com.quiz.model.User;


@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    HttpSession session = request.getSession();
		    User user = (User) session.getAttribute("currentuser");
		    System.out.println("Current User ID: " + user.getId());


	        if (user == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        DBHandler db = new DBHandler();
	        List<Result> results = db.getResultsByUserId(user.getId());

	        session.setAttribute("results", results);
	        request.getRequestDispatcher("student/dashboard.jsp").forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

}
