package com.helper;

import java.sql.*;

public class PreviousReqProvider {

    private static Connection con = null;
    private static Statement smt = null;
    private static String query = null;
    private static ResultSet set = null;
    private static int r = 0;

    public static int isHavingPendingReq(int id) throws SQLException {
        query = "select * from blood_request_list_tb where patient_id = '" + id + "' and status != 'Withdrawal' or status != 'Rejected'";
        con = DBClass.getConnection();
        smt = con.createStatement();
        set = smt.executeQuery(query);
        if (set.next()) {
            r = 1;
        }
        return r;

    }

}
