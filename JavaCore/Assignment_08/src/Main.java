import entity.Student;

import java.util.*;

public class Main {
    static Scanner sc = new Scanner(System.in);
    static List<Student> studentList = new ArrayList<>();

    public static void main(String[] args) {

        for (int i = 1; i <= 10; i++){
            studentList.add(new Student(i, "Nguyen Van " + i));
        }

        //a) In ra tổng số phần tử của students
//        System.out.println("Tổng số học sinh: " + studentList.size());

        //b) Lấy phần tử thứ 4 của students
//        System.out.println("ID: " + studentList.get(3).getId() + " | " +studentList.get(3).getName() );

        //c) In ra phần tử đầu và phần tử cuối của students
        // Phần tử đầu
//        System.out.println("ID: " + studentList.get(0).getId() + " | " +studentList.get(0).getName() );
        //Phần tử cuối
//        System.out.println("ID: " + studentList.get(studentList.size() - 1).getId() + " | " +studentList.get(studentList.size() - 1).getName() );
        // d) Thêm 1 phần tử vào vị trí đầu của students

        //f) Dảo ngược vị trí của student
        for (int i = studentList.size() -1; i >= 0; i--){
                    System.out.println("ID: " + studentList.get(i).getId() + " | Student name: " + studentList.get(i).getName());
        }
        //j) Xóa name của student có id = 2
//        searchStudentByID();
//        searchStudentByName();

//        studentList.add(new Student(11,"Nguyen Van 3"));
//        studentList.add(new Student(12, "Nguyen Van 9"));

//        duplicateName();


//        List<Student> studentCopies = new ArrayList<>();
//        for (Student student : studentList){
//            studentCopies.add(new Student(student.getId(), student.getName()));
//        }
//
//        for (Student student : studentCopies){
//            System.out.println("ID copies: " + student.getId() + " | Student name copies: " +student.getName() );
//        }
//        deleteStudentName(2);
//        deleteStudent(5);



    }
    public static void showAll(){
        for (Student student : studentList){
            System.out.println("ID: " + student.getId() + " | Student name: " +student.getName() );
        }
    }
    public static void searchStudentByID(){
        System.out.println("Nhập id: ");
        int id = sc.nextInt();
        sc.nextLine();

        if (studentList.isEmpty()){
            System.out.println("Danh sách trống!!");
        }

        boolean flag = true;

        for (Student student : studentList){
            if (student.getId() == id){
                System.out.println("ID: " + student.getId() + " | Student name: " +student.getName() );
                flag = false;
            }
        }
        if (flag){
            System.out.println("Not found!!");
        }
    }

    public static void searchStudentByName(){
            System.out.println("Nhập tên cần tìm");
            String name = sc.nextLine();
            boolean flag = true;

            for (Student student : studentList){
                if (student.getName().equals(name)){
                    System.out.println("ID: " + student.getId() + " | Student name: " +student.getName() );
                    flag = false;
                }
            }
            if (flag){
                System.out.println("Not found!!");
            }
    }

    public static void duplicateName(){
        for (int i = 0; i < studentList.size(); i++){
            for (int j = 1; j < studentList.size(); j++){
                if (Objects.equals(studentList.get(i).getName(), studentList.get(j).getName())){
                    System.out.println("ID: " + studentList.get(i).getId() + " | Name: " + studentList.get(i).getName());
                }
            }

        }
    }

    public static void deleteStudentName(int id){
        boolean flag = true;
        for (Student student : studentList){
            if (student.getId() == id){
                studentList.remove(student);
                studentList.add(new Student(id," "));
                flag = false;
                break;
            }
        }
        if (flag){
            System.out.println("Not found!!");
        }
    }

    public static void deleteStudent(int id){
        boolean flag = true;
        for (Student student : studentList){
            if (student.getId() == id){
                studentList.remove(student);
                flag = false;
                break;
            }
        }
        if (flag){
            System.out.println("Not found!!");
        }
    }
}