using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace UI
{
    public partial class TipoDePago : System.Web.UI.Page
    {
        Gestion Datos = new Gestion();
         
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string msj = "";
                msj = Datos.InsertarTipoPago(TextBox1.Text);
                Response.Write("<script>alert('"+ msj+"')</script>");
                Response.Redirect("TipoDePago.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, Datos no ingresados')</script>");
            }
        }
    }
}