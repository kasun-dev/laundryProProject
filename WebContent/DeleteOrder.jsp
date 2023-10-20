<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Order</title>
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

<h1>Are you sure, You want to delete Order Details ?</h1>

<form action="delete" method="post">
	<table>
		<tr>
			<td>Reference Number</td>
			<td><input type="text" name="refNo" value="<%= refNo %>" readonly></td>
		</tr>
		<tr>
			<td>Final Amount</td>
			<td><input type="text" name="finalAmount" value="<%= finalAmount %>"></td>
		</tr>
		<tr>
		<td>Paid Amount</td>
		<td><input type="text" name="paidAmount" value="<%= paidAmount %>"></td>
	</tr>
	<tr>
		<td>Bill Date</td>
		<td><input type="text" name="billDate" value="<%= billDate %>"></td>
	</tr>
	<tr>
		<td>Due Date</td>
		<td><input type="text" name="dueDate" value="<%= dueDate %>"></td>
	</tr>
	<tr>
		<td>Order State</td>
		<td><input type="text" name="orderState" value="<%= orderState %>"></td>
	</tr>		
	</table>
	<br>
	<input type="submit" name="submit" value="Delete">
	</form>
	
</body>
</html>