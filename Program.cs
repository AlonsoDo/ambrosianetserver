using System;
using System.Linq;
using System.Text;
using System.Threading;
using System.Net.Sockets;
using System.Collections;
using System.Net;
using Newtonsoft.Json;
using System.Configuration;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace AmbrosiaServer
{    
    
    class Program
    {
        public static Hashtable clientsList = new Hashtable();
        public static List<Impresoras> impresoras = new List<Impresoras>();
        public static List<Terminales> terminales = new List<Terminales>();
        
        static void Main(string[] args)
        {
            IPAddress ip = IPAddress.Parse("192.168.1.2");            
            TcpListener serverSocket = new TcpListener(ip,8888);
            TcpClient clientSocket = default(TcpClient);
            string ClientId = null;
            

            string connectionString = ConfigurationManager.ConnectionStrings["AmbrosiaBD"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connectionString);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();
                // Perform database operations
                string sql = "SELECT elementos.ElementoId as 'Elemento', impresoraconfig.NombreImpresora as 'NombreImp' FROM elementos JOIN impresoraconfig on elementos.ElementoId=impresoraconfig.ElementoId";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Console.WriteLine(rdr[0] + " -- " + rdr[1]);
                    impresoras.Add(new Impresoras()
                    {
                        ElementoId = rdr.GetInt32(0),
                        NombreImpresora = rdr.GetString(1)                        
                    });
                }
                rdr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            conn.Close();
            Console.WriteLine("Done.");

            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();
                // Perform database operations
                string sql = "SELECT elementos.ElementoId as 'Elemento', terminalconfig.NombreTerminal as 'NombreTer' FROM elementos JOIN terminalconfig on elementos.ElementoId=terminalconfig.ElementoId";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Console.WriteLine(rdr[0] + " -- " + rdr[1]);
                    terminales.Add(new Terminales()
                    {
                        ElementoId = rdr.GetInt32(0),
                        NombreTerminal = rdr.GetString(1)
                    });
                }
                rdr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            conn.Close();
            Console.WriteLine("Done.");
            
            //Arrancar servidor de sockets
            serverSocket.Start();
            Console.WriteLine("Socket Server Started ...");

            while ((true))
            {
                // Recibir conexion cliente
                clientSocket = serverSocket.AcceptTcpClient();

                byte[] bytesFrom = new byte[262144];
                string dataFromClient = null;

                // Leer stream
                NetworkStream networkStream = clientSocket.GetStream();
                networkStream.Read(bytesFrom, 0, (int)clientSocket.ReceiveBufferSize);
                dataFromClient = System.Text.Encoding.ASCII.GetString(bytesFrom);
                dataFromClient = dataFromClient.Substring(0, dataFromClient.IndexOf("$"));

                // Guardar el socket cliente
                // dataFromClient = Id cliente
                ClientId = dataFromClient;
                clientsList.Add(ClientId, clientSocket);

                // Mensaje de Joined
                Console.WriteLine(ClientId + " has joined to the trafic control.");                

                handleClient client = new handleClient();
                client.startClient(clientSocket, ClientId);
            }            
        }

        /*public static void broadcast(string msg, string ClientName, bool flag)
        {
            // Recorrer lista de clientes conectados
            foreach (DictionaryEntry Item in clientsList)
            {
                TcpClient broadcastSocket;
                broadcastSocket = (TcpClient)Item.Value;
                NetworkStream broadcastStream = broadcastSocket.GetStream();
                Byte[] broadcastBytes = null;

                if (flag == true)
                {
                    // Mensaje normal
                    broadcastBytes = Encoding.ASCII.GetBytes(ClientName + " says : " + msg);
                }
                else
                {
                    // Primer mensaje, contiene solo key cliente
                    broadcastBytes = Encoding.ASCII.GetBytes(msg);
                }

                // Mandar mensaje a todos los clientes conectados
                broadcastStream.Write(broadcastBytes, 0, broadcastBytes.Length);
                broadcastStream.Flush();
            }
        }*/    

        public class handleClient
        {
            TcpClient clientSocket;
            string ClientId;            
            Thread ctThread;

            public void startClient(TcpClient inClientSocket, string inClientId)
            {
                this.clientSocket = inClientSocket;
                this.ClientId = inClientId;                
                SendElementsData(0);
                this.ctThread = new Thread(SocketTrafic);
                ctThread.Start();
            }

            public void SendElementsData(int PadreId)
            {
                TcpClient broadcastSocket;
                broadcastSocket = this.clientSocket;
                NetworkStream broadcastStream = broadcastSocket.GetStream();
                Byte[] broadcastBytes = null;
                string output = null;
                string connectionString = ConfigurationManager.ConnectionStrings["AmbrosiaBD"].ConnectionString;
                MySqlConnection conn = new MySqlConnection(connectionString);
                try
                {
                    Console.WriteLine("Sending Elements to client...");

                    string nombreEvento = "SendElementsDataBak";                    
                    GetElementsData elementsData = new GetElementsData();
                    elementsData.NombreEvento = nombreEvento;
                    
                    //Elemento elemento = new Elemento();
                    List<Elemento> elementosList = new List<Elemento>();                    
                    
                    conn.Open();
                    // Perform database operations
                    string sql = "SELECT * FROM elementos WHERE CompanyId=4 AND PadreId=" + PadreId;
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Console.WriteLine(rdr[0] + " -- " + rdr[3]);

                        elementosList.Add(new Elemento()
                        {
                            ElementoId = rdr.GetInt32(rdr.GetOrdinal("ElementoId")),
                            PadreId = rdr.GetInt32(rdr.GetOrdinal("PadreId")),
                            Descripcion = rdr.GetString(rdr.GetOrdinal("Descripcion")),
                            PathImg = rdr.GetString(rdr.GetOrdinal("PathImg")),
                            Final = rdr.GetInt16(rdr.GetOrdinal("Final")),
                            Precio = rdr.GetDecimal(rdr.GetOrdinal("Precio")),
                            Impuesto = rdr.GetDecimal(rdr.GetOrdinal("Impuesto"))
                        });

                    }
                    rdr.Close();
                    elementsData.data = elementosList;
                    output = JsonConvert.SerializeObject(elementsData);
                    Console.WriteLine(output);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
                conn.Close();
                Console.WriteLine("Done.");

                broadcastBytes = Encoding.ASCII.GetBytes(output + "$");
                broadcastStream.Write(broadcastBytes, 0, broadcastBytes.Length);
                broadcastStream.Flush();
            }

            private void SocketTrafic()
            {
                byte[] bytesFrom = new byte[262144];
                string dataFromClient = null;                

                while ((true))
                {
                    try
                    {
                        NetworkStream networkStream = clientSocket.GetStream();
                        networkStream.Read(bytesFrom, 0, (int)clientSocket.ReceiveBufferSize);
                        dataFromClient = System.Text.Encoding.ASCII.GetString(bytesFrom);
                        dataFromClient = dataFromClient.Substring(0, dataFromClient.IndexOf("$"));
                        
                        Console.WriteLine("From client:" + ClientId + ":" + dataFromClient);
                        
                        var definition = new { NombreEvento = ""};
                        var EventosControl = JsonConvert.DeserializeAnonymousType(dataFromClient, definition);
                                                
                        // Control Eventos
                        if (EventosControl.NombreEvento == "Desconectar")
                        {
                            var definition2 = new { IdCliente = "" };
                            var EventosControl2 = JsonConvert.DeserializeAnonymousType(dataFromClient, definition2);
                            Console.WriteLine(EventosControl2.IdCliente + " has disconnected");
                            clientsList.Remove(EventosControl2.IdCliente);
                            clientSocket.Close();                            
                            break;
                        }
                        else if (EventosControl.NombreEvento == "AskForElements")
                        {
                            EventoAskForElements eventoAskForElements = new EventoAskForElements();
                            eventoAskForElements = JsonConvert.DeserializeObject<EventoAskForElements>(dataFromClient);
                            Console.WriteLine("PadreId:" + eventoAskForElements.PadreId);
                            SendElementsData(eventoAskForElements.PadreId);
                        }                                           
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }                
                }

                ctThread.Abort();
                return;            
            }            
        }    
    }
}
