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
    public partial class RegistroV : System.Web.UI.Page
    {
        Empleado datos = new Empleado();
        DataTable tabla = new DataTable();
        string idUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            Vendedor.Mensaje = "Ventana Registro";
            string idEmp;
            idEmp = Session["IdEmpleado"].ToString();
            tabla = datos.BuscarUsuario2(Convert.ToInt32(idEmp));
            usuario.Value = tabla.Rows[0][1].ToString();
            idUser = tabla.Rows[0][0].ToString();
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                if (contra1.Value == contra2.Value)
                {
                    datos.EditarUsuario(usuario.Value, contra1.Value, Convert.ToInt32(idUser));
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Las contraseñas no coinciden')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }
        }
    }
}