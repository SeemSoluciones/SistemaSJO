using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Web.Security;

namespace UI
{
    public partial class Login1 : System.Web.UI.Page
    {
        Empleado Datos = new Empleado();
        protected void Page_Load(object sender, EventArgs e)
        {

            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));

            Response.Cache.SetNoStore();
        }
        public static int usuario;
        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable tabla = new DataTable();
            //string dato1 = Datos.MuestraUser(txtUsuario.Text);
            //string dato2 = Datos.MuestraContra(TextBox1.Text);
            usuario = Datos.Usuario(txtUsuario.Text, TextBox1.Text);

            //if (ValidateUser(txtUsuario.Text, TextBox1.Text))
            //{
            //    FormsAuthentication.RedirectFromLoginPage(txtUsuario.Text, true);
            //    tabla = Datos.BuscarUsuario(txtUsuario.Text, TextBox1.Text);
            //    Session["Nombre"] = tabla.Rows[0][1].ToString() + "  " + tabla.Rows[0][2].ToString();
            //    Session["IDtienda"] = tabla.Rows[0][5].ToString();
            //    Session["IdEmpleado"] = tabla.Rows[0][0].ToString();
            //    Session["Tienda"] = tabla.Rows[0][3].ToString();
            //    Session["Rol"] = tabla.Rows[0][4].ToString();
            //    //  Response.Redirect("/PanelPricipal.aspx");
            //    if (tabla.Rows[0][4].ToString() == "Admin" || tabla.Rows[0][4].ToString() == "Administrador")
            //    {
            //        Response.Redirect("/PanelPricipal.aspx");
            //    }
            //    else if (tabla.Rows[0][4].ToString() == "Vendedor" || tabla.Rows[0][4].ToString() == "Mostrador")
            //    {
            //        Response.Redirect("CajaV.aspx");
            //    }
            //    else if (tabla.Rows[0][4].ToString() == "Digitador")
            //    {
            //        Response.Redirect("CompraD.aspx");
            //    }
            //    else if (tabla.Rows[0][4].ToString() == "Bodega" || tabla.Rows[0][4].ToString() == "Bodegero")
            //    {
            //        Response.Redirect("EntregaPB.aspx");
            //    }
            //    else if(tabla.Rows[0][4].ToString().Trim()  == "Caja" || tabla.Rows[0][4].ToString() == "Cajero")
            //    {
            //    Response.Redirect("CajaCobrador.aspx");
            //    }

            //}
            //else
            //{
            //        Response.Redirect("Login.aspx", true);
            //}


            if (ValidateUser(txtUsuario.Text, TextBox1.Text))
            {
                HttpContext.Current.Profile.Initialize(txtUsuario.Text.Trim(), true);
                FormsAuthenticationTicket tkt;
                string cookiestr;
                HttpCookie ck;
                tkt = new FormsAuthenticationTicket(1, txtUsuario.Text, DateTime.Now,
                DateTime.Now.AddMinutes(30), true, "your custom data");
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                if (true)
                    ck.Expires = tkt.Expiration;
                ck.Path = FormsAuthentication.FormsCookiePath;
                Response.Cookies.Add(ck);

                string strRedirect;
                strRedirect = Request["ReturnUrl"];
                if (strRedirect == null)
                tabla = Datos.BuscarUsuario(txtUsuario.Text, TextBox1.Text);
                Session["Nombre"] = tabla.Rows[0][1].ToString() + "  " + tabla.Rows[0][2].ToString();
                Session["IDtienda"] = tabla.Rows[0][5].ToString();
                Session["IdEmpleado"] = tabla.Rows[0][0].ToString();
                Session["Tienda"] = tabla.Rows[0][3].ToString();
                Session["Rol"] = tabla.Rows[0][4].ToString();
                //  Response.Redirect("/PanelPricipal.aspx");
                if (tabla.Rows[0][4].ToString() == "Admin" || tabla.Rows[0][4].ToString() == "Administrador")
                {
                    Response.Redirect("/PanelPricipal.aspx");
                }
                else if (tabla.Rows[0][4].ToString() == "Vendedor" || tabla.Rows[0][4].ToString() == "Mostrador")
                {
                    Response.Redirect("CajaV.aspx");
                }
                else if (tabla.Rows[0][4].ToString() == "Digitador")
                {
                    Response.Redirect("CompraD.aspx");
                }
                else if (tabla.Rows[0][4].ToString() == "Bodega" || tabla.Rows[0][4].ToString() == "Bodegero")
                {
                    Response.Redirect("EntregaPB.aspx");
                }
                else if (tabla.Rows[0][4].ToString().Trim() == "Caja" || tabla.Rows[0][4].ToString() == "Cajero")
                {
                    Response.Redirect("CajaCobrador.aspx");
                }
                else if(tabla.Rows[0][4].ToString().Trim() == "Chequeador")
                {
                    Response.Redirect("AsignacionMotorista.aspx");
                }
                Response.Redirect(strRedirect, true);
            }
            else
                Response.Redirect("Login.aspx", true);

            //if (usuario > 0)
            //{

            //}
            //else

            //{

            //    Response.Write("<script>alert('Usuario incorrecto')</script>");

            //}

        }

        private bool ValidateUser(string userName, string passWord)
        {
        
            string lookupPassword = null;

            // Check for invalid userName.
            // userName must not be null and must be between 1 and 15 characters.
            if ((null == userName) || (0 == userName.Length) || (userName.Length > 15))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.");

                return false;
            }

            // Check for invalid passWord.
            // passWord must not be null and must be between 1 and 25 characters.
            if ((null == passWord) || (0 == passWord.Length) || (passWord.Length > 25))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.");
                return false;
            }

            try
            {
                // Consult with your SQL Server administrator for an appropriate connection
                // string to use to connect to your local SQL Server.
                DataTable tablaUser = new DataTable();

                // Create SqlCommand to select pwd field from users table given supplied userName.
                tablaUser = Datos.BuscarUserYPass(userName, passWord);


                // Execute command and fetch pwd field into lookupPassword string.
                lookupPassword = (string)tablaUser.Rows[0][2].ToString();

                // Cleanup command and connection objects.
            }
            catch (Exception ex)
            {
                // Add error handling here for debugging.
                // This error message should not be sent back to the caller.
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Exception " + ex.Message);
            }

            // If no password found, return false.
            if (null == lookupPassword)
            {
                // You could write failed login attempts here to event log for additional security.
                return false;
            }

            // Compare lookupPassword and input passWord, using a case-sensitive comparison.
            return (0 == string.Compare(lookupPassword, passWord, false));
        }

    }   
}