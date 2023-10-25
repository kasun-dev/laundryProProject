<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Existing Customer</title>
<link rel="stylesheet" href="css/ExistingCustomer.css">
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<script type="text/javascript">
        alert("<%=errorMessage%>
        ");
    </script>
	<%
	}
	%>

	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main-container">
			<div class="form-container">

				<div class="sub-container">
					<h6>This customer already exist.</h6>
					<h6>Do you wish to continue?</h6>
				</div>
				<table>
					<c:forEach var="cus" items="${customer}">
						<tr>
							<td>
								<div class="td-container">
									<h1>Full Name :</h1>
								</div>
								<div class="td-container">
									<input type="text" name="name" value="${cus.contactNo}" readonly>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="td-container">
									<h1>Contact Number :</h1>
								</div>
								<div class="td-container">
									<input type="text" name="contact_number" value="${cus.name}" readonly>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="td-container">
									<h1>Address :</h1>
								</div>
								<div class="td-container">
									<input type="text" name="address" value="${cus.address}" readonly>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="button-container">
					<div class="yes-button">
						<button class="button-element">Yes</button>
					</div>
					<div class="no-button">
						<button class="button-element">No</button>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>