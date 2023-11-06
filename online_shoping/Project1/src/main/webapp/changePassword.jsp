<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="css/changeDetails.css">
    <title>Change Password</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if ("notMatch".equals(msg)) {
%>
    <h3 class="alert">New password and Confirm password do not match!</h3>
<% }
else if ("wrong".equals(msg)) {
%>
    <h3 class="alert">Your old Password is wrong!</h3>
<% }
else if ("done".equals(msg)) {
%>
    <h3 class="alert">Password change successfully!</h3>
<% }
else if ("invalid".equals(msg)) {
%>
    <h3 class="alert">Something went wrong! Try again!</h3>
<% }
%>
<form action="changePasswordAction.jsp" method="post">
    <h3>Enter Old Password</h3>
    <input class="input-style" type="password" name="oldPassword" placeholder="Enter old password" required>
    <hr>
    <h3>Enter New Password</h3>
    <input class="input-style" type="password" name="newPassword" placeholder="Enter new password" required>
    <hr>
    <h3>Enter Confirm Password</h3>
    <input class="input-style" type="password" name="confirmPassword" placeholder="Enter confirm password" required>
    <hr>
    <button class="button" type="submit">Save <i class="far fa-arrow-alt-circle-right"></i></button>
</form>
</body>
<br><br><br>
</html>
