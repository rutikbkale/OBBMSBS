package com.entities;

public class Patient {

    private int id;
    private String fName;
    private String lName;
    private String address;
    private String date;
    private String bloodgroup;
    private String mobno;
    private String password;

    // default constructor
    public Patient() {
    }

    // parameterized constructor
    public Patient(String fName, String lName, String address, String date, String bloodgroup, String mobno, String password) {
        this.fName = fName;
        this.lName = lName;
        this.address = address;
        this.date = date;
        this.bloodgroup = bloodgroup;
        this.mobno = mobno;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    // getters & setters
    public void setId(int id) {
        this.id = id;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(String bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    public String getMobno() {
        return mobno;
    }

    public void setMobno(String mobno) {
        this.mobno = mobno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
