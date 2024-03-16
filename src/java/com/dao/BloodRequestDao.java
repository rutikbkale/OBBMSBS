package com.dao;

import com.entities.BloodRequest;
import java.sql.*;

public class BloodRequestDao {

    private Connection con;
    private String colName;
    private String query;
    private PreparedStatement psmt;
    private ResultSet set;

    public BloodRequestDao(Connection con, String colName) {
        this.con = con;
        this.colName = colName;
    }

    public boolean insertBloodReq(BloodRequest request) {

        boolean flag = false;

        try {

            query = "insert into blood_request_list_tb(name, age, reason, bloodgroup, unit, " + colName + ") values(?,?,?,?,?,?)";

            psmt = con.prepareStatement(query);
            psmt.setString(1, request.getName());
            psmt.setInt(2, request.getAge());
            psmt.setString(3, request.getReason());
            psmt.setString(4, request.getBloodgroup());
            psmt.setInt(5, request.getUnit());
            psmt.setInt(6, request.getPatient_id());

            if (psmt.executeUpdate() > 0) {
                flag = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }
}
