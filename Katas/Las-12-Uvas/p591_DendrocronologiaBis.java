import java.util.*;

public class p591_DendrocronologiaBis {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {

        while (sc.hasNext()){
            int tam = sc.nextInt();
            
            long [][] arbol = new long [tam][tam];
            int medidasSize = tam/2+1;
            long[] sumaArbol = new long[medidasSize];

            int medidas = tam * tam;
            int fila, columna; 

            fila = 0;
            columna = 0;
            
            while (medidas >0 ){

                arbol[fila][columna]=sc.nextLong();
                columna++;
                if (columna >tam-1) {
                    columna=0;
                    fila++;
                }
                medidas--;
            }

            int fila_inicio=0;
            int columna_inicio = 0;
            int tamanyo_aux = 0;
            boolean heImpreso = false;

            if (tam%2 == 1){

                System.out.print(arbol[((tam-1)/2)][((tam-1)/2)]);
                heImpreso=true;
                fila_inicio = ((tam-1)/2)-1;
                columna_inicio = ((tam-1)/2)-1;
                tamanyo_aux = 3;

            }else{
                fila_inicio = ((tam-1)/2);
                columna_inicio = ((tam-1)/2);
                tamanyo_aux = 2;
            }

            while(tamanyo_aux<=tam){

                long suma = 0;
                for (int i = fila_inicio; i< fila_inicio+tamanyo_aux ; i++){
                    if (i == fila_inicio || i == fila_inicio+tamanyo_aux-1){
                        for (int j=columna_inicio; j< columna_inicio+tamanyo_aux; j++){
                            suma+=arbol[i][j];
                        }
                    }else{
                        suma+=arbol[i][columna_inicio];
                        suma+=arbol[i][columna_inicio+tamanyo_aux-1];
                    }
                }
                if(heImpreso){
                    System.out.print(" "+suma);
                }else{
                    System.out.print(suma);
                    heImpreso=true;

                }
                fila_inicio=fila_inicio-1;
                columna_inicio=columna_inicio-1;
                tamanyo_aux=tamanyo_aux+2;
                //System.out.println("Procesamos : "+fila_inicio+","+columna_inicio+",con size: "+tamanyo_aux);
            }
            
            System.out.println();
            /*
            for (int i = 0; i< tam ; i++){
                System.out.print("[");
                for (int j=0; j< tam; j++){
                    System.out.print(arbol[i][j]+",");
                }
                System.out.println("]");
            }*/

        }
        
    }
}