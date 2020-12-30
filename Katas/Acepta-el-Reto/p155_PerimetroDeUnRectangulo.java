import java.util.*;

public class p155_PerimetroDeUnRectangulo{

    static java.util.Scanner sc = new java.util.Scanner(System.in);
    
    public static void main (String args[]){

        int a = 0;
        int b = 0;
    
        a = sc.nextInt();
        b = sc.nextInt();

        while (a >=0 && b>=0){

            System.out.println(a+a+b+b);
            a = sc.nextInt();
            b = sc.nextInt();
        }
        
    }

}