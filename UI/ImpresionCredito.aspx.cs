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
            Label4.Text = Convert.ToDecimal(tb.Rows[0][2]).ToString("0.00");
            SqlDataSource1.SelectParameters["NIT"].DefaultValue = Credito2.Nit.ToString();
            SqlDataSource1.DataBind();
            TextBox2.Text = Credito2.pendiente;

        }
    }
}