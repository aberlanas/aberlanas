// A Java program for a Client
import java.net.*;
import java.io.*;
 
public class PlayerOne
{
    // initialize socket and input output streams
    private Socket socketEnvio           = null;
    private Socket socketRecibo          = null;
    private ServerSocket    serverSocketRecibo   = null;
    private DataInputStream in       =  null;
    private BufferedReader  input   = null;
    private String          serverIP = "127.0.0.1";
    private DataOutputStream out     = null;
 
    // constructor to put ip address and port
    public PlayerOne(String address, int port)
    {
        // establish a connection
        try
        {
            socketEnvio = new Socket(address, port);
            System.out.println(" * [ PlayerOne ] :  Connected");
 



        
            // takes input from terminal
            input  = new BufferedReader(new InputStreamReader(System.in));
 


            // sends output to the socket
            out    = new DataOutputStream(socketEnvio.getOutputStream());
        }
        catch(UnknownHostException u)
        {
            System.out.println(u);
        }
        catch(IOException i)
        {
            System.out.println(i);
        }
 
        // string to read message from input
        String line = "";
 
        // keep reading until "Over" is input
        while (!line.equals("Over"))
        {
            try
            {
                line = input.readLine();
                System.out.println(" Envio : "+line);
                out.writeUTF(line);
                // Vamos a probar esto
                serverSocketRecibo = new ServerSocket(port+2);
                System.out.println("Server started");

                socketRecibo = serverSocketRecibo.accept();
                System.out.println("Client accepted");
                // takes the input from SocketRecibo
                in = new DataInputStream(
                    new BufferedInputStream(socketRecibo.getInputStream()));
                line = in.readUTF();
                System.out.println("Recibo " +line);

            }
            catch(IOException i)
            {
                System.out.println(i);
            }
        }
 
        // close the connection
        try
        {
            input.close();
            out.close();
            socketEnvio.close();
        }
        catch(IOException i)
        {
            System.out.println(i);
        }
    }
 
    public static void main(String args[])
    {
        PlayerOne playerone = new PlayerOne("127.0.0.1", 7887);
    }
}