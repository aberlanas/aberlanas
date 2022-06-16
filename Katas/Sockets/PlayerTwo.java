// A Java program for a Server
import java.net.*;
import java.io.*;
 
public class PlayerTwo
{
    //initialize socket and input stream
    private Socket          socketEnvio   = null;
    private Socket          socketRecibo = null;
    private ServerSocket    serverSocketRecibo   = null;
    private DataInputStream in       =  null;
    private DataOutputStream out     = null;
    private BufferedReader  input   = null;
    private String          serverIP = "127.0.0.1";
    private int             portServer     = 7889;
 
    // constructor with port
    public PlayerTwo(int port)
    {
        // starts server and waits for a connection
        try
        {
            serverSocketRecibo = new ServerSocket(port);
            System.out.println("Server started");
 
            System.out.println("Waiting for a client ...");
 
            socketRecibo = serverSocketRecibo.accept();
            System.out.println("Client accepted");
 
            // takes input from the client socket
            in = new DataInputStream(
                new BufferedInputStream(socketRecibo.getInputStream()));
 
            Socket socketServer = new Socket(serverIP, portServer);
            System.out.println("Connected "+ portServer);
             // sends output to the socket
            out    = new DataOutputStream(socketServer.getOutputStream());

            String line = "";
 
            // reads message from client until "Over" is sent
            while (!line.equals("Over"))
            {
                try
                {
                    line = in.readUTF();
                    System.out.println(line);
                    out.writeUTF(line);
                    //Aqui hacemos las cosas
                    socketEnvio = new Socket(serverIP, port);
                    System.out.println(" * [ PlayerOne ] :  Connected");       
                    // takes input from terminal
                    input  = new BufferedReader(new InputStreamReader(System.in));

                    // sends output to the socket
                    out    = new DataOutputStream(socketEnvio.getOutputStream());
                    
 
                }
                catch(IOException i)
                {
                    System.out.println(i);
                }
            }
            System.out.println("Closing connection");
 
            // close connection
            socketRecibo.close();
            in.close();
        }
        catch(IOException i)
        {
            System.out.println(i);
        }
    }
 
    public static void main(String args[])
    {
        Server server = new Server(7887);
    }
}