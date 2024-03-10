package com.helper;

import java.sql.*;

public class DBClass {

    private static Connection con;

    public static Connection getConnection() {

        try {

//            if (con == null) {

                // load the driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                //creating connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/obbms", "root", "1234");

//            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;

    }

}
