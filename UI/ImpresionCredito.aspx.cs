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
            SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Producto, Rubro.Rubro, Credito.Monto, Credito.SaldoPendiente, Credito.FechaCredito, ItemProdCliente.ID_ItemProdCliente, Credito.ID_Credito FROM Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN Producto ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN ItemProdCliente ON Producto.Codigo = ItemProdCliente.Codigo INNER JOIN Credito ON ItemProdCliente.ID_Credito = Credito.ID_Credito INNER JOIN Cliente ON Credito.ID_Cliente = Cliente.ID_Cliente WHERE ItemProdCliente.Estado = 0 AND Cliente.NIT = " + Credito2.Nit;
            SqlDataSource1.DataBind();

        }
    }
}