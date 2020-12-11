using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class StockM : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Digitador.Mensaje = "Ventana Stock Minimo";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT Stock.Cantidad, Stock.Cantidad_Min, Producto.Codigo, Producto.Producto + '  ' + Producto.Descripcion AS Productos, Stock.Ubicacion, Anio.Anio, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Tienda.Tienda FROM Stock INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Modelo ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio WHERE (Producto.Estado = 1) AND (Stock.Cantidad &lt;= Stock.Cantidad_Min) AND ((Producto.Codigo like '%" + TextBox3.Text + " %') OR ( Producto.Producto like '%" + TextBox3.Text + "%')) ORDER BY Productos";
            SqlDataSource1.DataBind();
        }
    }
}