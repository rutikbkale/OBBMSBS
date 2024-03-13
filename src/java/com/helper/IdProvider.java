package com.helper;

import com.entities.Patient;
import com.entities.Donar;
import java.sql.*;

public class IdProvider {

    static private Connection con;
    static private String query;
    static private Statement smt;
    static private ResultSet set;

    public static int getPatientId(Patient patient) throws SQLException {
        int patientId = 0;
        String mobno = patient.getMobno();
        query = "select id from patient_info_tb where mobno ='" + mobno + "'";
        con = DBClass.getConnection();
        smt = con.createStatement();
        set = smt.executeQuery(query);
        if (set.next()) {
            patientId = set.getInt("id");
        }
        return patientId;
    }

    public static int getDonarId(Donar donar) throws SQLException {
        int donatId = 0;
        String mobno = donar.getMobno();
        query = "select id from donar_info_tb where mobno ='" + mobno + "'";
        con = DBClass.getConnection();
        smt = con.createStatement();
        set = smt.executeQuery(query);
        if (set.next()) {
            donatId = set.getInt("id");
        }
        return donatId;
    }

}
