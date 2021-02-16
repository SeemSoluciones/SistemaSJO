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
            Label9.Text = CajaV.motorista;
            Label8.Text = Session["Nombre"].ToString();
            if (CajaV.TipoFactura == 1)
            {
                GridView1.Visible = true;
                GridView2.Visible = false;
                SqlDataSource1.SelectParameters["idVenta"].DefaultValue = CajaV.msj;
                SqlDataSource1.DataBind();
            }
            else if (CajaV.TipoFactura == 2)
            {
                GridView2.Visible = true;
                GridView1.Visible = false;
                SqlDataSource2.SelectParameters["ID_Cotizacion"].DefaultValue = CajaV.idCoti;
                SqlDataSource2.DataBind();
            }
            else
            {
                GridView1.Visible = true;
                GridView2.Visible = false;
                SqlDataSource1.SelectParameters["idVenta"].DefaultValue = CajaV.msj;
                SqlDataSource1.DataBind();
            }
        }
        decimal subtotal, descuento, total;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                subtotal = subtotal + (Convert.ToDecimal(e.Row.Cells[0].Text) * Convert.ToDecimal(e.Row.Cells[3].Text));
                descuento = descuento + Convert.ToDecimal(e.Row.Cells[4].Text);
                //total = subtotal - descuento;
            }
            // descuento = descuento;
            total = subtotal - descuento;
            Label1.Text = subtotal.ToString();
            Label2.Text = descuento.ToString();
            Label3.Text = total.ToString();
        }
    }
}