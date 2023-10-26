<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billing</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">
			<div id="main-content">
				<div class="image-container">
			        <div class="image-box">
			            <img class="photo" src="img.jpg" alt="Your Photo">
			        </div>
			        <div class="main-billbtn-container">
			            <div class="sub-billbtn-container">
			                <div class="billbtn1">
			                    <a href="ItemListDisplayServlet">
			                        <button class="newbill">Create New Bill</button>
			                    </a>
			                </div>
			                <div class="billbtn2">
			                    <a href="SearchBill.jsp">
			                        <button class="exbill">Close Existing Bill</button>
			                    </a>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		</main>
	</div>
</body>
</html>