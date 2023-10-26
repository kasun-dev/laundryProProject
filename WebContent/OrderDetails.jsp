<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/styles.css">
<!--google icons-->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<!--roboto font-->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz@6..12&display=swap" rel="stylesheet">

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


	<main class="main">
		<c:forEach var="to" items="${trackOrder}">
			<div class="order-details-card-container">
				<div class="OrderDetailsCardRaw-1">

					<div class="OrderDetailsCard">
						<div class="OrderDetailsCard-inner">
							<p class="card-name">Customer Name :</p>
						</div>
						<div class="output-container">
							<p class="card-details">
								<span class="font-weight-bold">${to.name}</span>
							</p>
						</div>
					</div>

					<div class="OrderDetailsCard">
						<div class="OrderDetailsCard-inner">
							<p class="card-name">Contact No :</p>
						</div>
						<div class="output-container">
							<p class="card-details">
								<span class="font-weight-bold">${to.contactNo}</span>
							</p>
						</div>
					</div>

					<div class="OrderDetailsCard">
						<div class="OrderDetailsCard-inner">
							<p class="card-name">Address :</p>
						</div>
						<div class="output-container">
							<p class="card-details">
								<span class="font-weight-bold">${to.address}</span>
							</p>
						</div>
					</div>

				</div>
			</div>

			<div class="OrderDetailsCardRaw-2">

				<div class="OrderDetailsCard">
					<div class="OrderDetailsCard-inner">
						<p class="card-name">Reference No :</p>
					</div>
					<div class="output-container">
						<p class="card-details">
							<span class="font-weight-bold">${to.refNo}</span>
						</p>
					</div>
				</div>

				<div class="OrderDetailsCard">
					<div class="OrderDetailsCard-inner">
						<p class="card-name">State :</p>
					</div>
					<div class="output-container">
						<p class="card-details" id="state-color">
							<span class="font-weight-bold">${to.state}</span>
						</p>
					</div>
				</div>

				<div class="OrderDetailsCard">
					<div class="OrderDetailsCard-inner">
						<p class="card-name">Bill Date :</p>
					</div>
					<div class="output-container">
						<p class="card-details">
							<span class="font-weight-bold">${to.billDate}</span>
						</p>
					</div>
				</div>

			</div>

			<div class="OrderDetailsCardRaw-3">

				<div class="OrderDetailsCard">
					<div class="OrderDetailsCard-inner">
						<p class="card-name">Due Date :</p>
					</div>
					<div class="output-container">
						<p class="card-details">
							<span class="font-weight-bold">${to.dueDate}</span>
						</p>
					</div>
				</div>

				<div class="OrderDetailsCard">
					<div class="OrderDetailsCard-inner">
						<p class="card-name">Final Amount :</p>
					</div>
					<div class="output-container">
						<p class="card-details">
							<span class="font-weight-bold">Rs. ${to.finalAmount}</span>
						</p>
					</div>
				</div>

				<div class="OrderDetailsCard">
					<div class="OrderDetailsCard-inner">
						<p class="card-name">Paid Amount :</p>
					</div>
					<div class="output-container">
						<p class="card-details">
							<span class="font-weight-bold">Rs. ${to.paidAmount}</span>
						</p>
					</div>
				</div>

			</div>
		</c:forEach>
	</main>
</body>
</html>