using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class DevolucionEntrega : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.UpdateParameters["ID_DevPro"].DefaultValue = GridView1.SelectedRow.Cells[0].Text;
            SqlDataSource1.UpdateParameters["Cantidad"].DefaultValue = GridView1.SelectedRow.Cells[3].Text;
            SqlDataSource1.UpdateParameters["ID_Existencia"].DefaultValue = GridView1.SelectedRow.Cells[6].Text;
            SqlDataSource1.Update();
            Response.Redirect("DevolucionEntrega.aspx");
        }
    }
}