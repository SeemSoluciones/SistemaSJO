using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace UI
{
    public partial class Home : System.Web.UI.MasterPage
    {

        public static string Mensaje = "Dashboard";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Label1.Text = Session["Nombre"].ToString();
                Label2.Text = Session["Nombre"].ToString();
                Label3.Text = Session["Nombre"].ToString();
                Label4.Text = Mensaje;
                Label5.Text = Session["Tienda"].ToString();
                Label6.Text = Session["Rol"].ToString();

                if (Label1.Text == "" || Label6.Text == "Bodegero" || Label6.Text == "Mostrador" || Label6.Text == "Caja" || Label6.Text == "Digitador")
                {
                    Response.Redirect("Login.aspx");
                }




            }
            catch (System.Exception)
            {

                Response.Redirect("Login.aspx");
            }
            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }

        protected void Click_Boton1(object sender, EventArgs e)
        {
               Session.Abandon();
            FormsAuthentication.SignOut();
         
            Session.Clear();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.Cookies.Clear();
            Request.Cookies.Clear();
            Response.Redirect("Login.aspx", true);

        }
    }
}