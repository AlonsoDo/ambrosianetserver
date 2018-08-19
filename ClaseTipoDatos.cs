using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

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
        public int ImprimirEnFactura { get; set; }
        public int ImprimirEnComanda { get; set; }
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

    public class LineaPedido
    {
        public int IdElemento { get; set; }
        public int Unids { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public decimal Impuesto { get; set; }
        public int ImprimirEnFactura { get; set; }
        public int ImprimirEnComanda { get; set; }
        public int TabLevel { get; set; }
    }

    public class Envio
    {
        public string NombreEvento { get; set; }
        public string NumeCuen { get; set; }
        public List<LineaPedido> dataLinea { get; set; }
    }

    public class SalidaPedido
    {
        public int Unids { get; set; }
        public string Descripcion { get; set; }
        public int TabLevel { get; set; }
    }

    public class ImpresoraSalida
    {
        public string NombreImpresora { get; set; }
        public List<SalidaPedido> dataLinea { get; set; }
    }

    public class TerminalSalida
    {
        public string NombreTerminal { get; set; }
        public List<SalidaPedido> dataLinea { get; set; }
    }

    public class PedidoCompleto
    {
        public string NombreEvento { get; set; }
        public string NombreCuenta { get; set; }
        public List<ImpresoraSalida> impresoraSalida { get; set; }
        public List<TerminalSalida> terminalSalida { get; set; }
    }

    public class ImpresorasTer
    {
        public string NombreImpresora { get; set; }
    }

    public class ListaImpresorasTer
    {
        public string NombreEvento { get; set; }
        public List<ImpresorasTer> impresorasTer { get; set; }
    }

    public class TerminalesTer
    {
        public string NombreTerminal { get; set; }
    }

    public class ListaTerminalesTer
    {
        public string NombreEvento { get; set; }
        public List<TerminalesTer> terminalesTer { get; set; }
    }

    public class ImpresorasTerminales
    {
        public string NombreEvento { get; set; }
        public List<ImpresorasTer> impresorasTer { get; set; }
        public List<TerminalesTer> terminalesTer { get; set; }
    }

    public class EventoCargarPedidosDesde
    {
        public string NombreEvento { get; set; }
        public int IndexDesde { get; set; }
    }

    public class CargarDetallePedidos
    {
        public string NombreEvento { get; set; }
        public List<DetallePedidos> detallePedidos { get; set; }
    }

    public class DetallePedidos
    {
        public int LoteId { get; set; }
        public DateTime Momento { get; set; }
        public string NombCuen { get; set; }
        public int Unidades { get; set; }
        public string Descripcion { get; set; }
        public int TabLevel { get; set; }
    }

    public class Cliente
    {
        public int ClienteId { get; set; }
        public string NombreComercial { get; set; }
        public string NombreFiscal { get; set; }
        public string Direccion { get; set; }
        public string NIF { get; set; }
        public string Mobil { get; set; }
        public string Fijo { get; set; }
        public bool Borrado { get; set; }
    }

    public class SalvarCliente
    {
        public string NombreEvento { get; set; }
        public Cliente cliente { get; set; }
    }

    public class ClienteId
    {
        public string NombreEvento { get; set; }
        public int clienteId { get; set; }
    }

    public class ClienteIdBak
    {
        public string NombreEvento { get; set; }
        public int clienteId { get; set; }
    }

    public class ComoBuscarCliente
    {
        public string NombreEvento { get; set; }
        public string Orden { get; set; }
        public string CadenaBusqueda { get; set; }
        public int Index { get; set; }
        public bool Filtrar { get; set; }
        public bool BtUltimoCliente { get; set; }
    }

    public class BuscarClienteBak
    {
        public string NombreEvento { get; set; }
        public List<Cliente> listaClientes { get; set; }
        public int IndiceCliente { get; set; }
        public int IndiceAbsoluto { get; set; }
    }

    public class NumeroCuenta
    {
        public string NombreEvento { get; set; }
        public string NumeCuenta { get; set; }
    }

    public class LineaDetalleFactura
    {
        public int FacturaId { get; set; }
        public int Unidades { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public decimal Impuesto { get; set; }
        public int ImpEnFac { get; set; }
        public int LoteId { get; set; }
        public int TabLevel { get; set; }
    }

    public class Factura
    {
        public string NombreEvento { get; set; }
        public string Estado { get; set; }
        public BindingList<LineaDetalleFactura> listaDetalleFactura { get; set; }
    }

    public class RecargarFacturas
    {
        public string NombreEvento { get; set; }
        public bool Abiertas { get; set; }
        public bool Pendientes { get; set; }
        public bool Cerradas { get; set; }
    }

    public class DatosFactura
    {
        public string Nombre { get; set; }
        public string Estado { get; set; }
        public string FormaPago { get; set; }
        public decimal Total { get; set; }
        public decimal Cantidad { get; set; }
        public decimal Cambio { get; set; }
        public string FechaHora { get; set; }
    }

    public class DatosFacturas
    {
        public string NombreEvento { get; set; }
        public BindingList<DatosFactura> datosFacturas { get; set; }
    }

    public class PasarAPendiente
    {
        public string NombreEvento { get; set; }
        public string NombreFactura { get; set; }
    }

    public class CerrarCuenta
    {
        public string NombreEvento { get; set; }
        public string NombreFactura { get; set; }
        public Decimal Total { get; set; }
        public Decimal Entrega { get; set; }
        public Decimal Cambio { get; set; }
        public string FormaPago { get; set; }
    }
}
