package com.vti.frontend;

import com.vti.entity.Account;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.utils.Utils;

import java.time.LocalDate;

public class Program {
    public static void main(String[] args) {

        // com.vti.entity.Question 01
//        com.vti.entity.Department dep1 = new com.vti.entity.Department(1, "Marketing");
//        com.vti.entity.Department department = new com.vti.entity.Department();

        //com.vti.entity.Question 02
        Position devPosition = new Position(1, Utils.PositionName.Dev);
        Account account = new Account();
        Account account1 = new Account(1, "xaquytoaii@gmail.com", "xaquytoaii", "Xa Quy", "Toai");
        Account account2 = new Account(2, "nguyenvana@gmail.com", "nguyena", "Nguyen Van", "A", devPosition);
        Account account3 = new Account(3, "nguyenvanb@gmai.com", "nguyenb","Nguyen Van", "B", devPosition, LocalDate.of(2025,2,17));

//        account1.displayAccount();

        //com.vti.entity.Question 03
        Account[] accounts = {account1, account2,account3};
        String[] userNames = {"user1", "user2", "user3"};
        Group group = new Group();
        Group group1 = new Group("com.vti.entity.Group 1",account1,accounts,LocalDate.now());
        Group group2 = new Group("com.vti.entity.Group 2", account2, userNames,LocalDate.now());
//        group2.displayGroup();

    }
}
