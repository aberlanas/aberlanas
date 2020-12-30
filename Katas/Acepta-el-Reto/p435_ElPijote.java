import java.util.*;

public class p435_ElPijote {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {

        
        while (sc.hasNextLine()){

            String caso = sc.nextLine();
            boolean fallo = false;
            int cuenta= 0;

            for (int i = 0; i < caso.length(); i++) {
                if (caso.charAt(i) == '0') {
                    cuenta++;
                }
            }

            int cuenta_aux = 0;

            for (int i=1;i<=9 && !fallo;i++){

                cuenta_aux = 0;
                for (int j = 0; j < caso.length(); j++) {
                    if (caso.charAt(j) == (char)i) {
                        cuenta_aux++;
                    }
                }

                System.out.println("cuenta "+cuenta_aux);
                if (cuenta_aux != cuenta) fallo=true;
            }

            if (fallo){
                System.out.println("no subnormal");
            }else{
                System.out.println("subnormal");
            }
            
        }
        
    }
    
}
