using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace UI
{
    public partial class Compra : System.Web.UI.Page
    {
        Cproducto datos = new Cproducto();
        DataTable tabla = new DataTable();
        DataTable dt = new DataTable();
    
        decimal subtotal, total;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox2.Text = DateTime.Now.ToString("dd/MM/yyyy");
            Home.Mensaje = "Ventana compras";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // tabla = datos.BuscarProducto(DropDownList3.SelectedValue);
            Label1.Text = tabla.Rows[0][0].ToString();
            TextBox7.Text = tabla.Rows[0][1].ToString();
            TextBox8.Text = tabla.Rows[0][2].ToString();
            TextBox9.Text = tabla.Rows[0][3].ToString();
            TextBox11.Text = "1";
           // Label1.Text = IdProd;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox7.Text == "" || TextBox8.Text=="" || TextBox9.Text == "" || TextBox11.Text == "")
            {
                Response.Write("<script>alert('Seleccione y indique el precio')</script>");
            }
            else
            {
               // dt.Columns.Add("ID");
                dt.Columns.Add("Codigo");
                dt.Columns.Add("Descripcion");
                dt.Columns.Add("Precio");
                dt.Columns.Add("Cantidad");
                dt.Columns.Add("Total");
                dt.Columns.Add("IDstock");

                DataRow dr = null;
                if (ViewState["Detalles"] != null)
                {
                    for (int i = 0; i < 1; i++)
                    {
                        dt = (DataTable)ViewState["Detalles"];
                        if (dt.Rows.Count > 0)
                        {
                            subtotal = Convert.ToDecimal(TextBox11.Text) * Convert.ToDecimal(TextBox9.Text);
                            dr = dt.NewRow();
                          //  dr["ID"] = Label1.Text;
                            dr["Codigo"] = TextBox7.Text;
                            dr["Descripcion"] = TextBox8.Text;
                            dr["Precio"] = TextBox9.Text;
                            dr["Cantidad"] = TextBox11.Text;
                            dr["Total"] = subtotal;
                            dr["IDstock"] = idStock;
                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                        }
                    }

                }
                else
                {
                    subtotal = Convert.ToDecimal(TextBox11.Text) * Convert.ToDecimal(TextBox9.Text);
                    dr = dt.NewRow();
                   // dr["ID"] = Label1.Text;
                    dr["Codigo"] = TextBox7.Text;
                    dr["Descripcion"] = TextBox8.Text;
                    dr["Precio"] = TextBox9.Text;
                    dr["Cantidad"] = TextBox11.Text;
                    dr["Total"] = subtotal;
                    dr["IDstock"] = idStock;
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                ViewState["Detalles"] = dt;
                limpiar();

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                string msj = "";
                msj = datos.InsertarCompra(Convert.ToDecimal(TextBox12.Text), TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue));
                foreach (GridViewRow row in GridView1.Rows)
                {
                    datos.InsertarDetalleCompra(
                        Convert.ToInt32(row.Cells[3].Text),
                        Convert.ToDecimal(row.Cells[2].Text),
                        Convert.ToDecimal(row.Cells[4].Text),
                        row.Cells[0].Text,
                        Convert.ToInt32(row.Cells[5].Text),
                        Convert.ToInt32(msj)
                       
                        );
                }

                Response.Redirect("Compra.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, Compra no registrada')</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total = total + Convert.ToDecimal(e.Row.Cells[4].Text);
              
            }
           
            TextBox12.Text = total.ToString();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
           // tabla = datos.BuscarProducto(DropDownList3.SelectedValue);
            Label1.Text = tabla.Rows[0][0].ToString();
            TextBox7.Text = tabla.Rows[0][1].ToString();
            TextBox8.Text = tabla.Rows[0][2].ToString();
            TextBox9.Text = tabla.Rows[0][3].ToString();
            TextBox11.Text = "1";
        }

        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList6.Text == "")
            {

            }
            else
            {
                int idTtienda = 0;
                idTtienda = Convert.ToInt32(Session["IDtienda"]);
                SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto,MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida Where (Producto.Estado = 1) AND Rubro.ID_Rubro = " + DropDownList6.SelectedValue + " AND  Anio.ID_Anio = " + DropDownList7.SelectedValue + "AND Stock.ID_Tienda = " + idTtienda;
                SqlDataSource2.DataBind();
            }
        }
        private static int cantProd = 0, idStock = 0;
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gd = GridView2.SelectedRow;
            TextBox7.Text = GridView2.SelectedRow.Cells[0].Text;
            TextBox8.Text = gd.Cells[2].Text;
            TextBox9.Text = gd.Cells[11].Text;
            TextBox11.Text = "1";
            cantProd = Convert.ToInt32(gd.Cells[8].Text);
            idStock = Convert.ToInt32(gd.Cells[12].Text);
        }

        protected void TextBox12_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idTtienda = 0;
            idTtienda = Convert.ToInt32(Session["IDtienda"]);
            SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida Where (Producto.Estado = 1) AND Rubro.ID_Rubro = " + DropDownList6.SelectedValue + "AND Stock.ID_Tienda = " + idTtienda;
            SqlDataSource2.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Compra.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            try
            {
                int idTtienda = 0;
                idTtienda = Convert.ToInt32(Session["IDtienda"]);
                int ID_Rubro, ID_Rubro2;
                ID_Rubro = datos.ID_Rubro(TextBox20.Text);
                ID_Rubro2 = datos.ID_Rubro2(TextBox20.Text);

                if (CheckBox1.Checked == false && CheckBox2.Checked == false)
                {
                    SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida WHERE (Producto.Estado = 1) AND ((Producto.Codigo like '%" + TextBox20.Text + "%') OR (Producto.Producto like '%" + TextBox20.Text + "%')) AND Stock.ID_Tienda = " + idTtienda;
                    SqlDataSource2.DataBind();
                }
                else if (CheckBox1.Checked == true && CheckBox2.Checked == false)
                {
                    SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida WHERE (Producto.Estado = 1) AND (Producto.Codigo2 like '%" + TextBox20.Text + "%') AND Rubro.ID_Rubro = " + ID_Rubro2 + "AND Stock.ID_Tienda = " + idTtienda;
                    SqlDataSource2.DataBind();
                }
                else if (CheckBox1.Checked == true && CheckBox2.Checked == true)
                {
                    SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida WHERE (Producto.Estado = 1) AND (Producto.Codigo2 like '%" + TextBox20.Text + "%') AND  Anio.ID_Anio = " + DropDownList7.SelectedValue + "AND Stock.ID_Tienda = " + idTtienda;
                    SqlDataSource2.DataBind();
                }
                else if (CheckBox2.Checked == true && CheckBox1.Checked == false)
                {
                    SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida WHERE (Producto.Estado = 1) AND ((Producto.Codigo like '%" + TextBox20.Text + "%') OR (Producto.Producto like '%" + TextBox20.Text + "%')) AND  Anio.ID_Anio = " + DropDownList7.SelectedValue + "AND Stock.ID_Tienda = " + idTtienda;
                    SqlDataSource2.DataBind();
                }

            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }
        }

        public void limpiar()
        {
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "0";
            TextBox11.Text = "1";
        }
    }
}