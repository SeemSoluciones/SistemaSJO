﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace UI
{
    public partial class DevProProV : System.Web.UI.Page
    {

        Cproducto datos = new Cproducto();
        DataTable tabla = new DataTable();
        DataTable dt = new DataTable();

        decimal subtotal, total;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox2.Text = DateTime.Now.ToString("dd/MM/yyyy");
            Vendedor.Mensaje = "Ventana devolucion de productos a proveedores";
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
            if (TextBox7.Text == "" || TextBox8.Text == "" || TextBox9.Text == "" || TextBox11.Text == "")
            {
                Response.Write("<script>alert('Seleccione y el motivo de la devolucion)</script>");
            }
            else
            {
                // dt.Columns.Add("ID");
                dt.Columns.Add("Codigo");
                dt.Columns.Add("Descripcion");
                dt.Columns.Add("Motivo");
                dt.Columns.Add("Cantidad");

                DataRow dr = null;
                if (ViewState["Detalles"] != null)
                {
                    for (int i = 0; i < 1; i++)
                    {
                        dt = (DataTable)ViewState["Detalles"];
                        if (dt.Rows.Count > 0)
                        {
                            // subtotal = Convert.ToDecimal(TextBox11.Text) * Convert.ToDecimal(TextBox9.Text);
                            dr = dt.NewRow();
                            //  dr["ID"] = Label1.Text;
                            dr["Codigo"] = TextBox7.Text;
                            dr["Descripcion"] = TextBox8.Text;
                            dr["Motivo"] = TextBox9.Text;
                            dr["Cantidad"] = TextBox11.Text;
                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                        }
                    }

                }
                else
                {
                    //  subtotal = Convert.ToDecimal(TextBox11.Text) * Convert.ToDecimal(TextBox9.Text);
                    dr = dt.NewRow();
                    // dr["ID"] = Label1.Text;
                    dr["Codigo"] = TextBox7.Text;
                    dr["Descripcion"] = TextBox8.Text;
                    dr["Motivo"] = TextBox9.Text;
                    dr["Cantidad"] = TextBox11.Text;
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                ViewState["Detalles"] = dt;
                limpiar();

            }
        }


        //protected void EliminarClick(object sender, EventArgs e)
        //{


        //    SqlDataSource4.UpdateParameters["ID_DevProPro"].DefaultValue = GridView3.SelectedRow.Cells[0].ToString();
        //    SqlDataSource4.UpdateParameters["Cantidad"].DefaultValue = GridView3.SelectedRow.Cells[3].ToString();
        //    SqlDataSource4.UpdateParameters["ID_Existencia"].DefaultValue = GridView3.SelectedRow.Cells[6].ToString();
        //    SqlDataSource4.Insert();
        //}

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                string msj = "";
                // msj = datos.InsertarCompra(Convert.ToDecimal(TextBox12.Text), TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue));
                foreach (GridViewRow row in GridView1.Rows)
                {
                    datos.InsertDevProPro(Convert.ToInt32(row.Cells[0].Text), row.Cells[2].Text, TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(row.Cells[3].Text));
                }

                Response.Redirect("DevProPro.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Error, valva a intentar')</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {


            SqlDataSource9.SelectCommand = "SELECT DISTINCT Producto.ID_Producto,stuff((Select ', ' + OEM.OEM From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM , stuff((Select ', ' + CodigoProducto.Codigo From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP,Producto.Descripcion, stuff((Select '| ' + Marca +', '+ Modelo + ', ' + Rubro + ' ~ ' + AnioInicio + '-'+AnioFinal From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria, MarcaProd.MarcaP, Stock.PrecioVenta, Stock.Cantidad, Stock.PrecioUnitario, Stock.Ubicacion, Medida.Medida,           Tienda.Tienda, Stock.ID_Existencia FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN          SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN          MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN          Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto inner join AnioProducto on Producto.ID_Producto = AnioProducto.ID_Producto Where (Producto.Estado = 1)  AND SubCategoria.ID_SubCategoria =" + DropDownList3.SelectedValue;
            SqlDataSource9.DataBind();
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
            TextBox7.Text = GridView2.SelectedRow.Cells[11].Text;
            TextBox8.Text = gd.Cells[2].Text + " ~ " + gd.Cells[4].Text;
            TextBox11.Text = "1";
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

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource4.UpdateParameters["ID_DevProPro"].DefaultValue = GridView3.SelectedRow.Cells[0].Text;
            SqlDataSource4.UpdateParameters["Cantidad"].DefaultValue = GridView3.SelectedRow.Cells[3].Text;
            SqlDataSource4.UpdateParameters["ID_Existencia"].DefaultValue = GridView3.SelectedRow.Cells[6].Text;
            SqlDataSource4.Update();
            SqlDataSource10.InsertParameters["ID_Existencia"].DefaultValue = GridView3.SelectedRow.Cells[6].Text;
            SqlDataSource10.InsertParameters["ID_Proveedor"].DefaultValue = GridView3.SelectedRow.Cells[7].Text;
            SqlDataSource10.InsertParameters["Factura"].DefaultValue = GridView3.SelectedRow.Cells[1].Text;
            SqlDataSource10.InsertParameters["Motivo"].DefaultValue = GridView3.SelectedRow.Cells[2].Text;
            SqlDataSource10.InsertParameters["Cantidad"].DefaultValue = GridView3.SelectedRow.Cells[3].Text;
            SqlDataSource10.Insert();

            Response.Redirect("DevProPro.aspx");


            //   SqlDataSource4.SelectCommand = "SELECT DevProPro.ID_DevProPro, DevProPro.Factura, DevProPro.Motivo, DevProPro.Cantidad, Producto.Descripcion + ' ~ '+MarcaProd.MarcaP AS Descripcion, Proveedor.Proveedor, Stock.ID_Existencia FROM DevProPro INNER JOIN Proveedor ON DevProPro.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN Stock ON DevProPro.ID_Existencia = Stock.ID_Existencia inner join Producto on Producto.ID_Producto = Stock.ID_Producto inner join MarcaProd on Stock.ID_MaraProd = MarcaProd.ID_MaraProd WHERE (DevProPro.Estado = 1)";
            /// SqlDataSource4.DataBind();
        }



        protected void Button9_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox20.Text != string.Empty)
                {

                    if (CheckBox2.Checked == false)
                    {
                        SqlDataSource9.SelectCommand = "SELECT DISTINCT Producto.ID_Producto,stuff((Select ', ' + OEM.OEM From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM , stuff((Select ', ' + CodigoProducto.Codigo From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP,Producto.Descripcion, stuff((Select '| ' + Marca +', '+ Modelo + ', ' + Rubro + ' ~ ' + AnioInicio + '-'+AnioFinal  From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria, MarcaProd.MarcaP, Stock.PrecioVenta, Stock.Cantidad, Stock.PrecioUnitario, Stock.Ubicacion, Medida.Medida,           Tienda.Tienda, Stock.ID_Existencia FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN          SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN          MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN          Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto  Where (Producto.Estado = 1) AND  (OEM.OEM like '%" + TextBox20.Text.Trim() + "%' OR CodigoProducto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%')";

                        SqlDataSource9.DataBind();
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
                        if (Convert.ToInt16(DropDownList6.SelectedValue) == 0 || Convert.ToInt16(DropDownList7.SelectedValue) == 0)
                        {
                            Response.Write("<script>alert('Error, favor de revisar marca/ linea/ cilindraje o motor y por supuesto el año')</script>");
                        }
                        else
                        {
                            SqlDataSource9.SelectCommand = "SELECT DISTINCT Producto.ID_Producto,stuff((Select ', ' + OEM.OEM From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM , stuff((Select ', ' + CodigoProducto.Codigo From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP,Producto.Descripcion, stuff((Select '| ' + Marca +', '+ Modelo + ', ' + Rubro + ' ~ ' + AnioInicio + '-'+AnioFinal  From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria, MarcaProd.MarcaP, Stock.PrecioVenta, Stock.Cantidad, Stock.PrecioUnitario, Stock.Ubicacion, Medida.Medida,           Tienda.Tienda, Stock.ID_Existencia FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN          SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN  MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto inner join AnioProducto on Producto.ID_Producto = AnioProducto.ID_Producto Where (Producto.Estado = 1) AND (OEM.OEM like '%" + TextBox20.Text.Trim() + "%' OR CodigoProducto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%') AND (" + DropDownList7.SelectedItem + " BETWEEN AnioProducto.AnioInicio AND AnioProducto.AnioFinal) AND AnioProducto.ID_Rubro =" + DropDownList6.SelectedValue;
                            SqlDataSource9.DataBind();
                        }
                    }
                }

                else
                {
                    Response.Write("<script>alert('Error, revise los campos. Ej: Puede ser que tanto marca como linea estan marcadas, marque solo uno')</script>");
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