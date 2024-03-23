package com.helper;

import com.dao.BloodStock;
import java.sql.*;

public class BloodStockUpdater {

    private static int totalUnit = 0;
    private static String query = null;
    private static Connection con = null;
    private static PreparedStatement psmt = null;

    public static int updateStock(String bloodgroup, int unit) throws SQLException {
        con = DBClass.getConnection();
        totalUnit = unit + BloodStock.getUnit(bloodgroup);
        query = "update blood_stock_tb set unit = ? where bloodgroup = ?";
        psmt = con.prepareStatement(query);
        psmt.setInt(1, totalUnit);
        psmt.setString(2, bloodgroup);
        int r = psmt.executeUpdate();
        return r;
    }

    public static int updateStock1(String bloodgroup, int unit) throws SQLException {
        con = DBClass.getConnection();
        totalUnit = BloodStock.getUnit(bloodgroup) - unit;
        if (totalUnit > 0) {
            query = "update blood_stock_tb set unit = ? where bloodgroup = ?";
            psmt = con.prepareStatement(query);
            psmt.setInt(1, totalUnit);
            psmt.setString(2, bloodgroup);
            int r = psmt.executeUpdate();
            return r;
        } else {
            return 0;
        }
    }
}
