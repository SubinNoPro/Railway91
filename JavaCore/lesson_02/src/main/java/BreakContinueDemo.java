public class BreakContinueDemo {
    public static void main(String[] args){
        //Thoát ra khỏi vòng lặp ngay lập tức
        for(int i = 1; i <= 10; i++){
            if (i == 3){
                break;
            }
            System.out.println(i);
        }
        // Loại bỏ điều kiện không cần và tiếp tục vòng lặp
        for(int i = 1; i <= 10; i++){
            if (i == 3){
                continue;
            }
            System.out.println(i);
        }
    }
}
