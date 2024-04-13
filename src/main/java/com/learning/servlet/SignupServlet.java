package com.learning.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learning.connection.DbCon;
import com.learning.dao.UserDao;
import com.learning.model.User;

@WebServlet("/user-signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("signup-email");
			String password = request.getParameter("signup-password");
			String name = request.getParameter("signup-name");

			User user = new User(email, password, name);
			UserDao udao = new UserDao(DbCon.getConnection());
			int status = udao.userSignup(user);
			if (status > 0) {
				out.println("Signup Successful. Please <a href='login.jsp'>Login</a>");
			} else {
				out.println("Signup Failed. Please try again.");
			}
		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 
	}
}