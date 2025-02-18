public class ForIndexDemo {
    public static void main(String[] args){
        for (int i = 2; i <=10; i += 2){
            System.out.println(i);
        }

        for (int i = 10; i >= 2; i -= 2){
            System.out.println(i);
        }

        String[] fruits = {"Cam", "Xoài", "Táo", "Lê"};
        for(int i = 0; i < fruits.length; i++){
            System.out.println(fruits[i]);
        }
    }
}
