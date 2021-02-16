using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UI
{
    public partial class DevolucionEntregaD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Digitador.Mensaje = "Cambio por devolucion";
        }

        protected void OnClick_LinkButton1(object sender, EventArgs e)
        {
            GridViewRow tabla = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            //IdProducto = ((Label)tabla.FindControl("Label1")).Text.ToString();
            SqlDataSource10.SelectParameters["ID_Existencia"].DefaultValue = ((Label)tabla.FindControl("Label7")).Text.ToString();
            SqlDataSource10.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader PRECIOPROD;
            PRECIOPROD = (SqlDataReader)SqlDataSource10.Select(DataSourceSelectArguments.Empty);
            if (PRECIOPROD.Read())
            {
                precioProducto = PRECIOPROD["PrecioUnitario"].ToString();
            }

            SqlDataSource10.InsertParameters["Cantidad"].DefaultValue = ((Label)tabla.FindControl("Label4")).Text.ToString();
            SqlDataSource10.InsertParameters["Precio"].DefaultValue = precioProducto;
            SqlDataSource10.InsertParameters["Total"].DefaultValue = (Convert.ToDecimal(precioProducto) * Convert.ToDecimal(((Label)tabla.FindControl("Label4")).Text.ToString())).ToString();
            SqlDataSource10.InsertParameters["ID_Existencia"].DefaultValue = ((Label)tabla.FindControl("Label7")).Text.ToString();
            SqlDataSource10.InsertParameters["ID_Compra"].DefaultValue = ((Label)tabla.FindControl("Label10")).Text.ToString();
            SqlDataSource10.Insert();

            SqlDataSource10.UpdateParameters["ID_DevPro"].DefaultValue = ((Label)tabla.FindControl("Label1")).Text.ToString();
            SqlDataSource10.UpdateParameters["Cantidad"].DefaultValue = ((Label)tabla.FindControl("Label4")).Text.ToString();
            SqlDataSource10.UpdateParameters["ID_Existencia"].DefaultValue = ((Label)tabla.FindControl("Label7")).Text.ToString();
            SqlDataSource10.Update();

            Response.Redirect("DevolucionEntregaD.aspx");

        }
        string precioProducto;
        protected void OnClick_LinkButton2(object sender, EventArgs e)
        {

            GridViewRow tabla = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            SqlDataSource1.UpdateParameters["ID_DevPro"].DefaultValue = ((Label)tabla.FindControl("Label1")).Text.ToString();
            SqlDataSource1.Update();
            Response.Redirect("DevolucionEntregaD.aspx");
        }
    }
}