<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LaundryPro</title>
<!--css-->
<link rel="stylesheet" href="css/styles.css">
<!--google icons-->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<!--roboto font-->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz@6..12&display=swap" rel="stylesheet">

<!-- js -->
<script>
	function validateRefNo() {
	    var refNoInput = document.getElementById("refno");
	    var refNo = refNoInput.value;

	    const regex = /^ref\d{9}$/;
	
	    if (!regex.test(refNo)) {

	        alert('Invalid Reference Number. Reference Number Format Is [refXXXXXXXXX]');
	        refNoInput.focus();
	        return false;
	    }
	    return true;
	}
</script>

	<%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
    
    <script type="text/javascript">
        alert("<%= errorMessage %>");
    </script>
    <%
        }
    %>

</head>
<body>
		<!--Header-->
		<header class="header">
			<div class="header-right">
				<!--empty-->
			</div>
			<div class="header-left">
				<a class="navlinks" href="loginpg.jsp">
					<span class="material-symbols-outlined">login</span>Login
				</a>
				<a class="navlinks" href="loginpg.jsp">
					<span class="material-symbols-outlined">home</span>Home
				</a>
				
			</div>
		</header>

		<main class="main">
			<div class="track-order-container">
				<form action="Track" method="post" onsubmit="return validateRefNo();">
					<table>
						<tr>
							<td>
								<div class="td-container">
									<h1>Enter your Reference No</h1>
								</div>
								<div class="td-container">
									<input type="text" name="refno" id="refno" required>
								</div>
							</td>
						</tr>
					</table>
					<div class="track-order-button">
						<button class="track-button">Search Order</button>
					</div>
				</form>
			</div>
		</main>
</body>
</html>