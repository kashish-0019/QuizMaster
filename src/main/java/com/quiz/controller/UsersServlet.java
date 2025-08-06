package com.quiz.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.quiz.db.DBHandler;
import com.quiz.model.User;


@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			DBHandler db = new DBHandler();
			List<User> students = db.getAllStudents(); 
			request.setAttribute("students", students);
			RequestDispatcher rd = request.getRequestDispatcher("admin/viewAllStudents.jsp");
			rd.forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
