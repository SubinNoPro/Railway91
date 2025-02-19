package com.vti.backtend.exercise5;

public class Staff extends Employee {
    private String work;

    public Staff(String fullName, int age, Gender gender, String address, String work) {
        super(fullName, age, gender, address);
        this.work = work;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }
}
