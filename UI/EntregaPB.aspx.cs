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

       
    }
}