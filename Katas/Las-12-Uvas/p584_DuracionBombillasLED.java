import java.util.*;

public class p584_DuracionBombillasLED {

    static Scanner sc = new Scanner(System.in);

    public static void main (String args[]){

        int casos = sc.nextInt();

        while (casos > 0){

            int horasMax = sc.nextInt();
            int horasMaxAux = horasMax;
            int encendidosMax = sc.nextInt();
            int horasEst = sc.nextInt();

            /*
            while(encendidosMax>0 && horasMax>0 ){
                horasMax=horasMax - horasEst;
                encendidosMax--;
            }
            */

            horasMax = horasMax-(horasEst*encendidosMax);
            encendidosMax = encendidosMax-(horasMaxAux/horasEst);

            if (encendidosMax <= 0 && horasMax <= 0){
                System.out.println("AMBAS");
            }else if(encendidosMax<=0){
                System.out.println("ENCENDIDOS");
            }else{
                System.out.println("HORAS");
            }
            casos--;
        }

    }
}
