package com.dao;

import com.entities.DonarDonation;
import java.sql.*;

public class DonarDonationDao {

    private Connection con;
    private String query;
    private PreparedStatement psmt;
    private ResultSet set;

    public DonarDonationDao(Connection con) {
        this.con = con;
    }

    public boolean insertDonarDonation(DonarDonation donation) {
        boolean flag = false;
        try {
            query = "insert into blood_donation_list_tb(name, bloodgroup, unit, age, disease,donar_id) values(?,?,?,?,?,?)";

            psmt = con.prepareStatement(query);
            psmt.setString(1, donation.getdName());
            psmt.setString(2, donation.getBloodgroup());
            psmt.setInt(3, donation.getUnit());
            psmt.setInt(4, donation.getAge());
            psmt.setString(5, donation.getDisease());
            psmt.setInt(6, donation.getId());

            if (psmt.executeUpdate() > 0) {
                flag = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
