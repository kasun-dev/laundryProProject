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
			String itemname = request.getParameter("itemname");
			String iprice = request.getParameter("iprice");
			String id = request.getParameter("dcid");
			%>

			<form class="price-form" method="post" action="priceUpdate">

				<input type="hidden" name="type" value="dry_clean">
				<!-- hidden field to help decide which method to execute -->
				<input type="hidden" name="dcid" value="<%=id%>" />

				<label>Item name</label>
				<input type="text" name="iname" value="<%=itemname%>" />
				<br />
				<label>Item price(rs)</label>
				<input type="text" inputmode="numeric" name="iprice" value="<%=iprice%>" />
				<br />
				<input type="submit" value="Update" />
			</form>
		</div>
	</main>
</body>
</html>