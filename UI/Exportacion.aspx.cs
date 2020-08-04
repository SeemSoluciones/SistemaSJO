using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace UI
{
    public partial class Exportacion : System.Web.UI.Page
    {
        Cproducto datos = new Cproducto();
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = Session["Tienda"].ToString();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {

            try
            {
                int ID_Rubro, ID_Rubro2;
                string idTienda = Session["IDtienda"].ToString();
                ID_Rubro = datos.ID_Rubro(TextBox20.Text);
                ID_Rubro2 = datos.ID_Rubro2(TextBox20.Text);

                if (CheckBox2.Checked == false)
                {
                    SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda, Anio.ID_Anio FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE (Producto.Estado = 1)  AND (Producto.Codigo like '%" + TextBox20.Text + "%' OR (Producto.Codigo2 like '%"+TextBox20.Text+"%') OR Producto.Producto like '%" + TextBox20.Text + "%') AND (Tienda.ID_Tienda =" + idTienda+")";//  AND Rubro.ID_Rubro = " + ID_Rubro;
                    SqlDataSource1.DataBind();
                }
              
                else if (CheckBox2.Checked == true)
                {
                    SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda, Anio.ID_Anio FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE (Producto.Estado = 1) AND (Producto.Codigo like '%" + TextBox20.Text + "%' OR Producto.Codigo2 like '%" + TextBox20.Text + "%') AND  (Anio.ID_Anio = " + DropDownList2.SelectedValue + ") AND (Tienda.ID_Tienda = "+ idTienda+")" ;
                    SqlDataSource1.DataBind();
                }
              
                Label5.Text = "";

            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }

        }
        private static int siExiste, cant;
        private static string codigop = "", idanio ="", idStock ="";

      

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            siExiste = datos.SiExisteStock(row.Cells[0].Text, Convert.ToInt32(row.Cells[11].Text), Convert.ToInt32(DropDownList1.SelectedValue));
            if (siExiste == 1)
            {
                codigop = row.Cells[0].Text;
                idanio = row.Cells[11].Text;
                cant = Convert.ToInt32(row.Cells[8].Text);
                idStock = row.Cells[12].Text;
                Label1.Text = row.Cells[8].Text + " de productos en la tienda: " + Session["Tienda"].ToString();
                Label2.Text = DropDownList1.SelectedItem.ToString();
                Button1_ModalPopupExtender.Show();
            }
            if(siExiste == 0)
            {
                codigop = row.Cells[0].Text;
                idanio = row.Cells[11].Text;
                cant = Convert.ToInt32(row.Cells[8].Text);
                idStock = row.Cells[12].Text;
                Label3.Text = row.Cells[8].Text + " de productos en la tienda: " + Session["Tienda"].ToString();
                Label4.Text = DropDownList1.SelectedItem.ToString();
                Button10_ModalPopupExtender.Show();
             
            }
            else if(siExiste > 1)
            {
                Response.Write("<script>alert('Existe mas de 1 del mismo producto, año y misma tienda. Borre uno,')</script>");
            }
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                if(Convert.ToInt32(TextBox2.Text) <= cant)
                {
                    datos.exportarStock(Convert.ToInt32(TextBox2.Text),Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(idanio), codigop, Convert.ToInt32(idStock));
                    string idTienda = Session["IDtienda"].ToString();
                    SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda, Anio.ID_Anio FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE (Producto.Estado = 1)  AND (Producto.Codigo like '%" + TextBox20.Text + "%' OR Producto.Producto like '%" + TextBox20.Text + "%') AND (Tienda.ID_Tienda =" + idTienda + ")";//  AND Rubro.ID_Rubro = " + ID_Rubro;
                    SqlDataSource1.DataBind();
                    Label5.Text = "Transaccion realizada con exitos.";
                }
                else
                {
                    Response.Write("<script>alert('La cantidad ingresada supera la cantidad que existe en el stock!')</script>");
                    Button1_ModalPopupExtender.Show();
                }

            }
            catch
            {
                Response.Write("<script>alert('Error, ingrese un valor!')</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(TextBox3.Text) <= cant)
            {
                datos.InsertarStock(Convert.ToInt32(TextBox3.Text),Convert.ToInt32(cantidadMinima.Text), ubicacion.Text, Convert.ToDecimal(precioProd.Text), 
                    Convert.ToDecimal(precioVenta.Text), codigop, Convert.ToInt32(idanio),
                    Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(DropDownList6.SelectedValue));
                datos.exportarStock(Convert.ToInt32(TextBox3.Text), Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(idanio), codigop, Convert.ToInt32(idStock));
                string idTienda = Session["IDtienda"].ToString();
                
                SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda, Anio.ID_Anio FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE (Producto.Estado = 1)  AND (Producto.Codigo like '%" + TextBox20.Text + "%' OR Producto.Producto like '%" + TextBox20.Text + "%') AND (Tienda.ID_Tienda =" + idTienda + ")";//  AND Rubro.ID_Rubro = " + ID_Rubro;
                SqlDataSource1.DataBind();
                Label5.Text = "Transaccion realizada con exitos.";
            }
            else
            {
                Response.Write("<script>alert('La cantidad ingresada supera la cantidad que existe en el stock!')</script>");
                Button1_ModalPopupExtender.Show();
            }
        }

    }
}