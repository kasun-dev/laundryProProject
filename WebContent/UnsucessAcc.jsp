<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    /* Style for the message */
    #floating-message {
	      position: fixed;
	      top: 45%;
	      left: 50%;
	      transform: translateX(-50%);
	      background-color: #C70039;
	      color: #fff;
	      padding: 15px;
	      border-radius: 5px;
	      display: none;
    }
  </style>
  <title>Floating Message and Redirect</title>
</head>
<body>
	<body>
	 <div id="floating-message">Action Denied..!</div>

	  <script>
		    function displayFloatingMessageAndRedirect() { 
		      var floatingMessage = document.getElementById('floating-message');
		      floatingMessage.style.display = 'block';
		      setTimeout(function() {
		        window.location.href = 'AccmanagerCtrl';
		      }, 2000); //2 second time out redirection
		    }				 
		    window.onload = displayFloatingMessageAndRedirect;
	  </script>

</body>
</body>
</html>



