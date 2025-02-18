public class SwitchCaseDemo {
    public static void main(String[] args){
        int month = 1;

        switch(month){
            case 2:
                System.out.println("Có 29 ngày");
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                System.out.println("Cos 30 ngày");
            default:
                System.out.println("Có 31 ngày");
                break;
        }
    }
}
