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

				
			</form>
</body>
</html>