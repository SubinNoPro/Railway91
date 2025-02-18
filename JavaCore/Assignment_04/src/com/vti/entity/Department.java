package com.vti.entity;

public class Department {
    private int id;
    private String name;

    public Department(){
        System.out.println("com.vti.entity.Department constructor");
    }

    public Department(String nameDepartment){
        this.id = 0;
        this.name = nameDepartment;
    }
}
