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
    public partial class Empleados : System.Web.UI.Page
    {
        Empleado datos = new Empleado();
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana Empleados";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                datos.InsertarEmpleado(user.Text, contra.Text, Convert.ToInt32(DropDownList3.SelectedValue), nombre.Text, apellido.Text, Convert.ToInt64( dpi.Text), direccion.Text, Convert.ToInt32( telefono.Text), Convert.ToInt32(DropDownList2.SelectedValue));
                Response.Redirect("Empleados.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ListaEmpleado.SelectCommand = "SELECT Empleado.ID_Empleado, Empleado.Nombre, Empleado.Apellidos, Empleado.DPI, Empleado.Telefono, Tienda.Tienda, Rol.Rol, Empleado.Direccion FROM Empleado INNER JOIN Tienda ON Empleado.ID_Tienda = Tienda.ID_Tienda INNER JOIN Usuario ON Empleado.ID_Usuario = Usuario.ID_Usuario INNER JOIN Rol ON Usuario.ID_Rol = Rol.ID_Rol WHERE (Empleado.Estado = 1) AND (Empleado.Nombre like '%" + TextBox3.Text + "%')";
            ListaEmpleado.DataBind();
        }

    }
}