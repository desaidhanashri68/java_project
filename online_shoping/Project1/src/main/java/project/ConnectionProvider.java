package project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    public static Connection getCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_shopping?characterEncoding=UTF-8", "root", "root");
            return con;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
