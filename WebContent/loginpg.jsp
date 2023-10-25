
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>

<link rel="stylesheet" href="css/styles.css">

<!--google icons-->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<!--roboto font-->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz@6..12&display=swap" rel="stylesheet">
<script src="js/scripts.js"></script>
</head>
<body>
	<!--Header-->

	<header class="header">
		<div class="header-right">
			<!--empty-->
		</div>
		<div class="header-left">
			<a class="navlinks" href="loginpg.jsp">
				<span class="material-symbols-outlined">login</span>Login
			</a>
			<a class="navlinks" href="index.jsp">
				<span class="material-symbols-outlined">home</span>Home
			</a>
		</div>
	</header>

	<div class="page">
		<h1 style="text-align: center;">LAUNDRY PRO</h1>
		<h3 style="text-align: center;">Login Page</h3>
		<center>
			<div>
				<form action="loginctrl" method="post">
					<label for="username">Username:</label>
					<input type="text" id="username" name="username" required>
					<br />
					<br />
					<label for="password">Password:</label>
					<input type="password" id="password" name="password" required>
					<br />
					<br/>
					<input type="submit" value="Login">
				</form>
			</div>
		</center>
	</div>

</body>
</html>
