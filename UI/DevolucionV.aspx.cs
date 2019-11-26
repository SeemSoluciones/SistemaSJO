using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

namespace UI
{
    public partial class DevolucionV : System.Web.UI.Page
    {
        cClientes datos = new cClientes();
        Cproducto datos2 = new Cproducto();
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana devolucion de productos";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable tl = new DataTable();

            // tl = datos.ListaUncliente()
        }
        private static string Totalprod, IDdetalleVenta, precio, idStock;
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = GridView1.SelectedRow;
            Label1.Text = fila.Cells[3].Text;
            Label2.Text = fila.Cells[4].Text;
            TextBox2.Text = fila.Cells[6].Text;
            Totalprod = fila.Cells[6].Text;
            precio = fila.Cells[5].Text;
            idStock = fila.Cells[9].Text;
            IDdetalleVenta = fila.Cells[8].Text;
            Button2_ModalPopupExtender.Show();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                int SubtotalProd;
                decimal totalPrecio;
                if (Convert.ToInt32(TextBox2.Text) > Convert.ToInt32(Totalprod))
                {
                    Response.Write("<script>alert('El valor ingresado es mayor al total del producto en el sistema')</script>");
                }
                else
                {
                    if (Convert.ToInt32(Totalprod) == Convert.ToInt32(TextBox2.Text))
                    {
                        datos2.EliminarDetallV(Convert.ToInt32(IDdetalleVenta), Convert.ToInt32(Totalprod), Convert.ToInt32(idStock));
                        SqlDataSource1.SelectCommand = "SELECT Venta.ID_Venta, Venta.NoFac_Pref, Venta.Fecha, Producto.Codigo, Producto.Producto, DetalleVenta.PrecioUnitario, DetalleVenta.Cantidad, DetalleVenta.Total, DetalleVenta.ID_DetalleVenta FROM Producto INNER JOIN DetalleVenta ON Producto.Codigo = DetalleVenta.Codigo INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta WHERE Venta.ID_Venta =" + TextBox1.Text;
                        SqlDataSource1.DataBind();
                        Label3.Text = "Se ha devuelto: " + TextBox2.Text + " productos con exitos!";
                    }
                    else
                    {
                        SubtotalProd = Convert.ToInt32(Totalprod) - Convert.ToInt32(TextBox2.Text);
                        totalPrecio = Convert.ToDecimal(precio) * Convert.ToDecimal(SubtotalProd);
                        datos2.EditarDetalleVenta(SubtotalProd, totalPrecio, Convert.ToInt32(IDdetalleVenta));
                        //datos2.EditarStockDevol(Convert.ToInt32(TextBox2.Text), Convert.ToInt32(idStock));
                        SqlDataSource1.SelectCommand = "SELECT Venta.ID_Venta, Venta.NoFac_Pref, Venta.Fecha, Producto.Codigo, Producto.Producto, DetalleVenta.PrecioUnitario, DetalleVenta.Cantidad, DetalleVenta.Total, DetalleVenta.ID_DetalleVenta FROM Producto INNER JOIN DetalleVenta ON Producto.Codigo = DetalleVenta.Codigo INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta WHERE Venta.ID_Venta =" + TextBox1.Text;
                        SqlDataSource1.DataBind();
                        Label3.Text = "Se ha devuelto: " + TextBox2.Text + " productos con exitos!";


                    }
                }
            }
            catch
            {
                Response.Write("<script>alert('Hay un error!')</script>");

            }
        }
    }
}