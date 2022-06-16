import java.util.*;

public class p633 {

    public static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) throws Exception {

        int n = Integer.parseInt(sc.next());

        while (n != 0) {

            String[] lista = new String[n];	

            for (int i = 0; i < n; i++) {

                lista[i] = sc.next();
            }
            Arrays.sort(lista);

            int par = 0;
            int des = 0;
            int sobra = 0;
            if (n==1){
                des=1;
            }else{
                
                String anim1 = lista[0].substring(0,lista[0].length()-1);;
                String sexo = lista[0].substring(lista[0].length()-1);
                int hembras=0, machos=0;
                    if (sexo.equals("a"))
                        hembras=1;
                    else
                        machos=1;
                String anim2 = "";
                //System.out.println(anim1+"-"+sexo);
                for (int i = 1; i < n; i++) {
                    anim2 = lista[i].substring(0,lista[i].length()-1);
                    sexo = lista[i].substring(lista[i].length()-1);
                    //System.out.println(anim2+"-"+sexo);
                    if (anim1.equals(anim2)){
                        if (sexo.equals("a"))
                            hembras++;
                        else
                            machos++;
                    }else{
                        //System.out.println(hembras+"::"+machos);
                        if (hembras == 0 || machos == 0){
                            des++;
                            sobra += Math.abs(hembras-machos)-1;
                        }else{
                            par++;
                            sobra += hembras+machos-2;
                        }
                        anim1 = anim2;
                        if (sexo.equals("a")){
                            hembras=1;
                            machos=0;
                        }else{
                            machos=1;
                            hembras=0;
                        }
                    }
                }
                /*Si el ultimo coicide */
                //System.out.println(hembras+"::"+machos);
                if (hembras == 0 || machos == 0){
                    des++;
                    sobra += Math.abs(hembras-machos)-1;
                }else{
                    par++;
                    sobra += hembras+machos-2;
                }
            
            }
            System.out.println(par+" "+des+" "+sobra);

            n = Integer.parseInt(sc.next());
        }

    } // main

}