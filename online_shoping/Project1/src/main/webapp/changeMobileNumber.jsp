<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change mobile number</title>
</head>
<body>
<%
String msg = request.getParameter("msg"); // Get the confirmation message
%>

<% if ("done".equals(msg)) { %>
<h3 class="confirmation">Your Mobile Number has been successfully changed!</h3>
<% } %>

<% if ("wrong".equals(msg)) { %>
<h3 class="error">Your Password is incorrect. Mobile Number change failed.</h3>
<% } %>

<!-- Rest of your code -->
<form action="changeMobileNumberAction.jsp" method="post">
    <h3>Enter Your New Mobile Number</h3>
    <input type="number" name="mobile" placeholder="Enter your new mobile number" required class="input-style">
    <hr>
    <h3>Enter Password (For Security)</h3>
    <input type="password" name="password" placeholder="Enter password (for security)" required class="input-style">
    <hr>
    <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<!-- End of your code -->
</body>
<br><br><br>
</html>
