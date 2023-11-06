<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%
try {
    Connection con = ConnectionProvider.getCon();
    if (con != null) {
        Statement st = con.createStatement();

        String q1 = "CREATE TABLE users (name VARCHAR(300), email VARCHAR(100) PRIMARY KEY, mobile BIGINT, securityQuestion VARCHAR(100), answer VARCHAR(100), password VARCHAR(100), address VARCHAR(500), city VARCHAR(30), state VARCHAR(100), country VARCHAR(100))"; 
        String q2 = "create table product (id int,name varchar(100),category varchar(200),price int,active varchar(20))";
        String q3 = "create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(200),city varchar(100),state varchar(100),country varchar(100),mobile bigint,orderdate varchar(100),deliverydate varchar(100),paymentmethod varchar(100),transactionid varchar(100),status varchar(10))";
        String q4="create table message(id int AUTO_INCREMENT PRIMARY KEY,email varchar(100),subject varchar(200),body varchar(1000))";
        
        
        System.out.println("Database Connection Established");
        
        System.out.println("Creating table: " + q1);
       st.execute(q1);
        System.out.println("Table 1 created");
        
        System.out.println("Creating table: " + q2);
        st.execute(q2);
        System.out.println("Table 2 created");
        
        System.out.println("Creating table: " + q3);
        st.execute(q3);
        System.out.println("Table 3 created");
        
        
        System.out.println("Creating table: " + q4);
       st.execute(q4);
        System.out.println("Table 4 created");
        con.close();
        System.out.println("Database Connection Closed");
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
