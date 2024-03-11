package com.entities;

public class DonarDonation {

    private String dName;
    private String bloodgroup;
    private int unit;
    private int age;
    private String disease;
    private String status;

    public DonarDonation(String dName, String bloodgroup, int unit, int age, String disease) {
        this.dName = dName;
        this.bloodgroup = bloodgroup;
        this.unit = unit;
        this.age = age;
        this.disease = disease;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(String bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
