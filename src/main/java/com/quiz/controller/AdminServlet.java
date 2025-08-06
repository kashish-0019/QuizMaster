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
import com.quiz.model.Admin;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		DBHandler db = new DBHandler();
		Admin admin = db.getAdmin(email, password);
	
		 if(admin!=null) {
			  session.setAttribute("email", email);
			  session.setAttribute("adminName", admin.getName());
	    	  response.sendRedirect("admin/dashboard.jsp");
	      }else {
	    	  request.setAttribute("error", "Invalid email or password.");
	          RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath()+"admin/login.jsp");
	          rd.forward(request, response);
	      }
	}

}
