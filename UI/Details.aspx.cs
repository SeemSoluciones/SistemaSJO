using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UI
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["IDproducto"].DefaultValue = Request.QueryString["id"];
            SqlDataSource1.DataBind();

            SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader foto;
            foto = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (foto.Read())
            {
                byte[] img = (byte[])foto["Imagen"];
                Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
                
            }
        }
    }
}