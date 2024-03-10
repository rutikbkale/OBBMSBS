package com.helper;

import java.time.LocalDate;
import java.time.Period;

public class AgeCalculator {
    public static int getAge(String dob){
        LocalDate bdate = LocalDate.parse(dob);
        LocalDate cdate = LocalDate.now();
        Period p = Period.between(bdate, cdate);
        int age = p.getYears();
        return age;
    }
}
