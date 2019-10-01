using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace UI
{
    public partial class Autorizacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(CajaV.estadoAuto == true)
            {
                string script = "window.close();";

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "closewindows", script, true);
            }

        }
        public static string Quien = "";
        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.SelectParameters["User"].DefaultValue = TextBox1.Text;
                SqlDataSource1.SelectParameters["PassWord"].DefaultValue = TextBox2.Text;
                SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader Lista;
                Lista = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (Lista.Read())
                {
                    if (Convert.ToInt32(Lista["total"]) == 1)
                    {
                        CajaV.estadoAuto = true;
                        string script = "window.close();";
                        Quien = Lista["Nom"].ToString();
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "closewindows", script, true);
                    }
                    else
                    {
                        Label1.Text = "Error, ingrese credenciales correctos.";
                    }
                }
                else
                {
                    Label1.Text = "Error, cierra ventana y vuelva a intentar.";
                }
            }
            catch
            {
                Label1.Text = "Error, cierra ventana y vuelva a intentar.";
            }

        }
    }
}