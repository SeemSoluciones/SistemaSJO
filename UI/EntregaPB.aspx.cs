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
            SqlDataSource3.SelectParameters["IdTienda"].DefaultValue = Session["IdTienda"].ToString();
            SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader totalP;
            totalP = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if(totalP.Read())
            {
                Label1.Text = totalP["total"].ToString();
            }
            
        }

     

        protected void Unnamed1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    string _estado = DataBinder.Eval(e.Row.DataItem, "ID_Venta").ToString();

            //    if (_estado == _estado)
            //        e.Row.BackColor = System.Drawing.Color.Red;
            //    else
            //        e.Row.BackColor = System.Drawing.Color.Green;



            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int msj = 0;
            SqlDataSource1.UpdateParameters["ID_Venta"].DefaultValue = DropDownList1.SelectedValue;
           msj = SqlDataSource1.Update();
            if(msj > 0)
            {
                Response.Write("<script>alert('Entrega exitosa!')</script>");
                SqlDataSource2.SelectCommand = "SELECT Venta.ID_Venta FROM Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta WHERE (Estados.ID_Tienda = "+Session["IdTienda"]+") AND Estados.EstadoBodega = 1";
                SqlDataSource2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Error, no se realizo cambio en la Base de datos!')</script>");
            }
        }
    }
}