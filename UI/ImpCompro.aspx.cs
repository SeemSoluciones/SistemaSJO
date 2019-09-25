using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace UI
{
    public partial class ImpCompro : System.Web.UI.Page
    {
        cClientes datos = new cClientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Text = DateTime.Now.ToShortDateString();
            DataTable tb = new DataTable();
            tb = datos.ListaUncliente(Convert.ToInt32(Encargos.nit));
            Label1.Text = tb.Rows[0][1].ToString();
            Label2.Text = tb.Rows[0][7].ToString();
            Label4.Text = Encargos.Resto.ToString("0.00");
            SqlDataSource1.SelectCommand = "SELECT Cliente.NIT, Cliente.Nombre + '  ' + Cliente.Apellidos AS Nom, ProductoXencargo.Codigo,  ProductoXencargo.FechaPedido, ProductoXencargo.FechaEntrega, ProductoXencargo.Anticipo, ProductoXencargo.PrecioReal, ProductoXencargo.Descripcion, ProductoXencargo.Fotografia, ProductoXencargo.Estado, ProductoXencargo.ID_ProdXen FROM ProductoXencargo  INNER JOIN Cliente ON ProductoXencargo.ID_Cliente = Cliente.ID_Cliente WHERE (ProductoXencargo.Estado = 0) AND (Cliente.NIT = "+Encargos.nit+")";
               SqlDataSource1.DataBind();
        }
    }
}