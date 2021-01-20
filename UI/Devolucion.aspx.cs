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
    public partial class Devolucion : System.Web.UI.Page
    {
        cClientes datos = new cClientes();
        Cproducto datos2 = new Cproducto();
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana devolucion de productos";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // DataTable tl = new DataTable();

           // tl = datos.ListaUncliente()
        }
        private static string Totalprod, IDdetalleVenta, precio, idStock, totalDirecto;

        private static string idCredito = "0";
        private static decimal precioProdConDescuento;
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = GridView1.SelectedRow;
            Label1.Text = fila.Cells[3].Text;
            Label2.Text = fila.Cells[4].Text;
            TextBox2.Text = fila.Cells[6].Text;
            Totalprod = fila.Cells[6].Text;
            precio = fila.Cells[5].Text;
            idStock= fila.Cells[9].Text;
            IDdetalleVenta = fila.Cells[8].Text;
            idCredito =  fila.Cells[10].Text;
            totalDirecto = fila.Cells[7].Text;
            precioProdConDescuento =  Convert.ToDecimal(totalDirecto) / Convert.ToDecimal( Totalprod);
            Button2_ModalPopupExtender.Show();
        }
            int SubtotalProd;
                decimal totalPrecio;
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
               
                if (Convert.ToInt32(TextBox2.Text) > Convert.ToInt32(Totalprod))
                {
                    Response.Write("<script>alert('El valor ingresado es mayor al total del producto en el sistema')</script>");
                }
                else
                {
                    if (Convert.ToInt32(Totalprod) == Convert.ToInt32(TextBox2.Text))
                    {
                        //  SubtotalProd = Convert.ToInt32(Totalprod) - Convert.ToInt32(TextBox2.Text);
                        try
                        {
                            totalPrecio = Convert.ToDecimal(precio) * Convert.ToDecimal(SubtotalProd);
                            SqlDataSource2.UpdateParameters["Monto"].DefaultValue = totalDirecto;
                            SqlDataSource2.UpdateParameters["SaldoPendiente"].DefaultValue = totalDirecto;
                            SqlDataSource2.UpdateParameters["ID_Credito"].DefaultValue = idCredito;
                            SqlDataSource2.Update();
                            SqlDataSource2.DeleteParameters["ID_Credito"].DefaultValue = idCredito;
                            SqlDataSource2.DeleteParameters["ID_Existencia"].DefaultValue = idStock;
                            SqlDataSource2.Delete();
                        }
                        catch
                        {
                           
                        }
                        datos2.EliminarDetallV(Convert.ToInt32(IDdetalleVenta), Convert.ToInt32(Totalprod), Convert.ToInt32(idStock));
                        SqlDataSource1.SelectParameters["ID_Venta"].DefaultValue = TextBox1.Text;
                        SqlDataSource1.DataBind();
                        Label3.Text = "Se ha devuelto: " + TextBox2.Text + " productos con exitos!";
                    }
                    else
                    {
                        decimal totalCredito = 0;
                        
                            SubtotalProd = Convert.ToInt32(Totalprod) - Convert.ToInt32(TextBox2.Text);
                            totalPrecio = Convert.ToDecimal(precioProdConDescuento) * Convert.ToDecimal(SubtotalProd);
                       
                            datos2.EditarDetalleVenta(SubtotalProd, totalPrecio, Convert.ToInt32(IDdetalleVenta));
                            datos2.EditarStockDevol(Convert.ToInt32(TextBox2.Text), Convert.ToInt32(idStock));
                        try
                        {
                            totalCredito = precioProdConDescuento * Convert.ToDecimal(TextBox2.Text);
                            SqlDataSource2.UpdateParameters["Monto"].DefaultValue = totalCredito.ToString();
                            SqlDataSource2.UpdateParameters["SaldoPendiente"].DefaultValue = totalCredito.ToString();
                            SqlDataSource2.UpdateParameters["ID_Credito"].DefaultValue = idCredito;
                            SqlDataSource2.Update();
                        }
                        catch
                        {

                        }
                        SqlDataSource1.SelectParameters["ID_Venta"].DefaultValue = TextBox1.Text;
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