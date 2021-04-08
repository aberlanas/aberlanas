import java.util.*;

public class VassalRandom{

    
    static int REPETITIONS=100000000;
    static int resultados [][] = new int[6][6];

    public static void showResults(){
        for (int i =0; i<6;i++){
            //System.out.print("[");
            for (int j=0; j<6; j++){
                System.out.print(resultados[i][j]);
                if (j<5){
                    System.out.print(",");
                }
            }
            //System.out.println("]");
            System.out.println("");
        }
    }

    public static void main (String args[]){

        Random ran = new Random();
        System.out.println(REPETITIONS);
        // Valores de inicio
        int c=1; // Confederado
        int u=1; // Unionista

        int aux = 0;
        while(aux < REPETITIONS){
            c=ran.nextInt(6)+1;
            u=ran.nextInt(6)+1;
            resultados[c-1][u-1]+=1;
            aux++;
        }

        showResults();
    }

    

}