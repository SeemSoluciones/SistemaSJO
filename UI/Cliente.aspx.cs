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
    public partial class Cliente : System.Web.UI.Page
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
                msj = Datos.InsertarCliente(Convert.ToInt32(TextBox1.Text), TextBox2.Text, TextBox4.Text, txtEdad.Text, Convert.ToInt32(txtTelefono.Text), Convert.ToInt32(TextBox5.Text), TextBox6.Text, TextBox7.Text,Convert.ToDecimal(TextBox8.Text));
               
                Response.Redirect("Cliente.aspx");
             }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }

          }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                ListaClientes.SelectCommand = "SELECT ID_Cliente, NIT, Nombre, Apellidos, Direccion, Telefono, Celular, Empresa, Correo FROM Cliente WHERE (Estado = 1) AND (Nombre LIke '%" + TextBox3.Text + "%' OR NIT like '%" + TextBox3.Text + "%')";
                ListaClientes.DataBind();
            }
            catch
            {
                Response.Write("<script>alert('Ingrese algun dato valido!')</script>");
            }
        }
    }
}
