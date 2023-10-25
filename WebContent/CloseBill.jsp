<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Close Order</title>
<link rel="stylesheet" href="css/CloseBill.css">
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main-container">

			<form action="billclose" method="post">
				<div class="card-container">

					<c:forEach var="cus" items="${cusDetails}">

						<div class="cardraw-1">

							<div class="card">
								<div class="card-inner">
									<p class="card-name">Customer Name :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold">${cus.name}</span>
									</p>
								</div>
							</div>

							<div class="card">
								<div class="card-inner">
									<p class="card-name">Contact No :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold">${cus.contactNo}</span>
									</p>
								</div>
							</div>

							<div class="card">
								<div class="card-inner">
									<p class="card-name">Address :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold">${cus.address}</span>
									</p>
								</div>
							</div>

						</div>

					</c:forEach>


					<c:forEach var="order" items="${orderDetails}">

						<div class="cardraw-2">
							<div class="card">
								<div class="card-inner">
									<p class="card-name">Reference No :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold"><input type="text" name="refNo" value="${order.refNo}" readonly></span>
									</p>
								</div>
							</div>

							<div class="card">
								<div class="card-inner">
									<p class="card-name">Final Amount :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold"><input type="text" name="finalAmount" value="${order.finalAmount}" readonly></span>
									</p>
								</div>
							</div>

							<div class="card">
								<div class="card-inner">
									<p class="card-name">Paid Amount :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold"><input type="text" name="paidAmount" value="${order.paidAmount}"></span>
									</p>
								</div>
							</div>

							<div class="card">
								<div class="card-inner">
									<p class="card-name">Bill Date :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold"><input type="text" name="billDate" value="${order.billDate}" readonly></span>
									</p>
								</div>
							</div>

							<div class="card">
								<div class="card-inner">
									<p class="card-name">Due Date :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold"><input type="text" name="dueDate" value="${order.dueDate}" readonly></span>
									</p>
								</div>
							</div>

							<div class="card">
								<div class="card-inner">
									<p class="card-name">State :</p>
								</div>
								<div class="output-container">
									<p class="card-details">
										<span class="font-weight-bold">
										<select name="orderState">
												<option selected>${order.state}</option>
												<option value="Complete">Complete</option>
										</select> </span>
									</p>
								</div>
							</div>

						</div>
					</c:forEach>
				</div>

				<div class="table-container">
					<table>
						<thead>
							<tr>

								<th>Description</th>
								<th>Service Type</th>
								<th>Qty</th>
								<th>Unit Price</th>
								<th>Sub Total</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="items" items="${orderItem}">
								<tr>
									<td>${items.description}</td>
									<td>${items.serviceType}</td>
									<td>${items.quantity}</td>
									<td>${items.unitPrice}</td>
									<td>${items.subTotal}</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
				<div class="buttonraw">

					<div class="update-button">
						<button class="button-element">Close Bill</button>
					</div>
				</div>
			</form>
		</main>
	</div>
</body>
</html>