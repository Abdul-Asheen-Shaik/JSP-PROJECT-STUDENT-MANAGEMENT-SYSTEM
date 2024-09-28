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

@WebServlet("/delete-student")
public class DeleteStudentServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		if (!"admin".equals(role)) {
			response.sendRedirect("students");
			return;
		}
		String id = request.getParameter("id");
		try (Connection connection = DatabaseUtil.getConnection()) {
			String sql = "DELETE FROM students WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, Integer.parseInt(id));
			statement.executeUpdate();
			response.sendRedirect("students");
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}
