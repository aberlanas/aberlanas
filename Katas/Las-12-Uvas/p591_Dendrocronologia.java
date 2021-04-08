import java.util.*;


public class p591_Dendrocronologia {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {

        while (sc.hasNext()){
            int tam = sc.nextInt();
            
            long [][] arbol = new long [tam][tam];
            int medidasSize = tam/2+1;
            long[] sumaArbol = new long[medidasSize];
            int puntero = 0;

            int medidas = tam * tam;
            int fila, columna, margen;
            boolean centroArbol = false;
            
            fila = 0;
            columna = 0;
            margen = 0;
            
            while (medidas >0 ){

                long aux=sc.nextLong();

                if(fila==margen||columna==margen||fila==tam-margen-1||columna==tam-margen-1){
                    puntero=margen;
                }else{
                    puntero = margen;
                }
                
                sumaArbol[margen]+=aux;

                columna++;

                if (!centroArbol)margen++;
                else margen--;
                
                if (margen >= medidasSize)centroArbol=true;


                if (columna >tam-1) {
                    centroArbol=false;
                    columna=0;
                    fila++;    
                }
                System.out.println("Puntero: "+puntero);
                System.out.println("Fila: "+fila);
                System.out.println("Columa: "+columna);
                System.out.println("Margen: "+margen);

                medidas--;
            }
        }
        
    }
}