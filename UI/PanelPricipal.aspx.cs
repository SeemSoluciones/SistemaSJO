using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class PanelPricipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["IDtienda"].ToString() == "" && Session["IdEmpleado"].ToString() == "")
                {
                    Response.Redirect("Login.aspx");
                }

                Home.Mensaje = "Dashboard";
            
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
           
        }
    }
}