<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Existing Customer</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <%
    String errorMessage = (String) request.getAttribute("errorMessage");
    String refno = (String) request.getAttribute("refno");

    if (errorMessage != null) {
    %>
    <script type="text/javascript">
        alert("<%=errorMessage%>");
    </script>
    <%
    }
    %>

    <div class="container">
        <jsp:include page="header.jsp" />
        <jsp:include page="aside.jsp" />
        <!-- main content -->
        <main class="main">
            <div class="main-container-ex-cus">
                <div class="form-container">
                    <h1>This customer already exists.<br>Do you wish to continue?</h1>
                    <table>
                        <c:forEach var="cus" items="${customer}">
                            <tr>
                                <td>
                                    <div class="td-container">
                                        <h1>Contact Number :</h1>
                                    </div>
                                    <div class="td-container">
                                        <input type="text" name="name" value="${cus.contactNo}" readonly>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="td-container">
                                        <h1>Full Name :</h1>
                                    </div>
                                    <div class="td-container">
                                        <input type="text" name="contact_number" id="fullname" value="${cus.name}" readonly>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="td-container">
                                        <h1>Address :</h1>
                                    </div>
                                    <div class="td-container">
                                        <input type="text" name="address" id="address" value="${cus.address}" readonly>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="button-container">
                        <div class="yes-button">
                            <form action="InsertExtCustToBill" method="post">
                                <input type="hidden" value="continue" name="action" />
                                <input type="hidden" name="refno" value="${refno}" />
                                <c:forEach var="cus" items="${customer}">
                                    <input type="hidden" name="contactno" value="${cus.contactNo}" />
                                </c:forEach>
                                <button class="button-element">Yes</button>
                            </form>
                        </div>
                        <div class="no-button">
                            <form action="InsertExtCustToBill" method="post">
                                <input type="hidden" value="back" name="action" />
                                <input type="hidden" name="refno" value="${refno}" />
                                <button class="button-element">No</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
