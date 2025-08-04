package com.quiz.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.quiz.db.DBHandler;
import com.quiz.model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String name = request.getParameter("name");
	      String email = request.getParameter("email");
	      String password = request.getParameter("password");
	      
	      DBHandler db = new DBHandler();
	   
	     boolean success = db.registerUser(name,email,password);
	     if(success) {
	    	 response.sendRedirect("student/login.jsp");
	     }else {
	    	 response.getWriter().println("Registeration Failed!");
	     }
	}

}
