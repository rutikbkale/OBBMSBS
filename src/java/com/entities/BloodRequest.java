package com.entities;

public class BloodRequest {

    private String name;
    private int age;
    private String reason;
    private String bloodgroup;
    private int unit;
    private int patient_id;

    public BloodRequest(String name, int age, String reason, String bloodgroup, int unit, int patient_id) {
        this.name = name;
        this.age = age;
        this.reason = reason;
        this.bloodgroup = bloodgroup;
        this.unit = unit;
        this.patient_id = patient_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
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

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

}
