package com.dao;

import com.helper.DBClass;
import java.sql.*;

public class BloodStock {

    static Connection con = DBClass.getConnection();
    static String query;
    static Statement smt;
    static ResultSet set;
    static int unit = 0;

    public static int getUnit(String bloodgroup) throws SQLException {
        query = "select unit from blood_stock_tb where bloodgroup ='" + bloodgroup + "'";
        smt = con.createStatement();
        set = smt.executeQuery(query);
        if (set.next()) {
            unit = set.getInt("unit");
        }
        return unit;
    }

    public static int getTotalUnit() throws SQLException {

        int total_unit = BloodStock.getUnit("A+") + BloodStock.getUnit("A-") + BloodStock.getUnit("B+") + BloodStock.getUnit("B-") + BloodStock.getUnit("AB+") + BloodStock.getUnit("AB-") + BloodStock.getUnit("O+") + BloodStock.getUnit("O-");
        return total_unit;
    }
}
