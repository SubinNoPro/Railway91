public class IfElseDemo {
    public static void main(String[] args) {
        int age = 25;

        if(age >= 18){
            System.out.println("Bạn đã đủ 18 tuổi");
        }else{
            System.out.println("Bạn chưa đủ 18 tuổi");
        }

        int month = 5;
        if(month == 2){
            System.out.println("Có 28 hoặc 29 ngày");
        } else if(month == 4 || month == 6 || month == 9 || month == 11) {
            System.out.println("Có 30 ngày");
        }else{
            System.out.println("Có 31 ngày");
        }
    }
}
