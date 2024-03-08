package com.dao;

import com.entities.Patient;
import java.sql.*;

public class PatientDao {

    private Connection con;
    private String query;
    private PreparedStatement psmt;
    private ResultSet set;
    private Patient patient;

    public PatientDao(Connection con) {
        this.con = con;
    }

    //patient authentication
    public Patient getVerifiedPatient(String mobno, String password) {

        try {
            // creating query to authenticate patient
            query = "select * from patient_info_tb where mobno = ? and password = ?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, mobno);
            psmt.setString(2, password);
            set = psmt.executeQuery();

            if (set.next()) {
                patient = new Patient();
                patient.setfName(set.getString("fName"));
                patient.setlName(set.getString("lName"));
                patient.setAddress(set.getString("address"));
                patient.setDate(set.getString("dob"));
                patient.setBloodgroup(set.getString("bloodgroup"));
                patient.setMobno(set.getString("mobno"));
                patient.setPassword(set.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patient;

    }

    // inserting patient information into the database
    public boolean insertPatient(Patient patient) {

        boolean flag = false;
        try {
            // creating query to inserting patient
            query = "insert into patient_info_tb(fName, lName, address, dob, bloodgroup, mobno, password) values(?, ?, ?, ?, ?, ?, ?)";

            psmt = con.prepareStatement(query);
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
