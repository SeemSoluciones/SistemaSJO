using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BLL;
namespace UI
{
    public partial class StockD : System.Web.UI.Page
    {


        Cproducto datosProd = new Cproducto();
        int idTienda = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana Stock";
            TextBox3.Focus();
            idTienda = Convert.ToInt32(Session["IDtienda"].ToString());
            SqlDataSource1.SelectCommand = "SELECT TOP(50)  Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Producto.Codigo, Producto.Descripcion, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio FROM  Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd  WHERE Producto.Estado = 1 AND Tienda.ID_Tienda = " + idTienda;
            SqlDataSource1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                idTienda = Convert.ToInt32(Session["IDtienda"].ToString());
                if (CheckBox1.Checked == true)
                {
                    SqlDataSource1.SelectCommand = "SELECT  Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Producto.Codigo, Producto.Descripcion, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio FROM  Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd Where  (Producto.Codigo like '%" + TextBox3.Text + "%' OR  Producto.Codigo2 like '%" + TextBox3.Text + "%' OR Producto.Descripcion like '%" + TextBox3.Text + "%') AND (Producto.Estado = 1) AND (Anio.ID_Anio = " + DropDownList5.SelectedValue + ") AND Tienda.ID_Tienda =" + idTienda;
                    SqlDataSource1.DataBind();
                }
                else
                {
                    SqlDataSource1.SelectCommand = "SELECT  Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Producto.Codigo, Producto.Descripcion, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio FROM  Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd Where  (Producto.Codigo like '%" + TextBox3.Text + "%' OR  Producto.Codigo2 like '%" + TextBox3.Text + "%' OR Producto.Descripcion like '%" + TextBox3.Text + "%') AND (Producto.Estado = 1) AND Tienda.ID_Tienda =" + idTienda;
                    SqlDataSource1.DataBind();
                }

            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList4.Text == "")
            {

            }
            else
            {
                idTienda = Convert.ToInt32(Session["IDtienda"].ToString());
                SqlDataSource1.SelectCommand = "SELECT TOP(50) Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Producto.Codigo, Producto.Descripcion, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio FROM  Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd Where  Rubro.ID_Rubro = " + DropDownList4.SelectedValue + " AND  Anio.ID_Anio = " + DropDownList5.SelectedValue + " AND (Producto.Estado = 1) AND Tienda.ID_Tienda =" + idTienda;
                SqlDataSource1.DataBind();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int SiExiste = datosProd.SiExisteStock(TextBox6.Text, Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(Session["IDtienda"].ToString()));
                if (SiExiste == 0)
                {
                    int idTtienda = 0;
                    idTtienda = Convert.ToInt32(Session["IDtienda"]);
                    datosProd.InsertarStock(Convert.ToInt32(cantidad.Text), Convert.ToInt32(cantidadMinima.Text), ubicacion.Text, Convert.ToDecimal(precioProd.Text), Convert.ToDecimal(precioVenta.Text), TextBox6.Text, Convert.ToInt32(DropDownList1.SelectedValue), idTtienda, Convert.ToInt32(DropDownList6.SelectedValue));
                    Response.Redirect("Stock.aspx");
                }
                else if (SiExiste > 0)
                {
                    Response.Write("<script>alert('El producto, el año y la tienda ya esta registrado en el stock. Pruebe con otro año.')</script>");
                }


            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }


        }

        /*protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
         //Response.Write("<script>alert('HOoola')</script>");
             try
            {
             DataTable tb = new DataTable();
           tb = datosProd.BuscarProducto2(TextBox6.Text);
            ViewState["Detalles"] = tb;
            if (ViewState["Detalles"] == null)
            {
                 Response.Write("<script>alert('Este producto no existe')</script>");
            }
            else
            {
               
                TextBox7.Text = tb.Rows[0][1].ToString();
            }
            }
            catch
            {
                Response.Write("<script>alert('Error, es probable que el codigo no exista')</script>");
            }
           
            
        }*/


        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow r = GridView1.SelectedRow;
            IDstock.Text = r.Cells[1].Text;
            Cant.Text = r.Cells[3].Text;
            Ubi.Text = r.Cells[4].Text;
            PrecioP.Text = r.Cells[5].Text;
            PrecioVe.Text = r.Cells[6].Text;
            Button6_ModalPopupExtender.Show();
        }

        protected void Button4_Click1(object sender, EventArgs e)
        {
            try
            {
                datosProd.EditarStock(Convert.ToInt32(IDstock.Text), Convert.ToInt32(Cant.Text), Ubi.Text, Convert.ToDecimal(PrecioP.Text), Convert.ToDecimal(PrecioVe.Text));
                Response.Redirect("Stock.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, Datos no actualizado')</script>");
            }
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            idTienda = Convert.ToInt32(Session["IDtienda"].ToString());
            SqlDataSource1.SelectCommand = "SELECT  Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Producto.Codigo, Producto.Descripcion, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio FROM  Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd Where Producto.Estado = 1 AND Tienda.ID_Tienda = " + idTienda + "AND  Rubro.ID_Rubro = " + DropDownList4.SelectedValue;
            SqlDataSource1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {


                SqlDataSource8.SelectParameters["Codigo"].DefaultValue = TextBox6.Text;
                SqlDataSource8.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader Producto;
                Producto = (SqlDataReader)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
                if (Producto.Read())
                {
                    TextBox7.Text = Producto["Descripcion"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Este producto no existe')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Ingrese un codigo!')</script>");
            }
            //DataTable TB = new DataTable();
            //TB = datosProd.BuscarProducto2(TextBox6.Text);
            //try
            //{
            //    ViewState["Estado"] = TB;
            //    if (ViewState["Estado"] == null)
            //    {
            //        Response.Write("<script>alert('Este producto no existe')</script>");
            //    }
            //    else
            //    {
            //        TextBox7.Text = TB.Rows[0][1].ToString();
            //    }
            //}
            //catch
            //{
            //    Response.Write("<script>alert('Este producto no existe')</script>"); 
            //}
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            int mens = 0;
            SqlDataSource1.DeleteParameters["ID_Existencia"].DefaultValue = IDstock.Text;
            mens = SqlDataSource1.Delete();
            if (mens == 1)
            {
                Response.Write("<script>alert('Se elimino stock con exito')</script>");
            }
            else
            {
                Response.Write("<script>alert('Error, no se elimino stock')</script>");
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            try
            {
                idTienda = Convert.ToInt32(Session["IDtienda"].ToString());
                if (CheckBox1.Checked == true)
                {
                    SqlDataSource1.SelectCommand = "SELECT  Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Producto.Codigo, Producto.Descripcion, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio FROM  Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd Where  (Producto.Codigo like '%" + TextBox3.Text + "%' OR  Producto.Codigo2 like '%" + TextBox3.Text + "%' OR Producto.Descripcion like '%" + TextBox3.Text + "%') AND (Producto.Estado = 1) AND (Anio.ID_Anio = " + DropDownList5.SelectedValue + ") AND Tienda.ID_Tienda =" + idTienda;
                    SqlDataSource1.DataBind();
                }
                else
                {
                    SqlDataSource1.SelectCommand = "SELECT  Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Producto.Codigo, Producto.Descripcion, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio FROM  Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd Where  (Producto.Codigo like '%" + TextBox3.Text + "%' OR  Producto.Codigo2 like '%" + TextBox3.Text + "%' OR Producto.Descripcion like '%" + TextBox3.Text + "%') AND (Producto.Estado = 1) AND Tienda.ID_Tienda =" + idTienda;
                    SqlDataSource1.DataBind();
                }

            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }
        }
    }
}