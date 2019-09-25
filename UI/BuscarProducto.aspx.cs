using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace UI
{
    public partial class BuscarProducto : System.Web.UI.Page
    {
        Cproducto DatosP = new Cproducto();

        protected void Page_Load(object sender, EventArgs e)
        {
            //this.GridView1.DataSource = DatosP.ListaProducto();

        }

       
    }
}