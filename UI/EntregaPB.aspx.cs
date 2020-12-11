using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace UI
{
    public partial class EntregaPB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource2.SelectParameters["IDtienda"].DefaultValue = Session["IdTienda"].ToString();
            SqlDataSource2.DataBind();
            SqlDataSource3.SelectParameters["IdTienda"].DefaultValue = Session["IdTienda"].ToString();
            SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader totalP;
            totalP = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if(totalP.Read())
            {
                Label1.Text = totalP["total"].ToString();
            }
            
        }


        string _estado;

        protected void Unnamed1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int msj = 0;
            SqlDataSource1.UpdateParameters["ID_Venta"].DefaultValue = DropDownList1.SelectedValue;
           msj = SqlDataSource1.Update();
            if(msj > 0)
            {
               
                Response.Write("<script>alert('Entrega exitosa!')</script>");
                Response.Redirect("EntregaPB.aspx");
             
            }
            else
            {
                Response.Write("<script>alert('Error, no se realizo cambio en la Base de datos!')</script>");
            }
            //   SqlDataSource2.SelectCommand = "SELECT DISTINCT Venta.ID_Venta, 'ID Venta' + ': '+ CAST(Venta.ID_Venta AS nvarchar) +' - '+ Cliente.Nombre + ' ' + Cliente.Apellidos AS Cliente FROM Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta inner join Cliente on Venta.ID_Cliente = Cliente.ID_Cliente WHERE (Estados.ID_Tienda = "+ Session["IdTienda"].ToString()+") AND Estados.EstadoBodega = 1";
            SqlDataSource2.DataBind();
            SqlDataSource3.SelectParameters["IdTienda"].DefaultValue = Session["IdTienda"].ToString();
            SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader totalP;
            totalP = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (totalP.Read())
            {
                Label1.Text = totalP["total"].ToString();
            }
        }

        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Button1.Enabled = true;
        //    SqlDataSource1.SelectParameters["ID_Venta"].DefaultValue = DropDownList1.SelectedValue;
        //    SqlDataSource1.DataBind();
        //}
    }
}