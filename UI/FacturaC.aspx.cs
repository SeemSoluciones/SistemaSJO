using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class FacturaC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Text = DateTime.Now.ToString("dd/MM/yyyy");
            Label6.Text = DateTime.Now.ToString("dd/MM/yyyy");
            Label5.Text = CajaV.msj;
            Nombre.Text = CajaV.nombre;
            nit.Text = CajaV.nit;
            Dire.Text = CajaV.ciudad;
            Label7.Text = CajaV.Pago;
            SqlDataSource1.SelectCommand = "Select DetalleVenta.Cantidad, DetalleVenta.Codigo, Producto.Codigo2, Producto.Producto + ' ' + Producto.Descripcion as Producto, DetalleVenta.PrecioUnitario , DetalleVenta.Total from venta inner join DetalleVenta on Venta.ID_Venta = DetalleVenta.ID_Venta inner join Producto on DetalleVenta.Codigo = Producto.Codigo Where Venta.ID_Venta =" + CajaV.msj;
            SqlDataSource1.DataBind();
        }
        decimal subtotal, descuento, total;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                subtotal = subtotal + Convert.ToDecimal(e.Row.Cells[5].Text);
                //descuento = descuento + Convert.ToDecimal(e.Row.Cells[4].Text);
                //total = subtotal - descuento;
            }
            descuento = Caja.descuentoFactura;
            total = subtotal - descuento;
            Label1.Text = subtotal.ToString();
            Label2.Text = descuento.ToString();
            Label3.Text = total.ToString();
        }
    }
}