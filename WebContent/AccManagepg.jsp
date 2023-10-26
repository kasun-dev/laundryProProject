<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!--css-->
<link rel="stylesheet" href="css/styles.css">

<meta charset="ISO-8859-1">
<title>AccountManagementpg</title>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">
			<div id="main-content">
				<div class="accmanagerstyle">
					<!--create account -->

					<br>

					<div class="new-account-container">
						<a href="createacc.jsp" class="new-account-link"> Click Here To Create a New Account ! </a>
					</div>
					<h1>User Details</h1>

					<table class="usertable">
						<thead>
							<tr>
								<th>NIC</th>
								<th>Name</th>
								<th>Username</th>
								<th>Password</th>
								<th>Phone Number</th>
								<th>Type</th>
								<th>Edit Account</th>
								<th>Delete Account</th>
							</tr>
						</thead>
						<tbody>


							<c:forEach var="usr" items="${alluserDetails}">

								<c:set var="nic" value="${usr.nic}" />
								<c:set var="name" value="${usr.name}" />
								<c:set var="uname" value="${usr.uname}" />
								<c:set var="pwd" value="${usr.pwd}" />
								<c:set var="phoneNo" value="${usr.phoneNo}" />
								<c:set var="type" value="${usr.type}" />

								<!--this is for the update of the employee user profile data-->
								<!--  -->
								<c:url value="updateprofilelogin.jsp" var="userupdate">
									<c:param name="name" value="${name}" />
									<c:param name="nic" value="${nic}" />
									<c:param name="uname" value="${uname}" />
									<c:param name="pwd" value="${pwd}" />
									<c:param name="phoneNo" value="${phoneNo}" />
								</c:url>

								<!-- this is for the delete profiles of the employee users -->
								<c:url value="deleteAcc.jsp" var="userdelete">
									<c:param name="name" value="${name}" />
									<c:param name="uname" value="${uname}" />
								</c:url>

								<tr>
									<td>${usr.nic}</td>
									<td>${usr.name}</td>
									<td>${usr.uname}</td>
									<td>${usr.pwd}</td>
									<td>${usr.phoneNo}</td>
									<td>${usr.type}</td>
									<td><a href="${userupdate}">
											<input class="edit-button" type="button" name="Update" value="Edit">
										</a></td>
									<td><a href="${userdelete}">
											<input class="delete-button" type="button" name="Delete" value="Delete">
										</a></td>
								</tr>

							</c:forEach>


						</tbody>
					</table>
				</div>
			</div>
		</main>
	</div>

</body>
</html>