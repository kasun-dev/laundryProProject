<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Order</title>
<link rel="stylesheet" href="css/UpdateOrder.css">
<link rel="stylesheet" href="css/styles.css">
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
			<div class="form-container">
				<form action="update" method="post">
					<table>
						<tr>
							<td>Reference Number</td>
							<td><input type="text" name="refNo" value="<%=refNo%>" readonly></td>
						</tr>
						<tr>
							<td>Final Amount</td>
							<td><input type="text" name="finalAmount" value="<%=finalAmount%>"></td>
						</tr>
						<tr>
							<td>Paid Amount</td>
							<td><input type="text" name="paidAmount" value="<%=paidAmount%>"></td>
						</tr>
						<tr>
							<td>Bill Date</td>
							<td><input type="text" name="billDate" value="<%=billDate%>"></td>
						</tr>
						<tr>
							<td>Due Date</td>
							<td><input type="date" name="dueDate" value="<%=dueDate%>"></td>
						</tr>
						<tr>
							<td>Order State</td>
							<td><select name="orderState">
									<option selected><%=orderState%></option>
									<option value="Confirmed">Confirmed</option>
									<option value="Processing">Processing</option>
									<option value="Ready">Ready</option>
									<option value="Complete">Complete</option>
									<option value="Hold">Hold</option>
							</select></td>
						</tr>
					</table>
					<div class="update-button">
						<button class="button-element">Update Order</button>
					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>