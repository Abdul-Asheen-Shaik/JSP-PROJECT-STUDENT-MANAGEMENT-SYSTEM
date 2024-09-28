<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

table {
	border-collapse: collapse;
	margin: auto;
}

td {
	padding: 10px;
	text-align: center;
}

h1 {
	text-align: center;
}

h2 {
	text-align: center;
	color: #666;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

td button {
	display: block;
	margin: 10px auto 0 auto;
}
</style>
</head>
<body>
	<h1>Student Management</h1>
	<h2>Please login to access the system</h2>
	<form action="login" method="post">
		<table>
			<tr>
				<td><label for="username">User Name :</label></td>
				<td><input type="text" id="username" name="username" required></td>
			</tr>
			<tr>
				<td><label for="password">Password :</label></td>
				<td><input type="password" id="password" name="password"
					required></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Login"></td>
			</tr>
		</table>

	</form>
	<%=request.getParameter("error") != null ? request.getParameter("error") : ""%>
</body>
</html>