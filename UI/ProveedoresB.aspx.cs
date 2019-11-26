using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace UI
{
    public partial class ProveedoresB : System.Web.UI.Page
    {
        Cproducto Datos = new Cproducto();
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana Proveedores";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                int SiExiste = Datos.SiExisteProveedor(TextBox6.Text);
                string msj;
                if (SiExiste > 0)
                {
                    Response.Write("<script>alert('Este codigo del producto ya existe!')</script>");
                }
                else
                {
                    msj = Datos.nuevoProvedor(TextBox6.Text, TextBox2.Text, TextBox3.Text, Convert.ToInt32(TextBox5.Text), Convert.ToInt32(TextBox1.Text));
                    // Response.Close();
                    Response.Redirect("ProveedoresB.aspx");
                }
            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT ID_Proveedor, Proveedor, Direccion, Telefono, NIT FROM Proveedor WHERE (Estado = 1)  AND (Proveedor LIke '%" + TextBox4.Text + "%')";
            SqlDataSource1.DataBind();
        }
    }
}