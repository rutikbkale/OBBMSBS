package com.dao;

import com.entities.Admin;
import java.sql.*;

public class AdminDao {

    private Connection con;
    private Admin admin;
    private String query;
    private PreparedStatement psmt;
    private ResultSet set;

    public AdminDao(Connection con) {
        this.con = con;
    }

    // Admin authentication
    public Admin getVerifiedAdmin(String username, String password) {
        try {
            // creating query for authenticate the admin
            query = "select * from admintb where username = ? and password = ?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, username);
            psmt.setString(2, password);
            set = psmt.executeQuery();

            if (set.next()) {
                admin = new Admin();
                admin.setUsername(set.getString("username"));
                admin.setPassword(set.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
}
