public class Main {
    public static void main (String[] args){

        // Wrapper
        int a = 10;
        Integer b = Integer.valueOf(a); //Boxing
        System.out.println("b = " + b);

        Long c = Long.valueOf(10);
        long d = c.longValue();
        System.out.println("d = " + d);
    }
}
