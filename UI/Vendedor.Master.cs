using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class Vendedor : System.Web.UI.MasterPage
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
                try
                {
                    if (Label1.Text == "")
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                catch
                {

                    Response.Redirect("Login.aspx");
                }
            }
            catch (System.Exception)
            {

                Response.Redirect("Login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            FormsAuthentication.SignOut();
            Session.Clear();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.Cookies.Clear();
            Request.Cookies.Clear();

            Response.Redirect("Login.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Session.Clear();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.Cookies.Clear();
            Request.Cookies.Clear();

            Response.Redirect("Login.aspx");
        }
    }
}