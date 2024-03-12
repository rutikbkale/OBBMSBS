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
            query = "insert into blood_donation_list_tb(id,name, bloodgroup, unit, age, disease) values(?,?,?,?,?,?)";

            psmt = con.prepareStatement(query);
            psmt.setInt(1, donation.getId());
            psmt.setString(2, donation.getdName());
            psmt.setString(3, donation.getBloodgroup());
            psmt.setInt(4, donation.getUnit());
            psmt.setInt(5, donation.getAge());
            psmt.setString(6, donation.getDisease());

            if (psmt.executeUpdate() > 0) {
                flag = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
