using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data.SqlClient;

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

                    SqlDataSource11.SelectParameters["Rubro"].DefaultValue = TextBox1.Text;
                    SqlDataSource11.SelectParameters["ID_Modelo"].DefaultValue = DropDownList1.SelectedValue;
                    SqlDataSource11.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader total;
                    total = (SqlDataReader)SqlDataSource11.Select(DataSourceSelectArguments.Empty);
                    if(total.Read())
                    {
                        if(Convert.ToInt32(total["Total"]) > 0)
                        {
                            Response.Write("<script>alert('El cilindraje/ Serie motor y el Modelo ya se encuentra registrado')</script>");
                        }
                        else
                        {
                         string ms = "";
                    ms = Datos.InsertaRubro(TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue));
                    Response.Write("<script>alert('" + ms + "')</script>");
                    Response.Redirect("Categoria.aspx");
                    borrar();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Error!, no se pudo leer datos. Consulte a su adminstrador tecnico')</script>");

                    }

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
                    SqlDataSource12.SelectParameters["Modelo"].DefaultValue = TextBox2.Text;
                    SqlDataSource12.SelectParameters["ID_Marca"].DefaultValue = DropDownList2.SelectedValue;
                    SqlDataSource12.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader total;
                    total = (SqlDataReader)SqlDataSource12.Select(DataSourceSelectArguments.Empty);
                    if (total.Read())
                    {
                        if(Convert.ToInt32(total["Total"]) > 0)
                        {
                            Response.Write("<script>alert('El modelo y la marca del auto ya se encuentra registrado')</script>");
                        }
                        else
                        {
                     string ms = "";
                    ms = Datos.InsertaModelo(TextBox2.Text, Convert.ToInt32(DropDownList2.SelectedValue));
                    Response.Write("<script>alert('" + ms + "')</script>");
                    Response.Redirect("Categoria.aspx");
                    borrar();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Error!, no se pudo leer datos. Consulte a su adminstrador tecnico')</script>");

                    }


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

        protected void Button9_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectCommand = "SELECT Rubro.ID_Rubro, Rubro.Rubro, Rubro.ID_Modelo, Modelo.Modelo FROM Rubro INNER JOIN Modelo ON Rubro.ID_Modelo = Modelo.ID_Modelo WHERE Rubro like '%"+TextBox1.Text+"%' ORDER BY [Rubro]";
            SqlDataSource3.DataBind();
        }

        protected void Button10_Click1(object sender, EventArgs e)
        {
            SqlDataSource6.SelectCommand = "SELECT [ID_MaraProd], [MarcaP] FROM [MarcaProd] WHERE MarcaP like '%"+TextBox3.Text+"%'";
            SqlDataSource6.DataBind();
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            SqlDataSource4.SelectCommand = "SELECT Modelo.ID_Modelo, Modelo.Modelo, Modelo.ID_Marca, Marca.Marca FROM Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca WHERE Modelo like '%"+TextBox2.Text+"%'";
            SqlDataSource4.DataBind();
        }
    }
}