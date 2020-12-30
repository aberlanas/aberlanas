import java.util.*;

public class p520_DondeEstaLaBolita {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        
        int cubiletes = sc.nextInt();
        int posicion = sc.nextInt();

        while (posicion != 0 || cubiletes !=0 ){

            int mov_a = sc.nextInt();
            int mov_b = sc.nextInt();

            while (mov_a != 0 || mov_b !=0){

                //System.out.println("Cambiamos "+mov_a +","+mov_b);
                if (mov_a == posicion){
                    posicion = mov_b;
                }else if(mov_b == posicion){
                    posicion = mov_a;
                }
                
                mov_a = sc.nextInt();
                mov_b = sc.nextInt();
            }

            System.out.println(posicion);

            cubiletes = sc.nextInt();
            posicion = sc.nextInt();
        }

    }

}
