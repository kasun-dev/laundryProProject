<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<!--css-->
<link rel="stylesheet" href="css/db-styles.css">
<!--google icons-->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!--roboto font-->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz@6..12&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="container">

		<!--Header-->
		<header class="header">
			<div class="menu-icon" onclick="openSidebar()">
				<span class="material-symbols-outlined">menu</span>
			</div>
			<div class="header-right">
				<!--empty-->
			</div>
			<div class="header-left">
				<a class="navlinks" href="javascript:void(0);"
					onclick="loadContent('cus.index.jsp')"> <span
					class="material-symbols-outlined">home</span>Home
				</a> <a class="navlinks" href="javascript:void(0);"
					onclick="loadContent('userDetails.jsp')"> <span
					class="material-symbols-outlined">badge</span>My account
				</a>
			</div>

		</header>

		<!--SideBar-->
		<aside id="sidebar">
			<div class="sidebar-title">
				<div class="sidebar-brand">
					<span class="material-symbols-outlined">point_of_sale</span>
					LaundryPro
				</div>
				<!--Side Bar menu icon-->
				<span class="material-symbols-outlined" onclick="closeSidebar()">close</span>
			</div>

			<ul class="sidebar-list">

				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="loadContent('createNewBill.jsp')"> <span
						class="material-symbols-outlined">add_circle</span>Create New
						Order
				</a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="loadContent('manageOrder.jsp')"> <span
						class="material-symbols-outlined">list_alt</span>Manage Order
				</a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="loadContent('managePrices.jsp')"> <span
						class="material-symbols-outlined">sell</span>Manage Prices
				</a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="loadContent('manageUserAccounts.jsp')"> <span
						class="material-symbols-outlined">manage_accounts</span>Manage
						User Accounts
				</a></li>
			</ul>
		</aside>

		<!--main content-->
		<main class="main">
			<div id="main-content">
				<jsp:include page="createNewBill.jsp" />
				<!-- main content goes here -->
			</div>

		</main>


	</div>
	<!--js-->
	<script src="js/scripts.js"></script>
</body>
</html>