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
    public partial class ImpresionCreditoPagos : System.Web.UI.Page
    {
        cClientes datos = new cClientes();

        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Text = DateTime.Now.ToShortDateString();
            try
            {
                DataTable tb = new DataTable();
                tb = datos.ListaClienteCredito(Convert.ToInt32(Credito2.Nit));
                Label1.Text = tb.Rows[0][0].ToString();
                Label2.Text = tb.Rows[0][1].ToString();
                Label4.Text = Convert.ToDecimal(tb.Rows[0][2]).ToString("0.00");

            }
            catch
            {
               Label1.Text = Credito2.nit;
                Label2.Text = Credito2.nombre;
                Label3.Text = "0.00";
            }
            DataTable dt = new DataTable();
            dt = (DataTable)Session["tablaitemcredito"];
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        decimal total;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total += Convert.ToDecimal(e.Row.Cells[4].Text);
            }
            TextBox2.Text = total.ToString();
        }
    }
}