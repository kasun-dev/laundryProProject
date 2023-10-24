<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--google icons-->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<!--roboto font-->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz@6..12&display=swap" rel="stylesheet">
</head>
<body>
	<!--SideBar-->
	<aside id="sidebar">
		<div class="sidebar-title">
			<div class="sidebar-brand">
				<span class="material-symbols-outlined">point_of_sale</span> LaundryPro
			</div>
			<!--Side Bar menu icon-->
			<span class="material-symbols-outlined" onclick="closeSidebar()">close</span>
		</div>

		<ul class="sidebar-list">

			<li class="sidebar-list-item">
				<a href="javascript:void(0);" onclick="loadContent('createNewBill.jsp')">
					<span class="material-symbols-outlined">add_circle</span>Create New Order
				</a>
			</li>
			<li class="sidebar-list-item">
				<a href="javascript:void(0);" onclick="loadContent('manageOrder.jsp')">
					<span class="material-symbols-outlined">list_alt</span>Manage Order
				</a>
			</li>
			<li class="sidebar-list-item">
				<a href="javascript:void(0);" onclick="loadContent('retrievePrice')">
					<span class="material-symbols-outlined">sell</span>Manage Prices
				</a>
			</li>
			<li class="sidebar-list-item">
				<a href="javascript:void(0);" onclick="loadContent('manageUserAccounts.jsp')">
					<span class="material-symbols-outlined">manage_accounts</span>Manage User Accounts
				</a>
			</li>
		</ul>
	</aside>
	<!--js-->
	<script src="js/scripts.js"></script>
</body>
</html>