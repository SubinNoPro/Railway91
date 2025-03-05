package com.vti.backtend.exercise5;

public class Engineer extends Employee {
    private String major;

    public Engineer(String fullName, int age, Gender gender, String address, String major) {
        super(fullName, age, gender, address);
        this.major = major;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
}
