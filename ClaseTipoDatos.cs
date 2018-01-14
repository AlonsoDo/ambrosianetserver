﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AmbrosiaServer
{
    class EventoDesconectar
    {
        public string NombreEvento { get; set; }
        public string IdCliente { get; set; }
    }

    class EventoAskForElements
    {
        public string NombreEvento { get; set; }
        public int PadreId { get; set; }
    }
    
    public class Evento
    {
        public string NombreEvento { get; set; }
    }

    public class Elemento
    {
        public int ElementoId { get; set; }
        public int PadreId { get; set; }
        public string Descripcion { get; set; }
        public string PathImg { get; set; }
        public int Final { get; set; }
        public decimal Precio { get; set; }
        public decimal Impuesto { get; set; }
    }

    public class GetElementsData
    {
        public string NombreEvento { get; set; }
        public List<Elemento> data { get; set; }
    }

    public class Impresoras
    {
        public int ElementoId { get; set; }
        public string NombreImpresora { get; set; }
    }

    public class Terminales
    {
        public int ElementoId { get; set; }
        public string NombreTerminal { get; set; }
    }
    
}
