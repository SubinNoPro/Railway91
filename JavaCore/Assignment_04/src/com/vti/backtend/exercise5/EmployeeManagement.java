package com.vti.backtend.exercise5;

import java.util.ArrayList;
import java.util.Scanner;

import static com.vti.utils.ScannerUtils.inputAge;
import static com.vti.utils.ScannerUtils.inputName;

public class EmployeeManagement {
    private ArrayList<Employee> employees = new ArrayList<>();
    private Scanner scanner = new Scanner(System.in);

    // Thêm cán bộ
    public void addEmployee() {
        String name = inputName("Nhập tên: ");
        System.out.print("Nhập tuổi: ");
        int age = inputAge();
        Gender gender = enterGender();

        scanner.nextLine();
        System.out.print("Nhập địa chỉ: ");
        String address = scanner.nextLine();

        employees.add(new Employee(name, age, gender, address));
        System.out.println("✔ Nhân viên đã được thêm thành công!");
    }

    private Gender enterGender() {
        while (true) {
            System.out.println("Nhập giới tính: 1. Nam, 2. Nữ, 3. Khác");
            int choice = scanner.nextInt();
            scanner.nextLine();
            switch (choice) {
                case 1:
                    return Gender.MALE;
                case 2:
                    return Gender.FEMALE;
                default:
                    return Gender.OTHER;
            }
        }
    }

    // Tìm cán bộ
    public void searchEmployee() {
        System.out.println("Nhập tên cán bộ cần tìm: ");
        String name = scanner.nextLine();

        boolean found = false;
        for (Employee emp : employees) {
            if (emp.getFullName().equalsIgnoreCase(name)) {
                System.out.println(emp);
                found = true;
            }
        }

        if (!found) {
            System.out.println("Không tìm thấy nhân viên nào!");
        }

    }

    //Xóa cán bộ
    public void deleteEmployee() {
        System.out.println("Nhập tên cán bộ cần xóa: ");
        String name = scanner.nextLine();

        for (Employee emp : employees) {
            if (emp.getFullName().equals(name)) {
                employees.remove(emp);
                System.out.println("Xóa thành công!");
            }
        }
    }


    public void showAllEmployee() {
        if (employees.isEmpty()) {
            System.out.println("Không có nhân viên nào!");
            return;
        }

        System.out.println("Danh sách nhân viên:");
        for (Employee emp : employees) {
            System.out.println(emp.getFullName() + " | " + emp.getAge() + " | " + emp.getGender() + " " + emp.getAddress() );
            System.out.println("-------------------------------");
        }
    }

    public void menu() {
        while (true) {
            System.out.println("\n===== QUẢN LÝ CÁN BỘ =====");
            System.out.println("1. Thêm cán bộ");
            System.out.println("2. Tìm cán bộ");
            System.out.println("3. Hiện thị tất cả cán bộ");
            System.out.println("4. Xóa cán bộ");
            System.out.println("0. Thoát");
            System.out.print("Chọn chức năng: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Clear buffer

            switch (choice) {
                case 1:
                    addEmployee();
                    break;
                case 2:
                    searchEmployee();
                    break;
                case 3:
                    showAllEmployee();
                    break;
                case 4:
                    deleteEmployee();
                    break;
                case 0:
                    System.out.println("🔚 Thoát chương trình!");
                    return;
                default:
                    System.out.println("⚠ Lựa chọn không hợp lệ! Vui lòng nhập lại.");
            }
        }
    }
}
