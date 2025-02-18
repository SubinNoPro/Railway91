package com.vti.entity;

import java.time.LocalDate;

public class Group {
    private int id;
    private String name;
    private Account creator;
    private Account[] accounts;
    private LocalDate createdDate;

    public Group() {
    }

    public Group(String name, Account creator, Account[] accounts, LocalDate createdDate) {
        this.name = name;
        this.creator = creator;
        this.accounts = accounts;
        this.createdDate = createdDate;
    }

    public Group(String name, Account creator, String[] userNames, LocalDate createdDate) {
        this.name = name;
        this.creator = creator;
        this.accounts = new Account[userNames.length];
        for (int i = 0; i < userNames.length; i++){
            this.accounts[i] = new Account(i+1,null, userNames[i],null,null,null,null);
        }
        this.createdDate = createdDate;
    }

    public void displayGroup(){
        System.out.println("com.vti.entity.Group name: " + name);
        System.out.println("Creator: " + (creator != null? creator.fullName : "Chưa có"));
        System.out.println("Created Date: " + createdDate);
        System.out.println("Members:");
        for (Account acc : accounts) {
            System.out.println(" - " + acc.userName);
        }
    }
}
