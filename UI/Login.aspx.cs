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
    public partial class Login1 : System.Web.UI.Page
    {
        Empleado Datos = new Empleado();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable tabla = new DataTable();
            //string dato1 = Datos.MuestraUser(txtUsuario.Text);
            //string dato2 = Datos.MuestraContra(TextBox1.Text);
            int usuario = Datos.Usuario(txtUsuario.Text, TextBox1.Text);
            if (usuario > 0)
            {
                 tabla = Datos.BuscarUsuario(txtUsuario.Text, TextBox1.Text);
                Session["Nombre"] = tabla.Rows[0][1].ToString() + "  " + tabla.Rows[0][2].ToString();
                Session["IDtienda"] = tabla.Rows[0][5].ToString();
                Session["IdEmpleado"] = tabla.Rows[0][0].ToString();
                Session["Tienda"] = tabla.Rows[0][3].ToString();
                Session["Rol"] = tabla.Rows[0][4].ToString();
                //  Response.Redirect("/PanelPricipal.aspx");
                if (tabla.Rows[0][4].ToString() == "Admin" || tabla.Rows[0][4].ToString() == "Administrador")
                {
                    Response.Redirect("/PanelPricipal.aspx");
                }
                else if (tabla.Rows[0][4].ToString() == "Vendedor" || tabla.Rows[0][4].ToString() == "Mostrador")
                {
                    Response.Redirect("CajaV.aspx");
                }
                else if (tabla.Rows[0][4].ToString() == "Digitador")
                {
                    Response.Redirect("CompraD.aspx");
                }
                else if (tabla.Rows[0][4].ToString() == "Bodega" || tabla.Rows[0][4].ToString() == "Bodegero")
                {
                    Response.Redirect("EntregaPB.aspx");
                }
                else if(tabla.Rows[0][4].ToString()  == "Caja" || tabla.Rows[0][4].ToString() == "Cajero")
                {
                Response.Redirect("CajaCobrador.aspx");
                }
               
            }
            else

            {

                Response.Write("<script>alert('Usuario incorrecto')</script>");

            }

        }

    }   
}