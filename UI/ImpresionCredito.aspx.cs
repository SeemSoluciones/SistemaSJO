using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

namespace UI
{
    public partial class ImpresionCredito : System.Web.UI.Page
    {
        cClientes datos = new cClientes();

        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Text = DateTime.Now.ToShortDateString();
            DataTable tb = new DataTable();
            tb = datos.ListaClienteCredito(Convert.ToInt32(Credito2.Nit));
            Label1.Text = tb.Rows[0][0].ToString();
            Label2.Text = tb.Rows[0][1].ToString();
            Label4.Text = Convert.ToDecimal(tb.Rows[0][3]).ToString("0.00");
            SqlDataSource1.SelectCommand = "SELECT Producto.ID_Producto, Producto.Descripcion, Credito.Monto, Credito.SaldoPendiente, Credito.FechaCredito, ItemProdCliente.ID_ItemProdCliente, Credito.ID_Credito FROM ItemProdCliente inner join Credito on ItemProdCliente.ID_Credito = Credito.ID_Credito inner join Producto on ItemProdCliente.ID_Producto = Producto.ID_Producto inner join Cliente on Credito.ID_Cliente = Cliente.ID_Cliente WHERE ItemProdCliente.Estado = 0 AND Cliente.NIT =" + Credito2.Nit;
            SqlDataSource1.DataBind();

        }
    }
}