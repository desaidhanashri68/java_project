<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%
String email = session.getAttribute("email").toString();
String mobile = request.getParameter("mobile");
String password = request.getParameter("password");

int check = 0;
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    con = ConnectionProvider.getCon();
    st = con.createStatement();
    rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");

    if (rs.next()) {
        check = 1;
        // Close the ResultSet to release resources before executing the update
        rs.close();

        st.executeUpdate("update users set mobile='" + mobile + "' where email='" + email + "'");
        response.sendRedirect("changeMobileNumber.jsp?msg=done");
    } else {
        response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
    }
} catch (Exception e) {
    System.out.println(e);
} finally {
    // Close the ResultSet, Statement, and Connection in a finally block to ensure resources are released
    try {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        System.out.println(e);
    }
}
%>
