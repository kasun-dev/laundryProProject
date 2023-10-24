<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.laundrypro.price.*"%>
<%@ page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="css/style_main.css" />
</head>
<body>
	<div id="main-content">
		<div class="heading">
			Create New Bill <br />
		</div>
		<!-- Add item form -->
		<div class="form-container">
			<form class="item-form" method="POST" action="AddItemServlet">
				<label>Item Description</label>
				<input type="text" name="desc" placeholder="Enter Item description" />
				<br />
				<label>Service Type</label>
				<select id="service" name="type">
					<option value="dry_clean">Dry Clean</option>
					<option value="bulk">Bulk laundry</option>
				</select>
				<label>Quantity</label>
				<input type="number" name="quantity" />
				<label>Unit Price</label>
				<select id="prices" name="unitPrice">
					<optgroup label="Bulk Prices"></optgroup>
					<%
					ArrayList<BulkPrice> price1 = PriceUtil.getBulkPriceList();
					ArrayList<DryCleanPrice> price2 = PriceUtil.getDryCleanPriceList();

					for (BulkPrice entry : price1) {
					%>
					<option value="<%=entry.getPrice()%>">
						<%=entry.getWeight()%> kg =
						<%=entry.getPrice()%></option>

					<%
					}
					%>
					<optgroup label="Dry Cleaning Prices"></optgroup>
					<%
					for (DryCleanPrice entry : price2) {
					%>
					<option value="<%=entry.getPrice()%>">
						<%=entry.getItemname()%> =
						<%=entry.getPrice()%></option>

					<%
					}
					%>
				</select> <br />

				<input type="submit" value="Add Item" />
			</form>
		</div>

		<!-- Show added items table -->
		<div class="item-table">
			<!--show, edit and delete price - BULK -->
			<table border="1" cellpadding="5px">
				<caption>Bill items</caption>

				<tr>
					<th>Description</th>
					<th>Service Type</th>
					<th>Qty</th>
					<th>Unit Price</th>
					<th>Sub Total</th>
					<th>Delete</th>
				</tr>

				<!--  Iterate over retrieved array list -->
				<c:forEach var="items" items="${itemList}">

					<!-- Save items to variables -->
					<c:set var="desc" value="${items.description}" />
					<c:set var="type" value="${items.serviceType}" />
					<c:set var="qty" value="${items.quantity}" />
					<c:set var="unitPrice" value="${items.unitPrice}" />
					<c:set var="subTotal" value="${items.subTotal}" />

					<!-- forward data as parameters for update -->

					<c:url value="/ItemDeleteServlet" var="deleteItem">
						<c:param name="desc" value="${desc}"></c:param>
						<c:param name="type" value="${type}"></c:param>
						<c:param name="qty" value="${qty}"></c:param>
						<c:param name="unitPrice" value="${unitPrice}"></c:param>
						<c:param name="subTotal" value="${subTotal}"></c:param>
					</c:url>

					<c:url value="/ItemDeleteServlet" var="deleteItem">
						<c:param name="desc" value="${desc}"></c:param>
						<c:param name="type" value="${type}"></c:param>
						<c:param name="qty" value="${qty}"></c:param>
						<c:param name="unitPrice" value="${unitPrice}"></c:param>
						<c:param name="subTotal" value="${subTotal}"></c:param>
					</c:url>

					<!-- display data with edit and delete options -->
					<tr>
						<td>${items.description}</td>
						<td>${items.serviceType}</td>
						<td>${items.quantity}</td>
						<td>${items.unitPrice}</td>
						<td>${items.subTotal}</td>

						<td><form method="post" action="${deleteItem}">
								<input type="submit" value="delete" />

							</form></td>
					</tr>
				</c:forEach>
			</table>
		</div>


		<div class="payment-container">
			Final Amount: ${finalPrice} <br> Min Payment: ${minPayment}
		</div>
		
		<c:url value="/ItemDeleteServlet" var="deleteItem">
			<c:param name="finalPrice" value="${finalPrice}"></c:param>
			<c:param name="minPayment" value="${minPayment}"></c:param>
		</c:url>

		<!-- Payment Amount -->
		<div class="buttons">
			<!-- Checkout button -->
			<form method="post" action="">
				<input type="button" id="checkout" value="checkout">



			</form>
			<!-- Discard items button -->
			<form method="post" action="">
				<input type="button" id="discard" value="discard">
			</form>

		</div>
	</div>
</body>
</html>
