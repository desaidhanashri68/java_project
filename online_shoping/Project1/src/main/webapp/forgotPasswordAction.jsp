<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");
int check = 0;

try {
    Connection con = ConnectionProvider.getCon();
    if (con != null) {
        String query = "SELECT * FROM users WHERE email=? AND mobile=? AND securityQuestion=? AND answer=?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, email);
        stmt.setString(2, mobile);
        stmt.setString(3, securityQuestion);
        stmt.setString(4, answer);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            check = 1;
            String updateQuery = "UPDATE users SET password=? WHERE email=?";
            PreparedStatement updateStmt = con.prepareStatement(updateQuery);
            updateStmt.setString(1, newPassword);
            updateStmt.setString(2, email);
            updateStmt.executeUpdate();
            response.sendRedirect("forgotPassword.jsp?msg=done");
        }
        
        if (check == 0) {
            response.sendRedirect("forgotPassword.jsp?msg=invalid");
        }
    } else {
        System.out.print("Failed to establish a database connection");
    }
} catch (SQLException e) {
    e.printStackTrace();
    System.out.print("SQL error: " + e.getMessage());
} catch (Exception e) {
    e.printStackTrace();
    System.out.print("An unexpected error occurred: " + e.getMessage());
}
%>
