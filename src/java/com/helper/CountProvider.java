package com.helper;

import java.sql.*;

public class CountProvider {
    
    private static Connection con;
    private static PreparedStatement psmt;
    private static Statement smt;
    private static ResultSet set;
    private static String query;
    
    public static int getCount(String tableName, String colName) throws SQLException {
        int count = 0;
        
        query = "select count(" + colName + ") from " + tableName;
        con = DBClass.getConnection();
        smt = con.createStatement();
        set = smt.executeQuery(query);
        if (set.next()) {
            count = set.getInt(1);
        }
        
        return count;
    }

    public static int getTotalCount(String tableName, String colName, String colName1, int id) throws SQLException {
        int count = 0;
        
        query = "select count(" + colName + ") from " + tableName + " where " + colName1 + " = ?";
        con = DBClass.getConnection();
        psmt = con.prepareStatement(query);
        psmt.setInt(1, id);
        set = psmt.executeQuery();
        if (set.next()) {
            count = set.getInt(1);
        }
        
        return count;
    }
    
    public static int getCondCount(String tableName, String colName, String condition, String colName1, int id) throws SQLException {
        int count = 0;
        
        query = "select count(" + colName + ") from " + tableName + " where status = ? && " + colName1 + " = ?";
        con = DBClass.getConnection();
        psmt = con.prepareStatement(query);
        psmt.setString(1, condition);
        psmt.setInt(2, id);
        set = psmt.executeQuery();
        if (set.next()) {
            count = set.getInt(1);
        }
//        query = "SELECT COUNT(" + colName + ") FROM " + tableName + " WHERE status = ?";
//        con = DBClass.getConnection();
//
//        psmt = con.prepareStatement(query);
//        psmt.setString(1, condition);  // Set the value for the condition placeholder
//        set = psmt.executeQuery();  // Execute the query without passing the query string
//
//        if (set.next()) {
//            count = set.getInt(1);
//        }

        return count;
    }
}
