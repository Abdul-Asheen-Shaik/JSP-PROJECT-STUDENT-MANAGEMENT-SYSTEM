package com.codegnan.studentapp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codegnan.studentapp.util.DatabaseUtil;

@WebServlet("/add-student")
public class AddStudentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
		String role = (String) session.getAttribute("role");
		if (session == null || loggedIn == null || !loggedIn) {
			response.sendRedirect("login.jsp");
			return;
		} else if ("user".equals(role)) {
			response.sendRedirect("students");
			return;
		} else {
			request.getRequestDispatcher("add-student.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
		String role = (String) session.getAttribute("role");
		if (session == null || loggedIn == null || !loggedIn) {
			response.sendRedirect("login.jsp");
			return;
		}
		if (!"admin".equals(role)) {
			response.sendRedirect("students");
			return;
		}
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String course = request.getParameter("course");
		try (Connection connection = DatabaseUtil.getConnection()) {
			String sql = "INSERT INTO students (name, age, course) VALUES (?, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			statement.setInt(2, Integer.parseInt(age));
			statement.setString(3, course);
			statement.executeUpdate();
			response.sendRedirect("students");
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}
