package com.dao;

import com.entities.Patient;
import java.sql.*;

public class PatientDao {

    private Connection con;

    public PatientDao(Connection con) {
        this.con = con;
    }

    // inserting patient information into the database
    public boolean insertPatient(Patient patient) {

        boolean flag = false;
        try {
            // creating query to inserting patient
            String query = "insert into patient_info_tb(fName, lName, address, dob, bloodgroup, mobno, password) values(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, patient.getfName());
            psmt.setString(2, patient.getlName());
            psmt.setString(3, patient.getAddress());
            psmt.setString(4, patient.getDate());
            psmt.setString(5, patient.getBloodgroup());
            psmt.setString(6, patient.getMobno());
            psmt.setString(7, patient.getPassword());

            // executing statement
            if (psmt.executeUpdate() > 0) {
                flag = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;

    }

}
