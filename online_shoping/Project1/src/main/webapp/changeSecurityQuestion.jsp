<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
  <%} %>
 <hr>
 
 <form action="changeSecurityQuestionAction.jsp" method="post">
 <h3>Select Your New Securtiy Question</h3>
 <select class="input-style" name="securityquestion">
 <option value="What was your first car?">What was your first car?</option>
  <option value="What is the name of your pet?">What is the name of your pet?</option>
   <option value="What elementry school did you attend?">What elementry school did you attend?</option>
    <option value="what name of town where you born?">what name of town where you born?</option>
 
 </select>
 
 <h3>Enter Your New Answer</h3>
 <input type="text" name="newanswer" placeholder="Enter your new Answer" required class="input-style">
 
<hr>
<h3>Enter Password (For Security)</h3>
<input type="password" name="password" placeholder="Enter password(for security)" required class="input-style">
<hr>
 <button class="button" type="submit">save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>