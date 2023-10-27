<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/styles.css">
<meta charset="ISO-8859-1">
<title>Update Bulk Prices</title>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">

			<div id="main-content">

				<%
				String weight = request.getParameter("weight");
				String price = request.getParameter("kgprice");
				String id = request.getParameter("bid");
				%>


				<form name="updatebulk" class="price-form" method="post" onsubmit="return validateBulkUpdateForm()" action="priceUpdate" >

					<input type="hidden" name="type" value="bulk">
					<!-- hidden field to help decide which method to execute -->
					<input type="hidden" name="bid" value="<%=id%>" />

					<label>Weight(in kilos)</label>
					<input type="text" inputmode="numeric" name="weight" value="<%=weight%>" required/>
					<br />
					<label>Item price(rs)</label>
					<input type="text" inputmode="numeric" name="price" value="<%=price%>" required/>
					<br />
					<input type="submit" value="update" />
				</form>
			</div>
		</main>
	</div>
	<script>
	function validateBulkUpdateForm(){
		 let price = document.forms["updatebulk"]["price"].value;
		 let weight = document.forms["updatebulk"]["weight"].value;
		 
		 if (isNaN(price)) {
        	alert("Please enter a valid price");
            return false;
        }
		 if(price <= 0){
			 alert("Please make sure price is greater than zero");
			 return false;
		 }
		 if (isNaN(weight)) {
	         	alert("Please enter a valid price");
	             return false;
	         }
		 if (weight < 0 ) {
	         	alert("Please enter a valid price");
	             return false;
	         }
	}
	</script>
</body>
</html>