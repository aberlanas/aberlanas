import java.util.*;

public class p117_LaFiestaAburrida{
	
	public static void main (String args[]){
		
		java.util.Scanner in = new Scanner(System.in);
		
		int casos = in.nextInt();
		in.nextLine();
		
		for (int i= 0; i< casos; i++){
			String aux = in.nextLine();
			System.out.println("Hola, "+aux.split(" ")[1]+".");
		}
	}
	
}