package com.dao;

import com.entities.PatientRequest;
import java.sql.*;

public class PatientRequestDao {

    private Connection con;
    private String query;
    private PreparedStatement psmt;
    private ResultSet set;

    public PatientRequestDao(Connection con) {
        this.con = con;
    }

    public boolean insertPatientReq(PatientRequest request) {

        boolean flag = false;

        try {

            query = "insert into blood_request_list_tb(name, age, reason, bloodgroup, unit, patient_id) values(?,?,?,?,?,?)";

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
