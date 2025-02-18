import java.time.LocalDate;

public class Program {
    public static void main(String[] args) {
        Account account = new Account();
        Department department = new Department();
        Position position = new Position();

        account.id = 1;
        account.email = "xaquytoaii@gmail.com";
        account.userName = "quytoai";
        account.fullName = "Xa Quy Toai";
        account.department = department;
        account.position = position;
        account.createdDate = LocalDate.now();

        department.id = 1;
        department.name = "Sale";

        position.id = 1;
        position.name = PositionName.Dev;

        System.out.println(account.id);
    }
}
