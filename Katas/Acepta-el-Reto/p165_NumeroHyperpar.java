import java.util.*;

public class p165_NumeroHyperpar {

    static java.util.Scanner sc = new java.util.Scanner(System.in);

    public static void main(String[] args) {
    
        int a = sc.nextInt();
        String aux = String.valueOf(a);

        while (a >= 0){
            
            boolean esHyperPar = true;

            for (int i = 0; i< aux.length() && esHyperPar; i++){
                int b = Integer.parseInt(aux.charAt(i)+"");
                if (b%2 != 0){
                    esHyperPar = false;
                }
            }
            
            if (esHyperPar){
                System.out.println("SI");
            }else{
                System.out.println("NO");
            }

            a = sc.nextInt();
            aux = String.valueOf(a);
        }
        
    }
}
