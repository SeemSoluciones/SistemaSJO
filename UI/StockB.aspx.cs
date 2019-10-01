using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using BLL;

namespace UI
{
    public partial class StockB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Producto.Codigo, Producto.Producto + ':  ' + Producto.Descripcion AS Producto, Tienda.Tienda FROM Stock INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Producto ON Stock.Codigo = Producto.Codigo WHERE(producto.Estado = 1) AND (Tienda.IdTienda = " + Session["IdTienda"] + ") AND (producto.Codigo like '%" + TextBox1.Text + "%')";
            SqlDataSource1.DataBind();

        }

       
    }
}