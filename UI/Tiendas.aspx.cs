using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace UI
{
    public partial class Tiendas : System.Web.UI.Page
    {
        Gestion Datos = new Gestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana Tiendas";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string msj = "";
                msj = Datos.InsertarTienda(TextBox1.Text, Convert.ToInt32(TextBox2.Text), TextBox3.Text);
                Response.Write("<script>alert('"+msj+"')</script>");
                Response.Redirect("Tiendas.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, Datos no ingresados')</script>");
            }
        }
    }
}