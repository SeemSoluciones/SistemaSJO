using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Data.Sql;
using System.Configuration;

namespace UI
{
    public partial class EditarFoto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["IDproducto"].DefaultValue = Request.QueryString["id"];
            SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader datos;
            datos = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                Label1.Text = datos["ID_Producto"].ToString();
                byte[] img = (byte[])datos["Imagen"];
                Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Stream imgStream = FileUpload1 .PostedFile.InputStream;
            int imgLen = FileUpload1 .PostedFile.ContentLength;
            byte[] imgBinaryData = new byte[imgLen];
            int n = imgStream.Read(imgBinaryData, 0, imgLen);


            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["BDautorepuestoConnectionString"].ConnectionString);
            SqlCommand command = new SqlCommand("UPDATE Producto SET  Imagen = @Imagen WHERE (ID_Producto = @idProducto)", connection);

            SqlParameter param1 = new SqlParameter("@Imagen", SqlDbType.Image);
            SqlParameter param2 = new SqlParameter("@idProducto", SqlDbType.Int);
            param1.Value = imgBinaryData;
            param2.Value = Label1.Text;
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);
            connection.Open();
            int numRowsAffected = command.ExecuteNonQuery();
            connection.Close();

            SqlDataSource1.SelectParameters["IDproducto"].DefaultValue = Request.QueryString["id"];
            SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader datos;
            datos = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                Label1.Text = datos["ID_Producto"].ToString();
                byte[] img = (byte[])datos["Imagen"];
                Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
            }
        }
    }
}