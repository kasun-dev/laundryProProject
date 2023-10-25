<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Order</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/DeleteOrder.css">
</head>
<body>

	<%
	String refNo = request.getParameter("refNo");
	String finalAmount = request.getParameter("finalAmount");
	String paidAmount = request.getParameter("paidAmount");
	String billDate = request.getParameter("billDate");
	String dueDate = request.getParameter("dueDate");
	String orderState = request.getParameter("orderState");
	%>

	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main-container">


			<h1>Are you sure, You want to delete Order Details ?</h1>
			<div class="form-container">
				<form action="delete" method="post">
					<table>
						<tr>
							<td>Reference Number</td>
							<td><input type="text" name="refNo" value="<%=refNo%>" readonly></td>
						</tr>
						<tr>
							<td>Final Amount</td>
							<td><input type="text" name="finalAmount" value="<%=finalAmount%>" readonly></td>
						</tr>
						<tr>
							<td>Paid Amount</td>
							<td><input type="text" name="paidAmount" value="<%=paidAmount%>" readonly></td>
						</tr>
						<tr>
							<td>Bill Date</td>
							<td><input type="text" name="billDate" value="<%=billDate%>" readonly></td>
						</tr>
						<tr>
							<td>Due Date</td>
							<td><input type="text" name="dueDate" value="<%=dueDate%>" readonly></td>
						</tr>
						<tr>
							<td>Order State</td>
							<td><input type="text" name="orderState" value="<%=orderState%>" readonly></td>
						</tr>
					</table>
					<div class="delete-button">
						<button class="button-element">Delete Order</button>
					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>
