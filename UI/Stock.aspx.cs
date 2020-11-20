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
    public partial class Stock : System.Web.UI.Page
    {

        Cproducto datosProd = new Cproducto();
        int idTienda = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana Stock";
            TextBox3.Focus();
           // DropDownList8.Items.Insert(0, new ListItem("Favor de seleccionar uno", ""));
             
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                idTienda = Convert.ToInt32(Session["IDtienda"].ToString());
                if(CheckBox1.Checked == true)
                {
                    SqlDataSource1.SelectCommand = "SELECT DISTINCT Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, stuff((Select ', ' + OEM.OEM + ' ~ ' + Marca.Marca From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM, stuff((Select ', ' + CodigoProducto.Codigo + ' ~ ' + MarcaProd.MarcaP From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP, stuff((Select '| ' + Marca +', '+ Modelo + ', ' + Rubro + ' ~ ' + AnioInicio + '-'+AnioFinal  From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP, Producto.Descripcion, MarcaProd.MarcaP, SubCategoria.SubCategoria + ', ' + Categoria.Categoria AS Categoria, Proveedor.Proveedor, Medida.Medida,  Tienda.ID_Tienda FROM  Medida INNER JOIN  Stock INNER JOIN  Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Proveedor ON Stock.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN  Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN  MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN  Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto Where Producto.Estado = 1 AND Tienda.ID_Tienda =" + idTienda + " AND(OEM.OEM like '%" + TextBox3.Text.Trim() + "%' OR CodigoProducto.Codigo like '%" + TextBox3.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox3.Text.Trim() + "%') AND ("+DropDownList5.SelectedItem.ToString() +" BETWEEN AnioProducto.AnioInicio AND AnioProducto.AnioFinal) AND AnioProducto.ID_Rubro ="+ DropDownList6.SelectedValue;
                    SqlDataSource1.DataBind();
                }
                else
                {
                    SqlDataSource1.SelectCommand = "SELECT DISTINCT Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, stuff((Select ', ' + OEM.OEM + ' ~ ' + Marca.Marca From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM, stuff((Select ', ' + CodigoProducto.Codigo + ' ~ ' + MarcaProd.MarcaP From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP, stuff((Select '| ' + Marca +', '+ Modelo + ', ' + Rubro + ' ~ ' + AnioInicio + '-'+AnioFinal From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP, Producto.Descripcion, MarcaProd.MarcaP, SubCategoria.SubCategoria + ', ' + Categoria.Categoria AS Categoria, Proveedor.Proveedor, Medida.Medida,  Tienda.ID_Tienda FROM  Medida INNER JOIN  Stock INNER JOIN  Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Proveedor ON Stock.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN  Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN  MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN  Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto Where Producto.Estado = 1 AND Tienda.ID_Tienda =" + idTienda + " AND(OEM.OEM like '%"+TextBox3.Text.Trim()+"%' OR CodigoProducto.Codigo like '%"+TextBox3.Text.Trim()+"%' OR Producto.Producto like '%"+TextBox3.Text.Trim()+"%')";
                    SqlDataSource1.DataBind();
                }
               
            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }
        }

   

     protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int SiExiste = datosProd.SiExisteStock(TextBox6.Text, Convert.ToInt32(Session["IDtienda"].ToString()), Convert.ToInt32(DropDownList1.SelectedValue));
                if(SiExiste == 0)
                {
                    if(Convert.ToInt16(precioVenta.Text) == 0)
                    {
                        double precioGan = Convert.ToDouble(precioProd.Text) * 0.7;
                        double precioVentaP = precioGan + Convert.ToDouble(precioProd.Text);
                        int idTtienda = 0;
                    idTtienda = Convert.ToInt32(Session["IDtienda"]);
                    datosProd.InsertarStock (Convert.ToInt32(cantidad.Text), Convert.ToInt32(cantidadMinima.Text), ubicacion.Text, Convert.ToDecimal(precioProd.Text), Convert.ToDecimal(precioVentaP), Convert.ToInt32(Label1.Text),idTtienda, Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(DropDownList8.SelectedValue), Convert.ToInt32(DropDownList6.SelectedValue));
                    Response.Redirect("Stock.aspx");
                    }
                    else{
                        double precioGan = Convert.ToDouble(precioProd.Text) * 0.7;
                        double precioVentaP = precioGan + Convert.ToDouble(precioVenta.Text);
                        int idTtienda = 0;
                        idTtienda = Convert.ToInt32(Session["IDtienda"]);
                        datosProd.InsertarStock(Convert.ToInt32(cantidad.Text), Convert.ToInt32(cantidadMinima.Text), ubicacion.Text, Convert.ToDecimal(precioProd.Text), Convert.ToDecimal(precioVentaP), Convert.ToInt32(Label1.Text), idTtienda, Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(DropDownList8.SelectedValue), Convert.ToInt32(DropDownList6.SelectedValue));
                        Response.Redirect("Stock.aspx");
                    }
                    
                }
                else if(SiExiste  > 0)
                {
                    Response.Write("<script>alert('El producto, la MARCA (del producto) y la tienda ya esta registrado en el stock. Pruebe con otra Marca de producto.')</script>");
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
            string miValor, miValor2, miValor3;
            GridViewRow r = GridView1.SelectedRow;
            IDstock.Text = r.Cells[1].Text;
            Cant.Text = r.Cells[3].Text;
            Ubi.Text = r.Cells[4].Text;
            PrecioP.Text = r.Cells[5].Text;
            PrecioVe.Text = r.Cells[6].Text;
            miValor = r.Cells[11].Text;
            miValor2 = r.Cells[13].Text;
            miValor3 = r.Cells[14].Text;
            DropDownList7.SelectedIndex = DropDownList7.Items.IndexOf(DropDownList7.Items.FindByText(miValor));
            DropDownList9.SelectedIndex = DropDownList9.Items.IndexOf(DropDownList9.Items.FindByText(miValor2));
            DropDownList10.SelectedIndex = DropDownList10.Items.IndexOf(DropDownList10.Items.FindByText(miValor3));
            Button6_ModalPopupExtender.Show();
            
        }

        protected void Button4_Click1(object sender, EventArgs e)
        {
            try
            {
                datosProd.EditarStock(Convert.ToInt32(IDstock.Text),Convert.ToInt32(Cant.Text) , Ubi.Text,Convert.ToDecimal(PrecioP.Text), Convert.ToDecimal(PrecioVe.Text), Convert.ToInt32(DropDownList7.SelectedValue), Convert.ToInt32(DropDownList9.SelectedValue), Convert.ToInt32(DropDownList10.SelectedValue));
                Response.Redirect("Stock.aspx");
             }
            catch
            {
                Response.Write("<script>alert('Error, Datos no actualizado')</script>");
            }
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
                    Label1.Text = Producto["ID_Producto"].ToString();
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
            if(mens == 1)
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
                    SqlDataSource1.SelectCommand = "SELECT DISTINCT Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, stuff((Select ', ' + OEM.OEM + ' ~ ' + Marca.Marca From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM, stuff((Select ', ' + CodigoProducto.Codigo + ' ~ ' + MarcaProd.MarcaP From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP, stuff((Select '| ' + AnioInicio + '-' + AnioFinal + ' ~ ' + Rubro + ', ' + Modelo + ', ' + Marca From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP, Producto.Descripcion, MarcaProd.MarcaP, SubCategoria.SubCategoria + ', ' + Categoria.Categoria AS Categoria, Proveedor.Proveedor, Medida.Medida,  Tienda.ID_Tienda FROM  Medida INNER JOIN  Stock INNER JOIN  Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Proveedor ON Stock.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN  Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN  MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN  Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto inner join AnioProducto on Producto.ID_Producto = AnioProducto.ID_Producto Where Producto.Estado = 1 AND Tienda.ID_Tienda =" + idTienda + " AND(OEM.OEM like '%" + TextBox3.Text + "%' OR CodigoProducto.Codigo like '%" + TextBox3.Text + "%' OR Producto.Producto like '%" + TextBox3.Text + "%') AND (" + DropDownList5.SelectedItem.ToString() + " BETWEEN AnioProducto.AnioInicio AND AnioProducto.AnioFinal) AND AnioProducto.ID_Rubro =" + DropDownList4.SelectedValue;
                    SqlDataSource1.DataBind();
                }
                else
                {
                    SqlDataSource1.SelectCommand = "SELECT DISTINCT Stock.ID_Existencia, Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, stuff((Select ', ' + OEM.OEM + ' ~ ' + Marca.Marca From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM, stuff((Select ', ' + CodigoProducto.Codigo + ' ~ ' + MarcaProd.MarcaP From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP, stuff((Select '| ' + AnioInicio + '-' + AnioFinal + ' ~ ' + Rubro + ', ' + Modelo + ', ' + Marca From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP, Producto.Descripcion, MarcaProd.MarcaP, SubCategoria.SubCategoria + ', ' + Categoria.Categoria AS Categoria, Proveedor.Proveedor, Medida.Medida,  Tienda.ID_Tienda FROM  Medida INNER JOIN  Stock INNER JOIN  Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Proveedor ON Stock.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN  Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN  MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN  Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto Where Producto.Estado = 1 AND Tienda.ID_Tienda =" + idTienda + " AND(OEM.OEM like '%" + TextBox3.Text + "%' OR CodigoProducto.Codigo like '%" + TextBox3.Text + "%' OR Producto.Producto like '%" + TextBox3.Text + "%')";
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