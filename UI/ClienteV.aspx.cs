using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace UI
{
    public partial class ClienteV : System.Web.UI.Page
    {
        cClientes Datos = new cClientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana Clientes";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string msj;
                msj = Datos.InsertarCliente(Convert.ToInt32(TextBox1.Text), TextBox2.Text, TextBox4.Text, txtEdad.Text, Convert.ToInt32(txtTelefono.Text) , 0, "", "");

                Response.Redirect("Cliente.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ListaClientes.SelectCommand = "SELECT ID_Cliente, NIT, Nombre, Apellidos, Direccion, Telefono FROM Cliente WHERE (Estado = 1) AND (Nombre LIke '%" + TextBox3.Text + "%') OR (NIT like '%" + TextBox3.Text + "%')";
            ListaClientes.DataBind();
        }
    }
}