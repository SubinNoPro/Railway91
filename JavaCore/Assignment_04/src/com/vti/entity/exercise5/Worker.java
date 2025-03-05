package com.vti.backtend.exercise5;

public class Worker extends Employee {
    private int level;

    public Worker(String fullName, int age, Gender gender, String address, int level) {
        super(fullName, age, gender, address);
        this.level = level;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
