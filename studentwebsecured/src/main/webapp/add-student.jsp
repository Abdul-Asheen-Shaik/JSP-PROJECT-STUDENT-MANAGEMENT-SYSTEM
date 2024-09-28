<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Student</title>
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
	<h1>Add Student</h1>
	<form action="add-student" method="post">
		<table>
			<tr>
				<td><label for="name">Name:</label></td>
				<td><input type="text" id="name" name="name" required></td>
			</tr>
			<tr>
				<td><label for="age">Age:</label></td>
				<td><input type="number" id="age" name="age" required></td>
			</tr>
			<tr>
				<td><label for="course">Course:</label></td>
				<td><input type="text" id="course" name="course" required></td>
			</tr>
		</table>
		<button type="submit">Add</button>
	</form>
	<a href="students">Back to Student List</a>
</body>
</html>
