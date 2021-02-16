using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class AsignacionMotorista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(DropDownList9.SelectedValue == "0")
            {
                Response.Write("<script>alert('Error, favor de seleccionar un motorista!')</script>");
            }
            else
            {
              int msj = 0;
            SqlDataSource1.UpdateParameters["ID_Cotizacion"].DefaultValue = DropDownList2.SelectedValue;
            SqlDataSource1.UpdateParameters["ID_Empleado"].DefaultValue = DropDownList9.SelectedValue;
            msj = SqlDataSource1.Update();
            if (msj > 0)
            {

                Response.Write("<script>alert('Entrega exitosa!')</script>");
                Response.Redirect("AsignacionMotorista.aspx");

            }
            else
            {
                Response.Write("<script>alert('Error, no se realizo cambio en la Base de datos!')</script>");
            }
            }
          
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList9.Enabled = true;
            Button1.Enabled = true;
        }
    }
}