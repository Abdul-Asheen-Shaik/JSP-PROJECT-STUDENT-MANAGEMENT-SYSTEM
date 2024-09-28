<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.codegnan.studentapp.model.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>Students</title>
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
	display: inline; /* Adjusted for inline form display */
	margin-right: 5px; /* Added margin for button spacing */
}

button {
	margin-top: 10px;
}
</style>
</head>
<body>
	<h1>Student List</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Age</th>
			<th>Course</th>
			<%
			if ("admin".equals(session.getAttribute("role"))) {
			%>
			<th>Actions</th>
			<%
			}
			%>
		</tr>
		<%
		List<Student> students = (List<Student>) request.getAttribute("students");
		for (Student student : students) {
		%>
		<tr>
			<td><%=student.getId()%></td>
			<td><%=student.getName()%></td>
			<td><%=student.getAge()%></td>
			<td><%=student.getCourse()%></td>
			<%
			if ("admin".equals(session.getAttribute("role"))) {
			%>
			<td>
				<form action="edit-student" method="get">
					<input type="hidden" name="id" value="<%=student.getId()%>">
					<button type="submit">Edit</button>
				</form>
				<form action="delete-student" method="post">
					<input type="hidden" name="id" value="<%=student.getId()%>">
					<button type="submit">Delete</button>
				</form>
			</td>
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
	<%
	if ("admin".equals(session.getAttribute("role"))) {
	%>
	<a href="add-student">Add Student</a>
	<%
	}
	%>
	<a href="logout">Logout</a>
</body>
</html>
