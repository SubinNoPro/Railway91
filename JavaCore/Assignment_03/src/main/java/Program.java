import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Program {
    public static void main(String[] args) {
//        Exercise1 exercise1 = new Exercise1();
//        exercise1.question01();
        // Tạo Department
        Department dep1 = new Department();
        dep1.id = 1;
        dep1.name = "Marketing";
        Department dep2 = new Department();
        dep2.id = 2;
        dep2.name = "Sale";
        Department dep3 = new Department();
        dep3.id = 3;
        dep3.name = "BOD";
// Tạo Position
        Position pos1 = new Position();
        pos1.id = 1;
        pos1.name = Position.PositionName.Dev;
        Position pos2 = new Position();
        pos2.id = 2;
        pos2.name = Position.PositionName.Test;
        Position pos3 = new Position();
        pos3.id = 3;
        pos3.name = Position.PositionName.Scrum_Master;
        Position pos4 = new Position();
        pos4.id = 4;
        pos4.name = Position.PositionName.PM;

// Tạo Group
        Group group1 = new Group();
        group1.id = 1;
        group1.name = "Testing System";
        Group group2 = new Group();
        group2.id = 2;
        group2.name = "Development";
        Group group3 = new Group();
        group3.id = 3;
        group3.name = "Sale";
        Group group4 = new Group();
        group4.id = 4;
        group4.name = "Java Group 1";
        Group group5 = new Group();
        group5.id = 5;
        group5.name = "Python Group";
        Group group6 = new Group();
        group6.id = 6;
        group6.name = "Java Group 2";
        Group group7 = new Group();
        group7.id = 7;
        group7.name = "Java Group 3";
        Group group8 = new Group();
        group8.id = 8;
        group8.name = "JavaScript Group";

        List<Group> groups = new ArrayList<>();
        groups.add(group4);
        groups.add(group5);
        groups.add(group6);
        groups.add(group7);
        groups.add(group8);;


// Tạo Account
        Account acc1 = new Account();
        acc1.id = 1;
        acc1.email = "daonq1";
        acc1.userName = "daonq1";
        acc1.fullName = "Dao Nguyen 1";
        acc1.department = dep1;
        acc1.position = pos1;
        acc1.createdDate = LocalDate.now();
        Group[] groupAcc1 = {group1, group2};
        acc1.groups = groupAcc1;

        Account acc2 = new Account();
        acc2.id = 2;
        acc2.email = "daonq2";
        acc2.userName = "daonq2";
        acc2.fullName = "Dao Nguyen 2";
        acc2.department = dep2;
        acc2.position = pos4;
        acc2.createdDate = LocalDate.of(2021, 03, 17);
        acc2.groups = new Group[]{group3, group2};

        Account acc3 = new Account();
        acc3.id = 3;
        acc3.email = "daonq3";
        acc3.userName = "daonq3";
        acc3.fullName = "Dao Nguyen 3";
        acc3.department = dep3;
        acc3.position = pos3;
        acc3.createdDate = LocalDate.now();
/*
        Scanner sc = new Scanner(System.in);
        Account account = new Account();
        System.out.println("Nhập ID: ");
        int id = sc.nextInt();
        account.id = id;
        System.out.println("Nhập Email: ");
        String email = sc.next();
        account.email = email;
        System.out.println("Nhập họ tên: ");
        String name = sc.next();
        sc.nextLine();
        account.fullName = name;
        System.out.println("Mời bạn nhập vị trí: 1: Dev, 2: Test, 3: Master Scrum, 4: PM");
        int posID = sc.nextInt();
        switch (posID){
            case 1:
                System.out.println("ID: " + account.id + "; Email: " + account.email + "; Full name: " + account.fullName + "; Position: " + pos1.name);
                break;
            case 2:
                System.out.println("ID: " + account.id + "; Email: " + account.email + "; Full name: " + account.fullName + "; Position: " + pos4.name);
                break;
            case 3:
                System.out.println("ID: " + account.id + "; Email: " + account.email + "; Full name: " + account.fullName + "; Position: " + pos3.name);
                break;
            case 4:
                System.out.println("ID: " + account.id + "; Email: " + account.email + "; Full name: " + account.fullName + "; Position: " + pos4.name);
                break;
            default:
                System.out.println("ID: " + account.id + "; Email: " + account.email + "; Full name: " + account.fullName + "; Position: None");
                break;
        }*/


        /*System.out.println("Thông tin các Account trên hệ thống:");
        System.out.println("Account 1: ID : " + acc1.id + " Email: " +
                acc1.email + " UserName: " + acc1.userName
                + " FullName: " + acc1.fullName + " Department: " +
                acc1.department.name + " Position: "
                + acc1.position.name + " Group: "+
                acc1.groups[0].name +", "+ acc1.groups[1].name + " CreateDate: " +
                acc1.createdDate);
        System.out.println("Account 2: ID : " + acc2.id + " Email: " +
                acc2.email + " UserName: " + acc2.userName
                + " FullName: " + acc2.fullName + " Department: " +
                acc2.department.name + " Position: "
                + acc2.position.name + " Group: "+
                acc2.groups[0].name +", "+ acc2.groups[1].name + " CreateDate: " +
                acc2.createdDate);
        System.out.println("Account 3: ID : " + acc3.id + " Email: " +
                acc3.email + " UserName: " + acc3.userName
                + " FullName: " + acc3.fullName + " Department: " +
                acc3.department.name + " Position: "
                + acc3.position.name + " Group: " + " CreateDate: " +
                acc3.createdDate);*/

//        System.out.println("Question 15");
//        for (int i = 0; i <= 20; i++){
//            if (i % 2 == 0){
//                System.out.println(i);
//            }
//        }



// Gọi phương thức
        Exercise_4 exercise_4 = new Exercise_4();
        exercise_4.Question_9(groups);
    }
}
