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
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">
			<div class="track-order-container">
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
					<div class="track-order-button">
						<button class="track-button">Search Order</button>
					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>