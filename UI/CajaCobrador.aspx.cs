using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UI
{
    public partial class CajaCobrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           try
            {
                   Cobrador.Mensaje = "Ventana de cobro";
            SqlDataSource3.SelectParameters["IdTienda"].DefaultValue = Session["IdTienda"].ToString();
            SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader totalP;
            totalP = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (totalP.Read())
            {
                Label1.Text = totalP["total"].ToString();
            }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
         
            //SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            //SqlDataReader totalRec;
            //totalRec = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            //if (totalRec.Read())
            //{
            //    Label2.Text = "Q. " + Convert.ToDecimal(totalRec["TOTAL"]).ToString("0.00");
            //}
   
        }

    }
}