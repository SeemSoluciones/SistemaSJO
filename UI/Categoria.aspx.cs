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
                if (TextBox1.Text != "")
                {


                    string ms = "";
                    ms = Datos.InsertaRubro(TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue));
                    Response.Write("<script>alert('" + ms + "')</script>");
                    Response.Redirect("Categoria.aspx");
                    borrar();
                }
                else
                {
                    Response.Write("<script>alert('Ingrese un dato')</script>");
                }
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
                if (TextBox2.Text != "")
                {


                    string ms = "";
                    ms = Datos.InsertaModelo(TextBox2.Text, Convert.ToInt32(DropDownList2.SelectedValue));
                    Response.Write("<script>alert('" + ms + "')</script>");
                    Response.Redirect("Categoria.aspx");
                    borrar();
                }
                else
                {
                    Response.Write("<script>alert('Error, resive los datos')</script>");
                }

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
                if (TextBox5.Text != "")
                {
                    string ms = "";
                    ms = Datos.InsertaMarca(TextBox5.Text);
                    Response.Write("<script>alert('" + ms + "')</script>");
                    Response.Redirect("Categoria.aspx");
                    borrar();
                }
                else
                {
                    Response.Write("<script>alert('Error, resive los datos')</script>");
                }
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
                if (TextBox3.Text != "")
                {
                    Datos.InsertarMarcaProd(TextBox3.Text);
                    Response.Redirect("Categoria.aspx");
                    borrar();
                }
                else
                {
                    Response.Write("<script>alert('Error, resive los datos')</script>");
                }
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
                if (TextBox4.Text != "")
                {
                    Datos.InsertarMedida(TextBox4.Text);
                    Response.Redirect("Categoria.aspx");
                    borrar();
                }
                else
                {
                    Response.Write("<script>alert('Error, resive los datos')</script>");
                }

            }
            catch
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            int estado = 0;
            if (TextBox6.Text != "")
            {
                SqlDataSource8.InsertParameters["Anio"].DefaultValue = TextBox6.Text;
                estado = SqlDataSource8.Insert();
                if (estado == 1)
                {
                    Response.Write("<script>alert('Año agregado correctamente.')</script>");
                    borrar();
                }
                else
                {
                    Response.Write("<script>alert('Error, resive los datos')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox7.Text != "")
                {


                    SqlDataSource9.InsertParameters["Categoria"].DefaultValue = TextBox7.Text;
                    SqlDataSource9.Insert();
                    SqlDataSource9.SelectCommand = "SELECT ID_Categoria, Categoria FROM Categoria WHERE (Estado = 1)";
                    SqlDataSource9.DataBind();
                    borrar();
                }
                else
                {
                    Response.Write("<script>alert('Error, resive los datos')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox8.Text != "")
                {
                    SqlDataSource10.InsertParameters["SubCategoria"].DefaultValue = TextBox8.Text;
                    SqlDataSource10.InsertParameters["ID_Categoria"].DefaultValue = DropDownList3.SelectedValue;
                    SqlDataSource10.Insert();
                    SqlDataSource10.SelectCommand = "SELECT SubCategoria.ID_SubCategoria, SubCategoria.SubCategoria, Categoria.Categoria FROM Categoria INNER JOIN SubCategoria ON Categoria.ID_Categoria = SubCategoria.ID_Categoria WHERE(Categoria.Estado = 1)";
                    SqlDataSource10.DataBind();
                    borrar();
                }
                else
                {
                    Response.Write("<script>alert('Error, resive los datos')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Error, resive los datos')</script>");
            }
        }


        void borrar ()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";


        }

       
    }
}