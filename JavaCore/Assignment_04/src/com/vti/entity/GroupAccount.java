package com.vti.entity;

import java.time.LocalDate;

public class GroupAccount {
    private Group group;
    private Account account;
    private LocalDate createdDate;

    public GroupAccount(Group group, Account account, LocalDate createdDate) {
        this.group = group;
        this.account = account;
        this.createdDate = createdDate;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }
}
