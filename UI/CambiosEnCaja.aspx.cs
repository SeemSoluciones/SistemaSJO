using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UI
{
    public partial class CambiosEnCaja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["ID_Tienda"].DefaultValue = Session["IDtienda"].ToString();
            SqlDataSource1.DataBind();
            SqlDataSource2.SelectParameters["ID_Tienda"].DefaultValue = Session["IDtienda"].ToString();
            SqlDataSource2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                int msj;
                SqlDataSource3.InsertParameters["MontoInicial"].DefaultValue = TextBox1.Text;
                SqlDataSource3.InsertParameters["Fecha"].DefaultValue = TextBox2.Text;
                SqlDataSource3.InsertParameters["ID_Caja"].DefaultValue = DropDownList1.SelectedValue;
                msj = SqlDataSource3.Insert();
                if (msj == 1)
                {
                    Response.Write("<script>alert('Datos ingresados correctatmente')</script>");
                    TextBox1.Text = "";
                    Label1.Text = "Se ingreso a la caja: " + TextBox1.Text;
                }
                else
                {
                    Response.Write("<script>alert('Error, No se guardaron los datos')</script>");
                    Label1.Text = "Error.";
                }
            }
            else
            {
                Response.Write("<script>alert('Ingrese un monto')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox3.Text != "")
            {
                int msj;
                SqlDataSource4.InsertParameters["MontoSalida"].DefaultValue = TextBox3.Text;
                SqlDataSource4.InsertParameters["Fecha"].DefaultValue = TextBox4.Text;
                SqlDataSource4.InsertParameters["ID_Concepto"].DefaultValue = DropDownList3.SelectedValue;
                SqlDataSource4.InsertParameters["ID_Caja"].DefaultValue = DropDownList2.SelectedValue;
                SqlDataSource4.InsertParameters["Informacion"].DefaultValue = TextBox5.Text;
                msj = SqlDataSource4.Insert();
                if (msj == 1)
                {
                    Response.Write("<script>alert('Datos ingresados correctatmente')</script>");
                    TextBox3.Text = "";
                    Label2.Text = "Se retiro de la caja: " + TextBox3.Text;
                }
                else
                {
                    Response.Write("<script>alert('Error, No se guardaron los datos')</script>");
                    Label2.Text = "Error.";
                }
            }
            else
            {
                Response.Write("<script>alert('Ingrese un monto')</script>");
            }
        }
    }
}