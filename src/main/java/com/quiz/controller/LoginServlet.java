package com.quiz.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.quiz.db.DBHandler;
import com.quiz.model.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String email = request.getParameter("email");
	      String password = request.getParameter("password");
	      
	      DBHandler db = new DBHandler();
	      
	      User user =db.validateUser(email, password);
	      
	      if(user!=null) {
	    	  HttpSession session = request.getSession();
	    	  session.setAttribute("currentuser", user);
	    	  response.sendRedirect("DashboardServlet");
	      }else {
	    	  request.setAttribute("error", "Invalid email or password.");
	          RequestDispatcher rd = request.getRequestDispatcher("student/login.jsp");
	          rd.forward(request, response);
	      }
	}

}
