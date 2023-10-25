<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LaundryPro</title>
<!--css-->
<link rel="stylesheet" href="css/i-styles.css">
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

</head>
<body>
	<div class="home-containter">

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
					<span class="material-symbols-outlined">home</span>Login
				</a>
				
			</div>
		</header>

		<main>
			<div class="form-container">
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
					<div class="search-button">
						<button class="button-element">Search Order</button>
					</div>
				</form>
			</div>
		</main>

	</div>

</body>
</html>