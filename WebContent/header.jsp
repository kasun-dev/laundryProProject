<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
<!--google icons-->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<!--roboto font-->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz@6..12&display=swap" rel="stylesheet">
<script src="js/scripts.js"></script>
</head>


<!--Header-->
<header class="header">
	<div class="menu-icon" onclick="openSidebar()">
		<span class="material-symbols-outlined">menu</span>
	</div>
	<div class="header-right">
		<!--empty-->
	</div>
	<div class="header-left">
		<a class="navlinks" href="javascript:void(0);" onclick="loadContent('cus.index.jsp')">
			<span class="material-symbols-outlined">home</span>Home
		</a>
		<a class="navlinks" href="javascript:void(0);" onclick="loadContent('userDetails.jsp')">
			<span class="material-symbols-outlined">badge</span>My account
		</a>
	</div>
</header>

</html>