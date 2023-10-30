
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page_laundyPro</title>

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
	
	
		<h1 style="text-align: center;">LAUNDRY PRO</h1>
		<h3 style="text-align: center;">Login Page</h3>
		<main class="main">
		<div id="main-content">
				<table style="width:20%">
					<form action="loginctrl" method="post">
					<tr>
						<td>
							<label for="username">Username:</label>
						</td>
						<td>
							<input type="text" id="username" name="username" required>
						</td>
					</tr>
					<tr></tr>
					<tr>
						<td>
							<label for="password">Password:</label>
						</td>
						<td>
							<input type="password" id="password" name="password" required>
						</td>
					</tr>
				
					<tr>
						<td colspan ="2">
							<input type="submit" value="Login">
						</td>
					</tr>
					</form>
				</table>
		
	</div>
	</main>
</body>
</html>
