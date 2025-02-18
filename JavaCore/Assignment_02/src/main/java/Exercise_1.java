public class Exercise_1 {
    public void checkAccount(Department accDepartment) {
        System.out.println("Question 01");
        if (accDepartment == null) {
            System.out.println("Nhân viên này chưa có phòng ban");
        } else {
            System.out.println("Phòng ban của nhân viên này là: " + accDepartment.name);
        }
    }

    public void checkAccGroup(Group[] accGroup) {
        System.out.println("Question 02");
        if (accGroup == null) {
            System.out.println("Nhân viên này chưa có group");
        } else {
            int countGroup = accGroup.length;
            if (countGroup == 1 || countGroup == 2) {
                System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
            } else if (countGroup == 3) {
                System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
            } else {
                System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
            }
        }
    }

    public void checkByTernary(Department accDepartment) {
        System.out.println("Question 03");
        System.out.println(accDepartment == null ? "Nhân viên này chưa cso phòng ban" : "Phòng ban của nhân viên này là " + accDepartment.name);
    }

    public void checkPosition(Account account) {
        System.out.println("Question 04");
        System.out.println(account.position.name.toString() == "Dev" ? "Đây là developer" : "Đây không phải developer");
    }

    public void getCountAccount(Group group){
        System.out.println("Question 05");
        if (group.accounts == null){
            System.out.println("Nhóm chưa có thành viên nào");
        }else {
            int countAccount = group .accounts.length;
            switch (countAccount) {
                case 1:
                    System.out.println("Nhóm có một nhân viên");
                    break;
                case 2:
                    System.out.println("Nhóm có hai nhân viên");
                    break;
                case 3:
                    System.out.println("Mhóm có ba nhân viên");
                    break;
                default:
                    System.out.println("Nhóm có nhiều nhân viên");
                    break;
            }
        }
    }

    public void Question06(Account account){
        if (account.groups == null || account.groups.length == 0){
            System.out.println("Nhân viên này chưa có group");
        }else {
            switch (account.groups.length){
                case 1:
                    System.out.println("Group của nhân viên này là Java Fresher");
                    break;
                case 2:
                    System.out.println("Group của nhân viên nay là C# Fresher");
                    break;
                case 3:
                    System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
                    break;
                default:
                    System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
                    break;
            }
        }
    }

    public void Question07(Account account){
        String positionName = account.position.name.toString();
        switch (positionName){
            case "Dev":
                System.out.println("Đây là Developer");
                break;
            default:
                System.out.println("Đây không phải developer");
                break;
        }
    }

    public void Question08(Account accounts){
        Account[] accountArr = {accounts};
        for (Account account : accountArr){
            System.out.println("Account ID: " + account.id +
                    " Email: " + account.email + " Name: " + account.fullName);
        }

    }

    public void Question09(Department departments){
        Department[] departmentArr = {departments};
        for (Department department : departmentArr){
            System.out.println("DepartmentID: " + department.id + "; Department name: " + department.name);
        }
    }

    public void Question10(Account account){
        Account[] accounts = {account};
        for (int i = 0; i <accounts.length; i++){
            System.out.println("Thông tin account thứ " + (i+1) + " là:");
            System.out.println("Email: " + accounts[i].email);
            System.out.println("Full Name: " + accounts[i].fullName);
            System.out.println("Phòng ban: " + accounts[i].department);
            System.out.println("---------------------------------------");
        }
    }

    public void Question11(Department department){
        Department[] departments = {department};
        for (int i = 0; i < departments.length; i++){
            System.out.println("ID: " + departments[i].id);
            System.out.println("Name: " + departments[i].name);
        }
    }

    public void Question12(Department department){
        Department[] departments = {department};
        for (int i = 0; i < 2; i++){
            System.out.println("ID: " + departments[i].id);
            System.out.println("Name: " + departments[i].name);
        }
    }

    public void Question13(Account account){
        Account[] accounts = {account};
        for (int i = 0; i < accounts.length; i++){
            if (accounts[i].id ==2){
                continue;
            }
            System.out.println("Account " + (i+1) + " : ID : " + accounts[i].id + " Email: " +
                accounts[i].email + " UserName: " + accounts[i].userName
                + " FullName: " + accounts[i].fullName + " Department: " +
                accounts[i].department.name + " Position: "
                + accounts[i].position.name + " Group: " + " CreateDate: " +
                accounts[i].createdDate);
        }
    }

    public void Question14(Account account) {
        Account[] accounts = {account};
        for (int i = 0; i < accounts.length; i++) {
            if (accounts[i].id < 4) {
                System.out.println("Account " + (i + 1) + " : ID : " + accounts[i].id + " Email: " +
                        accounts[i].email + " UserName: " + accounts[i].userName
                        + " FullName: " + accounts[i].fullName + " Department: " +
                        accounts[i].department.name + " Position: "
                        + accounts[i].position.name + " Group: " + " CreateDate: " +
                        accounts[i].createdDate);
            }
        }
    }

    public void Question15(){
        for (int i = 0; i<= 20; i++ ){
            if (i % 2 == 0){
                System.out.println(i);
            }
        }
    }
}
