import java.util.*;

public class p588_VelasBinarias{

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        
        long caso = sc.nextLong();
        while (caso >0){
            
            String aux = Long.toBinaryString(caso);
            while (aux.endsWith("0"))aux = aux.substring(0, aux.length()-1);

            
            int y = 0;
            String aux2 = "";
            
            for (int i = 0; i < aux.length(); i++) {
                y++;
                String letra=aux.substring(i, y);
                aux2 = letra + aux2;
            }   
            
            
            if (aux.equals(aux2)){
                System.out.println("SI");
            }
            else{
                System.out.println("NO");
            }
         
            caso = sc.nextLong();
        }
        }
    }