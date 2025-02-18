import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class ScannerDemo {
    public static void main(String[] args) throws ParseException {
        Scanner sc = new Scanner(System.in);
        /*System.out.println("Nhập tên: ");
        String fullName = sc.nextLine();

        System.out.println("Nhập tuổi: ");
        if (sc.hasNextInt()){
            System.out.println("Họ tên: " + fullName);
            System.out.println("Tuổi: " + sc.nextInt());
        }else {
            System.out.println("Ký tự nhập vào không phải là số!");
        }

        System.out.println("Nhập ngày sinh: ");
        String birthDay = sc.nextLine();

        String parttern = "dd-MM-yy";
        SimpleDateFormat sdf = new SimpleDateFormat(parttern);
        Date date = sdf.parse(birthDay);
        System.out.println("date = " + date); */

        // Exercise 5:

        // Q1
//        for (int i = 1; i <=3; i++ ){
//            System.out.println("Nhập số thứ " + i);
//            if (sc.hasNextInt()){
//                System.out.println("Số thứ " + i + " là: " + sc.nextInt());
//            }else {
//                System.out.println("Ký tự nhập vào không phải là số!");
//                break;
//            }
//            System.out.println("<-------------->");
//        }

        // Q2
            /*System.out.println("Mời bạn nhập 2 số thực:");
                if (sca.hasNextFloat()){
                    for (int i = 1; i <= 2; i++) {
                        System.out.println("Số thực thứ " + i + " là: " + sc.nextFloat());
                        System.out.println("<-------------->");
                    }
                }else {
                    System.out.println("Ký tự nhập vào không phải là số!");
                }*/
        // Q3
        /*System.out.println("Nhập họ tên: ");
        String name = sc.nextLine();
        // Q4
        String pattern = "dd-MM-yy";
        SimpleDateFormat dfm = new SimpleDateFormat(pattern);
        Date date = dfm.parse(dfm);

        System.out.println("Họ tên: " + name);
        System.out.println("Ngày sinh: " + date);
        */
        // Q7
        /*do {
            System.out.println("Nhập số chẵn: ");
            sc.nextInt();
        }while (sc.nextInt() % 2 == 0); */
        System.out.println("Số chẵn nhỏ hơn 10: ");
        soDuong();
        System.out.println("Số nguyên nhỏ hơn 10: ");
        soDuongNhoHon10();

    }

    public static void goToSchool(String name){
        System.out.println(name + " đi đến trường");
    };

    public static void soDuong(){
        for (int i = 0; i <10; i ++){
            if (i % 2 == 0){
                System.out.println(i);
            }

        }
    }

    public void info(){

    }

    public static void soDuongNhoHon10(){
        for (int i = 0; i <10; i ++){
            System.out.println(i);
        }
    }

}
