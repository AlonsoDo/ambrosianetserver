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
using System.Drawing;
using System.Drawing.Printing;

namespace AmbrosiaServer
{    
    class Program
    {
        public static Hashtable clientsList = new Hashtable();
        public static List<Impresoras> impresoras = new List<Impresoras>();
        public static List<Terminales> terminales = new List<Terminales>();
        public static Envio PedidoEnviado = new Envio();
        public static PedidoCompleto pedidoCompleto = new PedidoCompleto();
        public static ImpresorasTerminales impresorasTerminales = new ImpresorasTerminales();
        
        static void Main(string[] args)
        {
            IPAddress ip = IPAddress.Parse("192.168.1.2");  // Localhost of my machine          
            TcpListener serverSocket = new TcpListener(ip,10001);
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

        public class handleClient
        {
            TcpClient clientSocket;
            string ClientId;            
            Thread ctThread;
            Envio envioRecibido = new Envio();
            public List<ImpresoraSalida> impresoraSalida = new List<ImpresoraSalida>();
            public int IndexImpresora = 0;

            public void startClient(TcpClient inClientSocket, string inClientId)
            {
                this.clientSocket = inClientSocket;
                this.ClientId = inClientId;                
                SendImpresorasTerminales();
                Thread.Sleep(1000);                
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
                    string sql = "SELECT * FROM elementos WHERE PadreId=" + PadreId;
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
                            Impuesto = rdr.GetDecimal(rdr.GetOrdinal("Impuesto")),
                            ImprimirEnFactura = rdr.GetInt16(rdr.GetOrdinal("ImprimirEnFactura")),
                            ImprimirEnComanda = rdr.GetInt16(rdr.GetOrdinal("ImprimirEnComanda"))
                        });

                    }
                    rdr.Close();
                    elementsData.data = elementosList;
                    output = JsonConvert.SerializeObject(elementsData);
                    Console.WriteLine(output);
                    broadcastBytes = Encoding.ASCII.GetBytes(output + "$");
                    broadcastStream.Write(broadcastBytes, 0, broadcastBytes.Length);
                    broadcastStream.Flush();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
                conn.Close();
                Console.WriteLine("Done.");
                
            }

            public void SendPrintersTer()
            {
                string connectionString = ConfigurationManager.ConnectionStrings["AmbrosiaBD"].ConnectionString;
                MySqlConnection conn = new MySqlConnection(connectionString);
                try
                {
                    Console.WriteLine("Sending Printers list to client...");                    
                    
                    List<ImpresorasTer> impresorasTer = new List<ImpresorasTer>();

                    conn.Open();
                    // Perform database operations
                    string sql = "SELECT * FROM impresoras";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Console.WriteLine(rdr[1]);

                        impresorasTer.Add(new ImpresorasTer()
                        {
                            NombreImpresora = rdr.GetString(rdr.GetOrdinal("NombreImpresora"))
                        });

                    }
                    impresorasTer.Add(new ImpresorasTer()
                    {
                        NombreImpresora = "Todas"
                    });
                    impresorasTer.Add(new ImpresorasTer()
                    {
                        NombreImpresora = "Ninguna"
                    });
                    rdr.Close();
                    
                    impresorasTerminales.impresorasTer = impresorasTer;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
                conn.Close();
                Console.WriteLine("Done.");

            }

            public void SendTerminalesTer()
            {
                string connectionString = ConfigurationManager.ConnectionStrings["AmbrosiaBD"].ConnectionString;
                MySqlConnection conn = new MySqlConnection(connectionString);
                try
                {
                    Console.WriteLine("Sending Terminales list to client...");                    

                    List<TerminalesTer> terminalesTer = new List<TerminalesTer>();

                    conn.Open();
                    // Perform database operations
                    string sql = "SELECT * FROM terminales";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Console.WriteLine(rdr[1]);

                        terminalesTer.Add(new TerminalesTer()
                        {
                            NombreTerminal = rdr.GetString(rdr.GetOrdinal("NombreTerminal"))
                        });

                    }
                    terminalesTer.Add(new TerminalesTer()
                    {
                        NombreTerminal = "Todas"
                    });
                    terminalesTer.Add(new TerminalesTer()
                    {
                        NombreTerminal = "Ninguna"
                    });
                    rdr.Close();
                    
                    impresorasTerminales.terminalesTer = terminalesTer;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
                conn.Close();
                Console.WriteLine("Done.");

            }

            public void SendImpresorasTerminales()
            {
                SendPrintersTer();
                SendTerminalesTer();

                TcpClient broadcastSocket;
                broadcastSocket = this.clientSocket;
                NetworkStream broadcastStream = broadcastSocket.GetStream();
                Byte[] broadcastBytes = null;
                string output = null;

                impresorasTerminales.NombreEvento = "ImpresorasTerminalesBak";
                output = JsonConvert.SerializeObject(impresorasTerminales);
                Console.WriteLine(output);
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
                        else if (EventosControl.NombreEvento == "EnvioPedido")
                        {
                            //Envio Sended = new Envio();
                            PedidoEnviado = JsonConvert.DeserializeObject<Envio>(dataFromClient);
                            Console.WriteLine("Envio de la cuenta: " + PedidoEnviado.NumeCuen);
                            
                            //Grabar datos aqui
                            GuardarPedido();

                            SendToPrinters(PedidoEnviado.NumeCuen);
                            SendToTerminals(PedidoEnviado.NumeCuen);
                            
                            //Devolver pedido completo desglosado para terminales
                            pedidoCompleto.NombreCuenta = PedidoEnviado.NumeCuen;
                            pedidoCompleto.NombreEvento = "PedidoDesglosadoBack";

                            //Send
                            PedidoDesglosadoBack();                            

                            //Reset
                            pedidoCompleto.NombreCuenta = string.Empty;
                            pedidoCompleto.impresoraSalida.Clear();
                            pedidoCompleto.terminalSalida.Clear();
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

            public void PedidoDesglosadoBack()
            {
                // Recorrer lista de clientes conectados
                foreach (DictionaryEntry Item in clientsList)
                {
                    TcpClient broadcastSocket;
                    broadcastSocket = (TcpClient)Item.Value;
                    NetworkStream broadcastStream = broadcastSocket.GetStream();
                    Byte[] broadcastBytes = null;

                    string output = null;
                    output = JsonConvert.SerializeObject(pedidoCompleto);
                    Console.WriteLine(output);
                    broadcastBytes = Encoding.ASCII.GetBytes(output + "$");
                
                    // Mandar mensaje a todos los clientes conectados
                    broadcastStream.Write(broadcastBytes, 0, broadcastBytes.Length);
                    broadcastStream.Flush();
                }
            }
            
            public void SendToPrinters(string NumeCuen)
            {
                //List<ImpresoraSalida> impresoraSalida = new List<ImpresoraSalida>();
                SalidaPedido salidaPedido = new SalidaPedido();
                bool Found = false;
                
                //Recorrer Lineas del pedido
                for (int i = 0; i < PedidoEnviado.dataLinea.Count; i++)
                {
                    Console.WriteLine(PedidoEnviado.dataLinea[i].Descripcion);

                    // Buscar Impresora segun Id Elemento
                    for (int j = 0; j < impresoras.Count; j++)
                    {
                        if (PedidoEnviado.dataLinea[i].IdElemento == impresoras[j].ElementoId)
                        {
                            Console.WriteLine(impresoras[j].NombreImpresora);

                            if (impresoraSalida.Count == 0)
                            {
                                SalidaPedido Linea = new SalidaPedido();
                                Linea.Unids = PedidoEnviado.dataLinea[i].Unids;
                                //Linea.Descripcion = PedidoEnviado.dataLinea[i].Descripcion;
                                Linea.TabLevel = PedidoEnviado.dataLinea[i].TabLevel;
                                Linea.Descripcion = new String('-', 3 * (Linea.TabLevel - 1)) + PedidoEnviado.dataLinea[i].Descripcion;
                                
                                List<SalidaPedido> dataLineas = new List<SalidaPedido>();
                                dataLineas.Add(Linea);

                                impresoraSalida.Add(new ImpresoraSalida()
                                {
                                    NombreImpresora = impresoras[j].NombreImpresora,
                                    dataLinea = dataLineas
                                });
                            }
                            else
                            {
                                Found = false;
                                
                                for (int k = 0; k < impresoraSalida.Count; k++)
                                {
                                    if (impresoras[j].NombreImpresora == impresoraSalida[k].NombreImpresora)
                                    {
                                        //Añado solo linea al detalle
                                        impresoraSalida[k].dataLinea.Add(new SalidaPedido()
                                        {
                                            Unids = PedidoEnviado.dataLinea[i].Unids,
                                            //Descripcion = PedidoEnviado.dataLinea[i].Descripcion,
                                            TabLevel = PedidoEnviado.dataLinea[i].TabLevel,
                                            Descripcion = new String('-', 3 * (PedidoEnviado.dataLinea[i].TabLevel - 1)) + PedidoEnviado.dataLinea[i].Descripcion                                
                                        });
                                        Found = true;
                                        break;
                                    }                                    
                                }
                                if (Found == false)    
                                {
                                    // Impresora nueva y linea al detalle
                                    SalidaPedido Linea = new SalidaPedido();
                                    Linea.Unids = PedidoEnviado.dataLinea[i].Unids;
                                    //Linea.Descripcion = PedidoEnviado.dataLinea[i].Descripcion;
                                    Linea.TabLevel = PedidoEnviado.dataLinea[i].TabLevel;
                                    Linea.Descripcion = new String('-', 3 * (Linea.TabLevel - 1)) + PedidoEnviado.dataLinea[i].Descripcion;
                                    List<SalidaPedido> dataLineas = new List<SalidaPedido>();
                                    dataLineas.Add(Linea);

                                    impresoraSalida.Add(new ImpresoraSalida()
                                    {
                                        NombreImpresora = impresoras[j].NombreImpresora,
                                        dataLinea = dataLineas
                                    });                                        
                                }                                
                            }
                        }
                    }                    
                }                
                pedidoCompleto.impresoraSalida = impresoraSalida;
                //ImprimirPedido(NumeCuen);                
            }

            public void ImprimirPedido(string NumeCuen)
            {
                //Create a PrintDocument object
                PrintDocument pd = new PrintDocument();

                //pd.PrintPage += (sender, args) => pd_ImprimirEnvio(NumeCuen,args.Graphics);

                for ( IndexImpresora = 0; IndexImpresora < impresoraSalida.Count; IndexImpresora++)
                {
                    pd.PrintPage += (sender, args) => pd_ImprimirEnvio(NumeCuen, args.Graphics);
                    
                    //Set PrinterName name
                    pd.PrinterSettings.PrinterName = "Cocina"; //impresoraSalida[IndexImpresora].NombreImpresora;

                    int rows = impresoraSalida[IndexImpresora].dataLinea.Count;
                    
                    pd.DefaultPageSettings.PaperSize = new PaperSize("Ticket",400,(rows+2)*28);
                    
                    //Print the document
                    pd.Print();

                    pd.Dispose();                    
                }

                //Reset
                //impresoraSalida.Clear();
            }

            //The PrintPage event handler 
            public void pd_ImprimirEnvio(string NumeCuen, Graphics graphics)
            {
                int y = 0;
                List<SalidaPedido> salidaPedido = new List<SalidaPedido>();
                salidaPedido = impresoraSalida[IndexImpresora].dataLinea;
                
                //Get the Graphics object
                Graphics g = graphics;                

                //Create a font Arial with size 16
                Font font = new Font("Courier New",16,FontStyle.Bold);
                
                //Create a solid brush with black color
                SolidBrush brush = new SolidBrush(Color.Black);

                //Cabecera
                string cabecera = "N:" + NumeCuen + " " + DateTime.Now.ToString("HH:mm");
                g.DrawString(cabecera, font, brush, new Rectangle(0, y, 200, 28));
                y = y + 28;    
                
                for (int i = 0; i < salidaPedido.Count; i++)
                {
                    string cUnids = salidaPedido[i].Unids.ToString();
                    int LongUnids = salidaPedido[i].Unids.ToString().Length;
                    int Spaces = 5 - LongUnids;
                    cUnids = new String(' ', Spaces) + cUnids;

                    int TabLavel = salidaPedido[i].TabLevel;
                    string TabSpace = new String(' ', (TabLavel-1) * 3);
                    //Draw 
                    g.DrawString(cUnids + " " + salidaPedido[i].Descripcion, font, brush, new Rectangle(0, y, 400, 28));
                    y = y + 28;
                }            
            }

            public void SendToTerminals(string NumeCuen)
            {
                List<TerminalSalida> terminalSalida = new List<TerminalSalida>();
                SalidaPedido salidaPedido = new SalidaPedido();
                bool Found = false;
                
                //Recorrer Lineas del pedido
                for (int i = 0; i < PedidoEnviado.dataLinea.Count; i++)
                {
                    Console.WriteLine(PedidoEnviado.dataLinea[i].Descripcion);

                    // Buscar Terminal segun Id Elemento
                    for (int j = 0; j < terminales.Count; j++)
                    {
                        if (PedidoEnviado.dataLinea[i].IdElemento == terminales[j].ElementoId)
                        {
                            Console.WriteLine(terminales[j].NombreTerminal);

                            if (terminalSalida.Count == 0)
                            {
                                SalidaPedido Linea = new SalidaPedido();
                                Linea.Unids = PedidoEnviado.dataLinea[i].Unids;
                                //Linea.Descripcion = PedidoEnviado.dataLinea[i].Descripcion;
                                Linea.TabLevel = PedidoEnviado.dataLinea[i].TabLevel;
                                Linea.Descripcion = new String('-', 3 * (Linea.TabLevel - 1)) + PedidoEnviado.dataLinea[i].Descripcion;
                                
                                List<SalidaPedido> dataLineas = new List<SalidaPedido>();
                                dataLineas.Add(Linea);

                                terminalSalida.Add(new TerminalSalida()
                                {
                                    NombreTerminal = terminales[j].NombreTerminal,
                                    dataLinea = dataLineas
                                });
                            }
                            else
                            {
                                Found = false;
                                
                                for (int k = 0; k < terminalSalida.Count; k++)
                                {
                                    if (terminales[j].NombreTerminal == terminalSalida[k].NombreTerminal)
                                    {
                                        //Añado solo linea al detalle
                                        terminalSalida[k].dataLinea.Add(new SalidaPedido()
                                        {
                                            Unids = PedidoEnviado.dataLinea[i].Unids,
                                            //Descripcion = PedidoEnviado.dataLinea[i].Descripcion
                                            TabLevel = PedidoEnviado.dataLinea[i].TabLevel,
                                            Descripcion = new String('-', 3 * (PedidoEnviado.dataLinea[i].TabLevel - 1)) + PedidoEnviado.dataLinea[i].Descripcion                                         
                                        });
                                        Found = true;
                                        break;
                                    }                                    
                                }
                                if (Found == false)    
                                {
                                    // Terminal nueva y linea al detalle
                                    SalidaPedido Linea = new SalidaPedido();
                                    Linea.Unids = PedidoEnviado.dataLinea[i].Unids;
                                    //Linea.Descripcion = PedidoEnviado.dataLinea[i].Descripcion;
                                    Linea.TabLevel = PedidoEnviado.dataLinea[i].TabLevel;
                                    Linea.Descripcion = new String('-', 3 * (Linea.TabLevel -1 )) + PedidoEnviado.dataLinea[i].Descripcion;
                                
                                    List<SalidaPedido> dataLineas = new List<SalidaPedido>();
                                    dataLineas.Add(Linea);

                                    terminalSalida.Add(new TerminalSalida()
                                    {
                                        NombreTerminal = terminales[j].NombreTerminal,
                                        dataLinea = dataLineas
                                    });                                        
                                }                                
                            }
                        }
                    }                    
                }
                pedidoCompleto.terminalSalida = terminalSalida;
            }

            public void GuardarPedido()
            {
                string connectionString = ConfigurationManager.ConnectionStrings["AmbrosiaBD"].ConnectionString;
                MySqlConnection conn = new MySqlConnection(connectionString);
                conn.Open();
                
                MySqlTransaction MyTransaction = conn.BeginTransaction();
                MySqlCommand MyCommand = new MySqlCommand();
                MyCommand.Transaction = MyTransaction;
                MyCommand.Connection = conn;

                try
                {
                    DateTime time = DateTime.Now;              
                    string format = "yyyy-MM-dd HH:mm:ss";
                    int NumeElem = PedidoEnviado.dataLinea.Count;
                    string NombCuen = PedidoEnviado.NumeCuen;
                    
                    MyCommand.CommandText = "INSERT INTO lotes(Momento,NumeElem,NombCuen) VALUES ('" + time.ToString(format) + "'," + NumeElem + ",'" + NombCuen + "')"; 
                    MyCommand.ExecuteNonQuery();
                    int LastLoteId = (int)MyCommand.LastInsertedId;
                    Console.WriteLine("Id lote:" + LastLoteId);
                    
                    int LastFactId = 0;
                    MySqlCommand comando = new MySqlCommand("SELECT FacturaId FROM facturas WHERE Sesion=1 AND Estado='A' AND Nombre='" + NombCuen + "'",conn,MyTransaction);
                    MySqlDataReader reader = comando.ExecuteReader();
                    if (reader.HasRows)
                    {                        
                        reader.Read();
                        Console.WriteLine("La factura existe:" + reader[0]);
                        LastFactId = reader.GetInt32(0);
                        reader.Close();
                    }
                    else
                    {
                        reader.Close();
                        Console.WriteLine("La factura no existe");
                        MySqlCommand comando2 = new MySqlCommand("INSERT INTO facturas(Nombre,FechaHora) VALUES ('" + NombCuen + "','" + time.ToString(format) + "')",conn,MyTransaction);
                        comando2.ExecuteNonQuery();                        
                        LastFactId = (int)comando2.LastInsertedId;
                        Console.WriteLine("Nuevo Id factura:" + LastFactId);
                    }                                        
                    
                    string Command = string.Empty;
                    for (int i = 0; i < PedidoEnviado.dataLinea.Count; i++)
                    {                        
                        Command = Command + "(" + LastFactId + "," + PedidoEnviado.dataLinea[i].Unids + ",'"
                            + PedidoEnviado.dataLinea[i].Descripcion + "','" + PedidoEnviado.dataLinea[i].Precio + "','"
                            + PedidoEnviado.dataLinea[i].Impuesto + "'," + PedidoEnviado.dataLinea[i].ImprimirEnFactura + ","
                            + LastLoteId + "," + PedidoEnviado.dataLinea[i].TabLevel + "),";
                    }
                    Command = Command.TrimEnd(',');
                    MyCommand.CommandText = "INSERT INTO detafact(FacturaId,Unidades,Descripcion,Precio,Impuesto,ImpEnFac,LoteId,TabLevel) VALUES " + Command;
                    MyCommand.ExecuteNonQuery();
                    MyTransaction.Commit();
                }
                catch (Exception e)
                {
                    try
                    {
                        MyTransaction.Rollback();
                    }
                    catch (MySqlException ex)
                    {
                        if (MyTransaction.Connection != null)
                        {
                            Console.WriteLine("An exception of type " + ex.GetType() +
                            " was encountered while attempting to roll back the transaction.");
                        }
                    }
                    Console.WriteLine("An exception of type " + e.GetType() +
                    " was encountered while inserting the data.");
                    Console.WriteLine("Neither record was written to database.");                    
                }
                finally
                {
                    conn.Close();
                }
            }
        }    
    }
}
