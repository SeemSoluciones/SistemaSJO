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
                if (TextBox20.Text != string.Empty)
                {
                    int ID_Rubro, ID_Rubro2;
                    // ID_Rubro = datos.ID_Rubro(TextBox20.Text);
                    // ID_Rubro2 = datos.ID_Rubro2(TextBox20.Text);

                    if (CheckBox2.Checked == false)
                    {
                        SqlDataSource4.SelectCommand = "SELECT DISTINCT Producto.ID_Producto,stuff((Select ', ' + OEM.OEM From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM , stuff((Select ', ' + CodigoProducto.Codigo From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP,Producto.Descripcion, stuff((Select '| ' + AnioInicio + '-'+AnioFinal + ' ~ ' + Rubro +', '+ Modelo + ', ' + Marca From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria, CAST(MarcaProd.ID_MaraProd AS VARCHAR) + ', '+ MarcaProd.MarcaP AS MarcaP, Stock.PrecioVenta, Stock.Cantidad, Stock.PrecioUnitario, Stock.Ubicacion, Medida.Medida,           Tienda.Tienda, Stock.ID_Existencia FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN          SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN          MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN          Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto inner join AnioProducto on Producto.ID_Producto = AnioProducto.ID_Producto Where (Producto.Estado = 1) AND Tienda.ID_Tienda = " + Session["IDtienda"] + " AND (OEM.OEM like '%" + TextBox20.Text.Trim() + "%' OR CodigoProducto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%')";
                        SqlDataSource4.DataBind();
                    }
                    //else if (CheckBox2.Checked == false && CheckBox3.Checked == true && CheckBox4.Checked == false)
                    //{
                    //    SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE Producto.Estado = 1 AND (Producto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%' OR Producto.Codigo2 like '%" + TextBox20.Text.Trim() + "%') AND Marca.ID_Marca =" + DropDownList2.SelectedValue;//  AND Rubro.ID_Rubro = " + ID_Rubro;//agregado 11/07
                    //    SqlDataSource2.DataBind();
                    //}
                    //else if (CheckBox2.Checked == false && CheckBox3.Checked == false && CheckBox4.Checked == true)
                    //{
                    //    SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE Producto.Estado = 1 AND (Producto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%' OR Producto.Codigo2 like '%" + TextBox20.Text.Trim() + "%') AND Modelo.ID_Modelo =" + DropDownList5.SelectedValue;//  AND Rubro.ID_Rubro = " + ID_Rubro;//agregado 11/07
                    //    SqlDataSource2.DataBind();
                    //}
                    else if (CheckBox2.Checked == true)
                    {
                        SqlDataSource4.SelectCommand = "SELECT DISTINCT Producto.ID_Producto,stuff((Select ', ' + OEM.OEM From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM , stuff((Select ', ' + CodigoProducto.Codigo From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP,Producto.Descripcion, stuff((Select '| ' + AnioInicio + '-'+AnioFinal + ' ~ ' + Rubro +', '+ Modelo + ', ' + Marca From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria, CAST(MarcaProd.ID_MaraProd AS VARCHAR) + ', '+ MarcaProd.MarcaP AS MarcaP, Stock.PrecioVenta, Stock.Cantidad, Stock.PrecioUnitario, Stock.Ubicacion, Medida.Medida,           Tienda.Tienda, Stock.ID_Existencia FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN          SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN  MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto inner join AnioProducto on Producto.ID_Producto = AnioProducto.ID_Producto Where (Producto.Estado = 1) AND (Tienda.ID_Tienda = " + TextBox1.Text + ") AND (OEM.OEM like '%" + TextBox20.Text.Trim() + "%' OR CodigoProducto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%') AND (" + DropDownList7.SelectedItem + " BETWEEN AnioProducto.AnioInicio AND AnioProducto.AnioFinal) AND AnioProducto.ID_Rubro =" + DropDownList6.SelectedValue;
                        SqlDataSource4.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('Error, revise los campos. Ej: Puede ser que tanto marca como linea estan marcadas, marque solo uno')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Error, ingrese un valor')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }

        }
        private static int siExiste, cant;
        private static string codigop = "", idStock ="", idMarcapro="";

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource4.SelectCommand = "SELECT DISTINCT Producto.ID_Producto,stuff((Select ', ' + OEM.OEM From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM , stuff((Select ', ' + CodigoProducto.Codigo From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP,Producto.Descripcion, stuff((Select '| ' + AnioInicio + '-'+AnioFinal + ' ~ ' + Rubro +', '+ Modelo + ', ' + Marca From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria, CAST(MarcaProd.ID_MaraProd AS VARCHAR)  + ', '+ MarcaProd.MarcaP AS MarcaP, Stock.PrecioVenta, Stock.Cantidad, Stock.PrecioUnitario, Stock.Ubicacion, Medida.Medida,           Tienda.Tienda, Stock.ID_Existencia FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN          SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN          MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN          Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto inner join AnioProducto on Producto.ID_Producto = AnioProducto.ID_Producto Where (Producto.Estado = 1) AND  Tienda.ID_Tienda = " + Session["IDtienda"].ToString() + "  AND SubCategoria.ID_Categoria =" + DropDownList3.SelectedValue;
            SqlDataSource4.DataBind();
        }
        public static string[] separar;
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
           
           
            GridViewRow row = GridView2.SelectedRow;
            idMarcapro = row.Cells[5].Text;
            separar = idMarcapro.Split(',');
            siExiste = datos.SiExisteStock(row.Cells[0].Text, Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(separar[0]));
            if (siExiste == 1)
            {
                codigop = row.Cells[0].Text;
               
                cant = Convert.ToInt32(row.Cells[8].Text);
                idStock = row.Cells[12].Text;
                Label1.Text = row.Cells[8].Text + " de productos en la tienda: " + Session["Tienda"].ToString();
                Label2.Text = DropDownList1.SelectedItem.ToString();
                Button1_ModalPopupExtender.Show();
            }
            if(siExiste == 0)
            {
                codigop = row.Cells[0].Text;
      
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
                    datos.exportarStock(Convert.ToInt32(TextBox2.Text),Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(codigop), Convert.ToInt32(separar[0]), Convert.ToInt32(idStock));
                    string idTienda = Session["IDtienda"].ToString();
                    //SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda, Anio.ID_Anio FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE (Producto.Estado = 1)  AND (Producto.Codigo like '%" + TextBox20.Text + "%' OR Producto.Producto like '%" + TextBox20.Text + "%') AND (Tienda.ID_Tienda =" + idTienda + ")";//  AND Rubro.ID_Rubro = " + ID_Rubro;
                    //SqlDataSource1.DataBind();
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
                datos.InsertarStock(0,Convert.ToInt32(cantidadMinima.Text), ubicacion.Text, Convert.ToDecimal(precioProd.Text),   Convert.ToDecimal(precioVenta.Text), Convert.ToInt32(codigop), Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(separar[0]), 1, Convert.ToInt32(DropDownList6.SelectedValue));
                datos.exportarStock(Convert.ToInt32(TextBox3.Text), Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(codigop), Convert.ToInt32(separar[0]), Convert.ToInt32(idStock));
              //  string idTienda = Session["IDtienda"].ToString();
                
                //SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda, Anio.ID_Anio FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE (Producto.Estado = 1)  AND (Producto.Codigo like '%" + TextBox20.Text + "%' OR Producto.Producto like '%" + TextBox20.Text + "%') AND (Tienda.ID_Tienda =" + idTienda + ")";//  AND Rubro.ID_Rubro = " + ID_Rubro;
                //SqlDataSource1.DataBind();
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