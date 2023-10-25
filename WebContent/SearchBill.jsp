<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Track Order</title>
<link rel="stylesheet" href="css/TrackOrder.css">
<link rel="stylesheet" href="css/styles.css">

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
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main-container">
			<form action="billfinalize" method="post" onsubmit="return validateRefNo();">
				<table>
					<tr>
						<td>
							<div class="td-container">
								<h1>Enter Order Reference No</h1>
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

		</main>
	</div>
</body>
</html>