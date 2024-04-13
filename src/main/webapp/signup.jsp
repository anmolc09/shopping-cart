<%@page import="java.util.ArrayList"%>
<%@page import="com.learning.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	
	%>
<!doctype html>
<html lang="en">
<head>
<title>sign up page</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Signup</div>
			<div class="card-body">
				<form action="user-signup" method="post">
					<div class="form-group">
						<label>Name</label> <input type="text" name="signup-name"
							class="form-control" placeholder="Enter name">
					</div>
					<div class="form-group">
						<label>Email address</label> <input type="email"
							name="signup-email" class="form-control"
							placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							name="signup-password" class="form-control"
							placeholder="Enter password">
					</div>
					<div class="form-group">
						<label>Confirm Password</label> <input type="password"
							name="confirm-password" class="form-control"
							placeholder="Confirm password">
					</div>
					<button type="submit" class="btn btn-primary">Sign Up</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>