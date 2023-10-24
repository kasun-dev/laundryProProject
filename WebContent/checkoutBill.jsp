<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!--main content-->
	<main class="main">
		<div id="main-content">

			<%
			String desc = request.getParameter("desc");
			String type = request.getParameter("type");
			int qty = Integer.parseInt(request.getParameter("qty"));
			double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
			double subTotal = Double.parseDouble(request.getParameter("subTotal"));
			%>


			<form class="price-form" method="post" action="priceUpdate">

				<!-- state -->
				<input type="hidden" name="status" value="Confirmed">
				<label>Description</label>
				<input type="text" name="desc" value="<%=desc%>" readonly />
				<br />
				<label>Type</label>
				<input type="text" name="type" value="<%=type%>" readonly />
				<br />
				<label>Qty</label>
				<input type="number" value="<%=qty%>" readonly />
				<br />
				<label>Type</label>
				<input type="text" inputmode="numeric" name="unitPrice" value="<%=unitPrice%>" readonly />
				<br />
				<input type="text" inputmode="numeric" name="subTotal" value="<%=subTotal%>" readonly />
				<br />
				<input type="text" inputmode="numeric" name="minPayment" value="<%=minPayment%>" readonly />
				<br />
				<input type="text" inputmode="numeric" name="paidAmount" value="<%=paidAmount%>" readonly />
				<br />
				<input type="submit" value="update" />
			</form>
</body>
</html>