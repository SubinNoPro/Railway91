package entity;

import java.util.ArrayList;
import java.util.Scanner;

public class StudentManagement {
    ArrayList<Student> students = new ArrayList<>();
    Scanner scanner = new Scanner(System.in);

    // Add student
    public void addStudent() {
        System.out.println("----Thêm sinh viên----");
        System.out.println("Nhập ID: ");
        int id = scanner.nextInt();

        scanner.nextLine();
        System.out.println("Nhập tên: ");
        String name = scanner.nextLine();

        students.add(new Student(id, name));
        System.out.println("Thêm sinh viên thành công!!");


    }

    // Show all student
    public void showAllStudent() {

        System.out.println("-----Danh sách sinh viên-----");
        if (students.isEmpty()) {
            System.out.println("Danh sách sinh viên rỗng");
        }

        for (Student student : students) {
            System.out.println("entity.Student name: " + student.getStudentName() + " | entity.Student ID: " + student.getStudentID());
        }
    }

    // search student
    public void searchStudent() {
        System.out.println("Nhập tên học sinh cần tìm: ");
        String name = scanner.nextLine();

        for (Student student : students) {
            if (student.getStudentName().isEmpty()) {
                System.out.println("Sinh viên không tồn tại");
            }

            if (student.getStudentName().equals(name)) {
                System.out.println("entity.Student name: " + student.getStudentName() + " | entity.Student ID: " + student.getStudentID());
            }
        }
    }

    // Menu
    public void Menu() {
        while (true) {
            System.out.println("---- Quản lý sinh viên ----");
            System.out.println("1. Thêm sinh viên");
            System.out.println("2. Hiện thị toàn bộ sinh viên");
            System.out.println("3. Tìm kiếm sinh viên");
            System.out.println("4. Quay lại");
            System.out.print("Chọn chức năng: ");
            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    addStudent();
                    break;
                case 2:
                    showAllStudent();
                    break;
                case 3:
                    searchStudent();
                    break;
                default:
                    return;
            }

        }
    }
}
