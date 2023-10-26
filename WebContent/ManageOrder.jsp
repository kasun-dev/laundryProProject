<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Order</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">

			<table>

				<tr>
					<th>Order ID</th>
					<th>Final Amount</th>
					<th>Paid Amount</th>
					<th>Bill Date</th>
					<th>Due Date</th>
					<th>Order State</th>
					<th>Edit Order</th>
					<th>Delete Order</th>
				</tr>


				<c:forEach var="order" items="${orderDetails}">
					<c:set var="refno" value="${order.refNo}" />
					<c:set var="finalamount" value="${order.finalAmount}" />
					<c:set var="paidamount" value="${order.paidAmount}" />
					<c:set var="billdate" value="${order.billDate}" />
					<c:set var="duedate" value="${order.dueDate}" />
					<c:set var="state" value="${order.state}" />
					<tr>
						<td>${order.refNo}</td>
						<td>${order.finalAmount}</td>
						<td>${order.paidAmount}</td>
						<td>${order.billDate}</td>
						<td>${order.dueDate}</td>
						<td>${order.state}</td>

						<c:url value="UpdateOrder.jsp" var="updateorder">
							<c:param name="refNo" value="${refno}" />
							<c:param name="finalAmount" value="${finalamount}" />
							<c:param name="paidAmount" value="${paidamount}" />
							<c:param name="billDate" value="${billdate}" />
							<c:param name="dueDate" value="${duedate}" />
							<c:param name="orderState" value="${state}" />
						</c:url>
						<c:url value="DeleteOrder.jsp" var="deleteorder">
							<c:param name="refNo" value="${refno}" />
							<c:param name="finalAmount" value="${finalamount}" />
							<c:param name="paidAmount" value="${paidamount}" />
							<c:param name="billDate" value="${billdate}" />
							<c:param name="dueDate" value="${duedate}" />
							<c:param name="orderState" value="${state}" />
						</c:url>
						<td>

							<div class="edit-btn">
								<a href="${updateorder}">
									<button class="edit-button">Edit</button>
								</a>
							</div>
						</td>
						<td>
							<div class="remove-btn">
								<a href="${deleteorder}">
									<button class="delete-button">Delete</button>
								</a>
							</div>

						</td>
					</tr>
				</c:forEach>

			</table>

		</main>
	</div>
</body>
</html>