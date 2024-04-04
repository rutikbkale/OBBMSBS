package com.dao;

import com.entities.Donar;
import java.sql.*;

public class DonarDao {

    private Connection con;
    private String query;
    private PreparedStatement psmt;
    private ResultSet set;
    private Donar donar;

    public DonarDao(Connection con) {
        this.con = con;
    }

    //donar authentication
    public Donar getVerifiedDonar(String mobno, String password) {

        try {
            // creating query to authenticate donar
            query = "select * from donar_info_tb where mobno = ? and password = ?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, mobno);
            psmt.setString(2, password);
            set = psmt.executeQuery();

            if (set.next()) {
                donar = new Donar();
                donar.setfName(set.getString("fName"));
                donar.setlName(set.getString("lName"));
                donar.setAddress(set.getString("address"));
                donar.setDate(set.getString("dob"));
                donar.setBloodgroup(set.getString("bloodgroup"));
                donar.setMobno(set.getString("mobno"));
                donar.setPassword(set.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return donar;
    }

    // inserting donar information into the database
    public int insertDonar(Donar donar) {

        int flag = 0;
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
                flag = 1;
            }

        } catch (SQLException e) {
            if (e.getSQLState().equals("23000")) {
                System.out.println("Mobile number already registered. Please login.");
                flag = -1;
            }
        }
        return flag;

    }

    // updating donar information into the database
    public int updateDonar(Donar donar, int id) {
        try (PreparedStatement psmt = con.prepareStatement("UPDATE donar_info_tb SET fName=?, lName=?, address=?, bloodgroup=? WHERE id=?")) {
            psmt.setString(1, donar.getfName());
            psmt.setString(2, donar.getlName());
            psmt.setString(3, donar.getAddress());
            psmt.setString(4, donar.getBloodgroup());
            psmt.setInt(5, id);

            int rowsUpdated = psmt.executeUpdate();
            return rowsUpdated;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

}
