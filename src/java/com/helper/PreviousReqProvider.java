package com.helper;

import java.sql.*;

public class PreviousReqProvider {

    private static Connection con = null;
    private static Statement smt = null;
    private static String query = null;
    private static ResultSet set = null;
    private static int r = 0;

    public static int isHavingPendingReq(int id) throws SQLException {
        query = "select * from blood_request_list_tb where patient_id = '" + id + "' and status != 'Withdrawal' and status != 'Rejected' ORDER BY id DESC LIMIT 1";
        con = DBClass.getConnection();
        smt = con.createStatement();
        set = smt.executeQuery(query);
        r = 0;
        if (set.next()) {
            r = 1;
        }
        return r;
    }

    public static int isHavingPendingReq1(int id) throws SQLException {
        query = "select * from blood_request_list_tb where donar_id = '" + id + "' and status != 'Withdrawal' and status != 'Rejected' ORDER BY id DESC LIMIT 1";
        con = DBClass.getConnection();
        smt = con.createStatement();
        set = smt.executeQuery(query);
        r = 0;
        if (set.next()) {
            r = 1;
        }
        return r;
    }

    public static int isHavingPendingReqDonar(int id) throws SQLException {
        query = "SELECT * FROM blood_donation_list_tb WHERE donar_id =  '" + id + "' AND status != 'Donated' AND status != 'Rejected' ORDER BY id DESC LIMIT 1";
        con = DBClass.getConnection();
        smt = con.createStatement();
        set = smt.executeQuery(query);
        r = 0;
        if (set.next()) {
            r = 1;
        }
        return r;
    }

}
