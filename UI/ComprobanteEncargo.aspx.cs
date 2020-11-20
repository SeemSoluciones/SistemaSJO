using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class ComprobanteEncargo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["ID_ProdXen"].DefaultValue = Encargos.idEncargo;
            SqlDataSource1.DataBind();
            Label1.Text = Encargos.total.ToString();
            Label2.Text = Encargos.abono.ToString();
            Label3.Text = Encargos.pendiente.ToString();
            Label8.Text = Session["Nombre"].ToString();
            Label6.Text = System.DateTime.Now.ToString();
            nit.Text = Encargos.nit2;
            Nombre.Text = Encargos.nombre;
        }
    }
}