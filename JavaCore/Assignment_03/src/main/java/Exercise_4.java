import java.sql.SQLOutput;
import java.util.List;
import java.util.Scanner;

public class Exercise_4 {
    Scanner sc = new Scanner(System.in);

    public void Question_1(){
        System.out.println("Nhập một xâu kí tự:");
        String str = sc.nextLine();
        System.out.println(str);

        String[] words = str.trim().split(" ");
        System.out.println("Số từ trong xâu: " + words.length);
    }

    public void Question_2(){
        System.out.println("Nhâp xâu kí tự s1: ");
        String s1 = sc.nextLine();
        System.out.println("Nhập xâu kí tự s2: ");
        String s2 = sc.nextLine();
        System.out.println(s1.concat(s2));
    }

    public void Question_3(){
        System.out.println("Nhập tên: ");
        String name = sc.nextLine();
        boolean isUpperCase = name.matches("^[A-Z]+");
        String startWith = name.substring(0,1).toUpperCase();
        if (isUpperCase){
            System.out.println("Tên: " + name);
        }else{
            System.out.println("Tên: " + startWith.concat(name.substring(1)));
        }


    }

    public void Question_4(){
        System.out.println("Nhập tên: ");
        String name = sc.nextLine().toUpperCase();
        for (int i = 0; i < name.length(); i++){
            System.out.println("Kí tự thứ " + (i + 1) + " là: " + name.substring(i, i +1));
        }
    }

    public void Question_5(){
        System.out.println("Nhập họ: ");
        String lastName = sc.nextLine();
        System.out.println("Nhập tên: ");
        String firstName = sc.nextLine();
        System.out.println("Họ và tên: " + lastName.concat(" " + firstName));
    }

    public void Question_6(){
        System.out.println("Nhập họ và tên: ");
        String fullName = sc.nextLine();
        String[] names = fullName.split(" ");

        for (int i = 0; i < names.length; i++){
            if (i == 0){
                System.out.println("Họ là: " + names[i]);
            }else if (i > 0 && i < (names.length - 1)){
                System.out.println("Tên đệm là: " + names[i]);
            }else{
                System.out.println("Tên là: " + names[i]);
            }
        }

    }

    public void Question_7(){
        System.out.println("Nhập họ và tên: ");
        String fullName = sc.nextLine();
        String[] names = fullName.trim().split(" ");
        StringBuilder result = new StringBuilder();
        for (String word : names){
            if (!word.isEmpty()){
                result.append(Character.toUpperCase((word.charAt(0)))).append(word.substring(1).toLowerCase()).append(" ");
            }
        }
        System.out.println(result.toString().trim());
    }

    public void Question_8(List<Group> groups) {
        if (groups == null || groups.isEmpty()) {
            System.out.println("Danh sách group rỗng");
            return;
        }
        for (Group group : groups) {
            if (group == null || group.name == null) {
                continue;
            }
            if (group.name.contains("Java")) {
                System.out.println("Group name: " + group.name);
            }
        }
    }

    public void Question_9(List<Group> groups) {
        if (groups == null || groups.isEmpty()) {
            System.out.println("Danh sách group rỗng");
            return;
        }
        for (Group group : groups) {
            if (group == null || group.name == null) {
                continue;
            }
            if (group.name.contains("Java") && !group.name.contains("JavaScript") ) {
                System.out.println("Group name: " + group.name);
            }
        }
    }


}
