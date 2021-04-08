import java.util.*;

public class p583_EncuestaComprometedora{

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        
        int nCasos = sc.nextInt();
 
        while (nCasos > 0){

            int todos = sc.nextInt();
            int segundaRespuesta = sc.nextInt();           

            if (todos == 0 && segundaRespuesta == 0){
                System.out.println("100");
            }else{
                //System.out.println(todos+"-"+segundaRespuesta);
                long respuesta = (long)(todos - segundaRespuesta)*100/todos;
                
                System.out.println(respuesta);
            }
            nCasos--;
        }
    }

}