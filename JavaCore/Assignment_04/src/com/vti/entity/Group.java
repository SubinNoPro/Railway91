package com.vti.entity;

import java.time.LocalDate;

public class Group {
    private int groupId;
    private String groupName;
    private Account creator;
    private Account[] accounts;
    private LocalDate createdDate;

    public Group() {
    }

    public Group(String groupName, Account creator, Account[] accounts, LocalDate createdDate) {
        this.groupName = groupName;
        this.creator = creator;
        this.accounts = accounts;
        this.createdDate = createdDate;
    }

    public Group(String groupName, Account creator, String[] userNames, LocalDate createdDate) {
        this.groupName = groupName;
        this.creator = creator;
        this.accounts = new Account[userNames.length];
        for (int i = 0; i < userNames.length; i++){
            this.accounts[i] = new Account(i+1,null, userNames[i],null,null,null,null);
        }
        this.createdDate = createdDate;
    }

    public void displayGroup(){
        System.out.println("com.vti.entity.Group groupName: " + groupName);
        System.out.println("Creator: " + (creator != null? creator.getFullName() : "Chưa có"));
        System.out.println("Created Date: " + createdDate);
        System.out.println("Members:");
        for (Account acc : accounts) {
            System.out.println(" - " + acc.getUserName());
        }
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Account getCreator() {
        return creator;
    }

    public void setCreator(Account creator) {
        this.creator = creator;
    }

    public Account[] getAccounts() {
        return accounts;
    }

    public void setAccounts(Account[] accounts) {
        this.accounts = accounts;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }
}
