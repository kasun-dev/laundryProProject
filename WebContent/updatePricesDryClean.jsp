<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/styles.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main-container">

			<div id="main-content">

				<%
				String itemname = request.getParameter("itemname");
				String iprice = request.getParameter("iprice");
				String id = request.getParameter("dcid");
				%>

				<form name="dcprice" class="price-form" method="post" onsubmit="return validateDcPriceUpdateForm()" action="priceUpdate" >

					<input type="hidden" name="type" value="dry_clean">
					<!-- hidden field to help decide which method to execute -->
					<input type="hidden" name="dcid" value="<%=id%>" />

					<label>Item name</label>
					<input type="text" name="iname" value="<%=itemname%>" required/>
					<br />
					<label>Item price(rs)</label>
					<input type="text" inputmode="numeric" name="iprice" value="<%=iprice%>" required/>
					<br />
					<input type="submit" value="Update" />
				</form>
			</div>
		</main>
	</div>
	<script>
	function validateDcPriceUpdateForm(){
		 let iprice = document.forms["dcprice"]["iprice"].value;
		 
		 if (isNaN(iprice)) {
       	alert("Please enter a valid price");
           return false;
       }
		 if(iprice <= 0){
			 alert("Please make sure price is greater than zero");
			 return false;
		 }
	}
	</script>
</body>
</html>