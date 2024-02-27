package com.dao;

import com.entities.Donar;
import java.sql.*;

public class DonarDao {

    private Connection con;

    public DonarDao(Connection con) {
        this.con = con;
    }

    // inserting donar information into the database
    public boolean insertDonar(Donar donar) {

        boolean flag = false;
        try {
            // creating query to inserting donar
            String query = "insert into donar_info_tb(fName, lName, address, dob, bloodgroup, mobno, password) values(?, ?, ?, ?, ?, ?,?)";

            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, donar.getfName());
            psmt.setString(2, donar.getlName());
            psmt.setString(3, donar.getAddress());
            psmt.setString(4, donar.getDate());
            psmt.setString(5, donar.getBloodgroup());
            psmt.setString(6, donar.getMobno());
            psmt.setString(7, donar.getPassword());

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
