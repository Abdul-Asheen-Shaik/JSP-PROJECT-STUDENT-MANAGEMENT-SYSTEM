<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Map"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies
// Session check
if (session == null) {
	response.sendRedirect("login.jsp");
	return;
}
String role = (String) session.getAttribute("role");
if (role == null) {
	response.sendRedirect("login.jsp");
	return;
}
// Role check
if (!"admin".equals(role)) {
	response.sendRedirect("students");
	return;
}
Map<String, String> student = (Map<String, String>) request.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Student</title>
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
}

td[colspan="2"] {
	text-align: center;
}

h1 {
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

button {
	margin-top: 10px;
}
</style>
</head>
<body>
	<h1>Edit Student</h1>
	<%
	if (student == null) {
		out.println("<p>Error: No student data available.</p>");
	} else {
	%>
	<form action="edit-student" method="post">
		<input type="hidden" name="id" value="<%=student.get("id")%>">
		<table>
			<tr>
				<td><label for="name">Name:</label></td>
				<td><input type="text" id="name" name="name"
					value="<%=student.get("name")%>" required></td>
			</tr>
			<tr>
				<td><label for="age">Age:</label></td>
				<td><input type="number" id="age" name="age"
					value="<%=student.get("age")%>" required></td>
			</tr>
			<tr>
				<td><label for="course">Course:</label></td>
				<td><input type="text" id="course" name="course"
					value="<%=student.get("course")%>" required></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">Update</button></td>
			</tr>
		</table>
	</form>
	<%
	}
	%>
	<a href="students">Back to Student List</a>
</body>
</html>
