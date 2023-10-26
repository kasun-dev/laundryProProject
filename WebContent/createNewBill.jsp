<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.laundrypro.price.*"%>
<%@ page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">
			<h2>Enter Bill Items</h2>
			<!-- Add item form -->
			<div class="form-container">

				<form name="itemInputForm" class="item-form" method="POST" action="AddItemServlet">
					<div class="inner-form">
						<label>Item Description</label>
						<input type="text" name="desc" placeholder="Enter Item description" required />
						<br />
						<label>Service Type</label>
						<select id="service" name="type" required>
							<option value="dry_clean">Dry Clean</option>
							<option value="bulk">Bulk laundry</option>
						</select>
						<label>Quantity</label>
						<input type="number" name="quantity" min="1" required />
						<label>Unit Price</label>
						<select id="prices" name="unitPrice" required>
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
					</div>
					<br>

					<input type="submit" value="Add Item" class="edit-button button-font-medium" />

				</form>
			</div>

			<!-- Show added items table -->
			<div class="table-responsive">
				<!--show, edit and delete price - BULK -->
				<table border="1">
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

						<!-- display data with edit and delete options -->
						<tr>
							<td>${items.description}</td>
							<td>${items.serviceType}</td>
							<td>${items.quantity}</td>
							<td>${items.unitPrice}</td>
							<td>${items.subTotal}</td>

							<td><form method="post" action="${deleteItem}">
									<input class="delete-button" type="submit" value="delete" />

								</form></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<br />
			<div class="payment-container">
				<div id="a1">Final Amount: ${finalPrice}</div>
				<br>
				<div id="a2">Min Payment: ${minPayment}</div>
			</div>

			<c:url value="/ItemDeleteServlet" var="deleteItem">
				<c:param name="finalPrice" value="${finalPrice}"></c:param>
				<c:param name="minPayment" value="${minPayment}"></c:param>
			</c:url>

			<!-- Payment Amount -->
			<div class="buttons">
				<!-- Checkout button -->
				<form name="checkoutForm" method="post" onsubmit="return validateCheckoutForm()" action="BillCheckoutServlet">
					<div class="inner-form">
						<label>Order Due Date</label>
						<input type="date" name="dueDate" required />
						<br />
						<!--  <input type="date" id="currentDate" name="currentDate" value="" />-->
						<label>Current Date</label>

						<input type="date" id="currentDate" name="currentDate" readonly>
						<br />
						<label>Customer Payment Amount</label>
						<input type="text" inputmode="numeric" name="paidAmount" placeholder="Enter payment amount" required />
						<input type="hidden" inputmode="numeric" name="finalAmount" value="${finalPrice}" />
						<input type="hidden" inputmode="numeric" name="minAmount" value="${minPayment}" />
						<input type="hidden" name="state" value="Confirmed" />
						<br />
					</div>
					<br />
					<div class="right-align">
						<input type="submit" id="checkout" value=Checkout class="edit-button button-font-medium">
					</div>
				</form>

				<!-- Discard items button -->

				<form method="post" action="BillDiscardServlet">
					<input type="submit" id="discard" value="discard" class="delete-button button-font-medium">
				</form>
			</div>

		</main>
	</div>
	<!-- front end validation -->
	<script>
        var date = new Date();

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;

        var today = year + "-" + month + "-" + day;
        document.getElementById("currentDate").value = today;

        function validateCheckoutForm() {
            let famount = document.forms["checkoutForm"]["finalAmount"].value;
            let pamount = document.forms["checkoutForm"]["paidAmount"].value;
            let mamount = document.forms["checkoutForm"]["minAmount"].value;
            if (famount <= 0) {
                alert("Please add atleast 1 item");
                return false;
            }
            if (pamount < mamount) {
                alert("Payment must be greater than minimum payment");
                return false;
            }
        }
    </script>
</body>
</html>
