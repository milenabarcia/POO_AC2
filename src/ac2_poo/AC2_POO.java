package ac2_poo;

import java.sql.*;
import java.util.*;

/*
DRIVER: "com.mysql.cj.jdbc.Driver"
URL: "jdbc:mysql://localhost:3306/"
*/

public class AC2_POO {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        DB_Utils.set_connection(
                "com.mysql.cj.jdbc.Driver", 
                "jdbc:mysql://localhost:3306/", 
                "db_upxii", 
                "root", 
                "Jujuba310503++"
        );
        
        DB_Utils.test_connection();
    }
}
