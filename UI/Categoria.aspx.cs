using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace UI
{
    public partial class Categoria : System.Web.UI.Page
    {
        Cproducto Datos = new Cproducto();
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana Categorias";
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
          /*  string ID_E;
            GridViewRow dt = GridView1.SelectedRow;
            ID_E = dt.Cells[0].Text;
            Datos.EliminarCategoria(Convert.ToInt32(ID_E));
            Response.Redirect("Categoria.aspx"); */
          //  SqlDataSource1.SelectCommand = "SELECT ID_Categoria, Categoria, Categoria2 FROM Categoria WHERE Estado = 1";
           // SqlDataSource1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string ms = "";
                ms = Datos.InsertaRubro(TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue));
                Response.Write("<script>alert('" + ms + "')</script>");
                Response.Redirect("Categoria.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string ms = "";
                ms = Datos.InsertaModelo(TextBox2.Text, Convert.ToInt32(DropDownList2.SelectedValue));
                Response.Write("<script>alert('" + ms + "')</script>");
                Response.Redirect("Categoria.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                string ms = "";
                ms = Datos.InsertaMarca(TextBox5.Text);
                Response.Write("<script>alert('" + ms + "')</script>");
                Response.Redirect("Categoria.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");

            }
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            try
            {
                Datos.InsertarMarcaProd(TextBox3.Text);
                Response.Redirect("Categoria.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            try
            {
                Datos.InsertarMedida(TextBox4.Text);
                Response.Redirect("Categoria.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            int estado = 0;
            SqlDataSource8.InsertParameters["Anio"].DefaultValue = TextBox6.Text;
            estado = SqlDataSource8.Insert();
            if(estado == 1)
            {
                Response.Write("<script>alert('Año agregado correctamente.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");
            }
        }
    }
}