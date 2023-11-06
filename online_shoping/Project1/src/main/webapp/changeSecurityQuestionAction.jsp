<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
String email = session.getAttribute("email").toString();
String securityquestion = request.getParameter("securityquestion");
String newanswer = request.getParameter("newanswer"); // Corrected the variable name
String password = request.getParameter("password");
int check = 0;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
    while (rs.next()) {
        check = 1;
        st.executeUpdate("update users set securityquestion='" + securityquestion + "', answer='" + newanswer + "' where email='" + email + "'");
        response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
    }
    if(check==0)
    	 response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
   
} catch (Exception e) {
    // Handle exceptions here
    e.printStackTrace();
}
%>
