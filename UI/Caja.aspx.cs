using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;


namespace UI
{
    public partial class Caja : System.Web.UI.Page
    {
        Cproducto datos = new Cproducto();
        DataTable tabla = new DataTable();
        cClientes datos2 = new cClientes();
        DataTable dt = new DataTable();
        decimal subtotal = 0;
        decimal descuento;
        decimal subtotal2;
        decimal total;
        private static int cantProd = 0, idStock = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                TextBox2.Text = DateTime.Now.ToString("dd/MM/yyyy");
                Home.Mensaje = "Ventana Ventas";
                if (!IsPostBack)
                {
                    // this.Button12.Click += new System.EventHandler(this.Button12_Click);
                    //Button12_Click(sender, e);
                    TxtDescuento.Value = "";
                }
                SqlDataSource1.SelectParameters["ID_Tienda"].DefaultValue = Session["IDtienda"].ToString();
                SqlDataSource1.DataBind();
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }


      protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {

                SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE  CONTAINS(Producto.Descripcion, '"+TextBox20.Text.Trim()+"') AND Producto.Estado = 1";
                SqlDataSource2.DataBind();
            }
            catch
            {
                Response.Write("<script>alert('Error, boton en fase de prueba. Consulte al tecnico')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox7.Text == "" || TextBox8.Text == "" || TextBox9.Text == "" || TextBox11.Text == "")
            {
                Response.Write("<script>alert('Seleccione y indique la cantidad')</script>");
            }
            else
            {
                double descuento = 0;
                double totalDesc = 0.0;
                totalDesc = Convert.ToDouble(TextBox10.Text) * 0.01;
                descuento = Convert.ToDouble(TextBox9.Text) * totalDesc * Convert.ToDouble(TextBox11.Text);
                string idTienda = Session["IDtienda"].ToString();
                if (cantProd >= Convert.ToInt32(TextBox11.Text))
                {
                    dt.Columns.Add("Codigo");
                    dt.Columns.Add("Descripcion");
                    dt.Columns.Add("Precio");
                    dt.Columns.Add("Descuento");
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
                                dr["Descuento"] = descuento.ToString();
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
                        dr["Descuento"] = descuento.ToString();
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
                else
                {
                    Response.Write("<script>alert('Solo existe: " + cantProd + " de producto')</script>");
                }
            }
             
        }
        public static decimal descuentoFactura;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                subtotal2 = subtotal2 + Convert.ToDecimal(e.Row.Cells[6].Text);
                descuento = descuento + Convert.ToDecimal(e.Row.Cells[4].Text);
                total = subtotal2 - descuento;
            }
            TextBox12.Text = subtotal2.ToString();
            TextBox13.Text = descuento.ToString();
            TextBox14.Text = total.ToString();
            Label2.Text = total.ToString();
            descuentoFactura = descuento;

        }


        private void limpiar()
        {
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "0";
            TextBox11.Text = "1";

        }
        public static string msj = "", Pago = "";
        public static string nombre, nit, ciudad;
        protected void Button3_Click(object sender, EventArgs e)
        {

            try
            {

                if (DropDownList4.SelectedItem.Text.Trim() == "Credito")
                {
                    if((DataTable)ViewState["Detalles"] != null)
                    {

                        int siexiste, siexistecredito = 0;

                        siexiste = datos2.SiExisteCliente(Convert.ToInt32(TextBox3.Text));
                        if (siexiste == 1)
                        {
                            siexistecredito = datos2.SiExisteCredito(Convert.ToInt32(TextBox3.Text));
                            if (siexistecredito == 1)
                            {
                                DataTable tablaMonto = new DataTable();
                                tablaMonto = datos2.SaldoPendiente(Convert.ToInt32(TextBox3.Text));
                                tabla = datos2.ListaCreditoMax(Convert.ToInt32(TextBox3.Text));
                                TextBox6.Text = tabla.Rows[0][1].ToString();
                                TextBox15.Text = tabla.Rows[0][2].ToString();
                                Label4.Text = "Saldo pendiente: " + tablaMonto.Rows[0][5].ToString() + "    ";
                                Label5.Text = "Fecha máximo de pago: " + tablaMonto.Rows[0][4].ToString();
                                Button8.Visible = false;
                                Button4_ModalPopupExtender.Show();

                            }
                            else if (siexistecredito == 0)
                            {
                                Button5.Visible = false;
                                Button4_ModalPopupExtender.Show();
                            }
                        }
                        else if (siexiste == 0)
                        {
                            Button6_ModalPopupExtender.Show();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Error, ingrese un articulo')</script>");
                    }
                }
                else
                {
                    string idTienda = Session["IDtienda"].ToString();
                    string idEmpleado = Session["IdEmpleado"].ToString();

                    double iva = 0;
                    iva = 0.12 * Convert.ToDouble(TextBox14.Text);
                    msj = datos.InsertarVenta(Convert.ToDecimal(TextBox12.Text), Convert.ToDecimal(TextBox13.Text), Convert.ToDecimal(TextBox14.Text), Convert.ToDecimal(iva), Convert.ToInt32(idEmpleado), Convert.ToInt32(DropDownList1.SelectedValue));
                    datos.InsertarEstdos(Convert.ToInt32(msj), Convert.ToInt32(idTienda));
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        datos.InsertarDetalleVenta(
                            Convert.ToInt32(row.Cells[5].Text),
                            Convert.ToDecimal(row.Cells[3].Text),
                            Convert.ToDecimal(row.Cells[6].Text),
                            Convert.ToInt32(msj),
                            row.Cells[1].Text,
                            Convert.ToInt32(DropDownList4.SelectedValue),
                            Convert.ToInt32(row.Cells[7].Text)

                            );
                    }
                    nit = TextBox3.Text;
                    nombre = TextBox4.Text;
                    ciudad = TextBox5.Text;

                    Pago = DropDownList4.SelectedItem.ToString();
                    Label6.Text = "La venta ya fue guardada!!!";
                }
        }
            catch
            {
                Response.Write("<script>alert('Error, ingrese un articulo')</script>");
            }
        }


        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                string idCliente;
                string idTienda = Session["IDtienda"].ToString();
                string idEmpleado = Session["IdEmpleado"].ToString();
                tabla = datos2.ListaCreditoMax(Convert.ToInt32(TextBox3.Text));
                idCliente = tabla.Rows[0][3].ToString();
                datos2.EditarInfoCredito(Convert.ToDecimal(TextBox6.Text), Convert.ToInt32(TextBox15.Text), Convert.ToInt32(idCliente));
                string msj = "", msj2 = "";
                msj = datos.InsertarVenta(Convert.ToDecimal(TextBox12.Text), Convert.ToDecimal(TextBox13.Text), Convert.ToDecimal(TextBox14.Text), 0, Convert.ToInt32(idEmpleado), Convert.ToInt32(idTienda));
                msj2 = datos2.InsertarCredito(Convert.ToDecimal(TextBox14.Text), Convert.ToInt32(idCliente), Convert.ToInt32(msj));
                 foreach (GridViewRow row in GridView1.Rows)
                {
                    datos.InsertarDetalleVenta(
                        Convert.ToInt32(row.Cells[5].Text),
                        Convert.ToDecimal(row.Cells[3].Text),
                        Convert.ToDecimal(row.Cells[6].Text),
                        Convert.ToInt32(msj),
                        row.Cells[1].Text,
                        Convert.ToInt32(DropDownList4.SelectedValue),
                        Convert.ToInt32(row.Cells[7].Text));
                    datos2.InsertarCreditoPorItem(row.Cells[1].Text, Convert.ToInt32(msj2));
                }
                nit = TextBox3.Text;
                nombre = TextBox4.Text;
                ciudad = TextBox5.Text;
                Label6.Text = "La venta ya fue guardada!!!";
            }
            catch
            {
                TextBox3.BackColor = System.Drawing.Color.Red;
                TextBox3.Text = "No se registro los datos";
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            try
            {
                string nom, ape;
                datos2.InsertarCliente(Convert.ToInt32(TextBox16.Text), TextBox17.Text, TextBox18.Text, txtEdad.Text, Convert.ToInt32(txtTelefono.Text));
                tabla =  datos2.ListaUncliente(Convert.ToInt32(TextBox3.Text));
                nom = tabla.Rows[0][2].ToString();
                ape = tabla.Rows[0][3].ToString();
                TextBox4.Text = nom + "  "+ ape;
                Label6.Text = "El cliente fue guardado. Por favor vuelva a pulsar el boton 'Guardar'";
            }
            catch
            {
                TextBox4.BackColor = System.Drawing.Color.Red;
                TextBox4.Text = "Error, revise los campos";
                Label6.Text = "Error! revise los campos";
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            DataTable tabla = new DataTable();
             try
              {
            string idCliente;
                string idTienda = Session["IDtienda"].ToString();
                string idEmpleado = Session["IdEmpleado"].ToString();
                tabla = datos2.ListaUncliente(Convert.ToInt32(TextBox3.Text));
            idCliente = tabla.Rows[0][0].ToString();
            datos2.InsertarInfoCredito(Convert.ToDecimal(TextBox6.Text), Convert.ToInt32(TextBox15.Text), Convert.ToInt32(idCliente));
             string msj = "", msj2 = "";
               
              msj = datos.InsertarVenta(Convert.ToDecimal(TextBox12.Text), Convert.ToDecimal(TextBox13.Text), Convert.ToDecimal(TextBox14.Text), 0, Convert.ToInt32(idEmpleado), Convert.ToInt32(idTienda));
              msj2 =  datos2.InsertarCredito(Convert.ToDecimal(TextBox14.Text), Convert.ToInt32(idCliente), Convert.ToInt32(msj));
              foreach (GridViewRow row in GridView1.Rows)
              {
                  datos.InsertarDetalleVenta(
                     Convert.ToInt32(row.Cells[5].Text),
                     Convert.ToDecimal(row.Cells[3].Text),
                     Convert.ToDecimal(row.Cells[6].Text),
                     Convert.ToInt32(msj),
                     row.Cells[1].Text,
                     Convert.ToInt32(DropDownList4.SelectedValue),
                     Convert.ToInt32(row.Cells[7].Text)
                      );

                   datos2.InsertarCreditoPorItem(
                     row.Cells[1].Text, 
                     Convert.ToInt32(msj2));
              }
                nit = TextBox3.Text;
                nombre = TextBox4.Text;
                ciudad = TextBox5.Text;
                // Response.Redirect("Caja.aspx"); 
                Label6.Text = "La venta ya fue guardada!!!";
            }
          catch
          {
              TextBox3.BackColor = System.Drawing.Color.Red;
              TextBox3.Text = "No se registro los datos";
          }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            dt = (DataTable)ViewState["Detalles"];
            dt.Rows[index].Delete();
            GridView1.DataSource = dt;
            GridView1.DataBind();
           
        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto,MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda  Where (Producto.Estado = 1) AND Rubro.ID_Rubro = " + DropDownList6.SelectedValue;
            SqlDataSource2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           if(TextBox14.Text == "")
            {
                Response.Write("<script>alert('Ingrese un producto a la caja')</script>");
            }
            else
            {
            Response.Write("<script>window.open('Factura2.aspx','Titulo', 'height=300','width=300')</script>");
            }
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            if(TxtDescuento.Value != "")
            {
                try
                {
                double TotalFinal = 0;
                double porc = 0;
                porc = (Convert.ToDouble(TxtDescuento.Value) * 0.01) * Convert.ToDouble(TextBox12.Text);
                TotalFinal = Convert.ToDouble(TextBox12.Text) - (porc + Convert.ToDouble(TextBox13.Text));
                TextBox14.Text = TotalFinal.ToString();
                TextBox13.Text = porc.ToString();
                }
                catch
                {
                    Response.Write("<script>alert('Ingrese un producto.')</script>");
                }
              
            }
            else
            {
                Response.Write("<script>alert('Ingrese un valor valido.')</script>");
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string _estado = DataBinder.Eval(e.Row.DataItem, "Tienda").ToString();

                if (_estado == Session["Tienda"].ToString())
                {
                   
                }
                else
                {
                   e.Row.BackColor = System.Drawing.Color.LightGreen;
                }
             
            }

    }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Caja.aspx");
        }

        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList6.Text == "")
            {

            }
            else
            {
             SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda Where (Producto.Estado = 1) AND  Rubro.ID_Rubro = " + DropDownList6.SelectedValue + " AND  Anio.ID_Anio = " + DropDownList7.SelectedValue;
             SqlDataSource2.DataBind();
            }
           
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox20.Text != string.Empty)
                  {
                    int ID_Rubro, ID_Rubro2;
                    ID_Rubro = datos.ID_Rubro(TextBox20.Text);
                    ID_Rubro2 = datos.ID_Rubro2(TextBox20.Text);

                    if (CheckBox2.Checked == false && CheckBox3.Checked == false && CheckBox4.Checked == false)
                    {
                        SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE  (Producto.Codigo like '%" + TextBox20.Text.Trim() + "%' AND Producto.Estado = 1) OR (Producto.Producto like '%" + TextBox20.Text.Trim() + "%' AND Producto.Estado = 1) OR (Producto.Codigo2 like '%" + TextBox20.Text.Trim() + "%' AND Producto.Estado = 1)";//  AND Rubro.ID_Rubro = " + ID_Rubro;
                        SqlDataSource2.DataBind();
                    }
                    else if (CheckBox2.Checked == false && CheckBox3.Checked == true && CheckBox4.Checked == false)
                    {
                        SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE Producto.Estado = 1 AND (Producto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%' OR Producto.Codigo2 like '%" + TextBox20.Text.Trim() + "%') AND Marca.ID_Marca =" + DropDownList2.SelectedValue;//  AND Rubro.ID_Rubro = " + ID_Rubro;//agregado 11/07
                        SqlDataSource2.DataBind();
                    }
                    else if (CheckBox2.Checked == false && CheckBox3.Checked == false && CheckBox4.Checked == true)
                    {
                        SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2,  Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE Producto.Estado = 1 AND (Producto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%' OR Producto.Codigo2 like '%" + TextBox20.Text.Trim() + "%') AND Modelo.ID_Modelo =" + DropDownList5.SelectedValue;//  AND Rubro.ID_Rubro = " + ID_Rubro;//agregado 11/07
                        SqlDataSource2.DataBind();
                    }
                    else if (CheckBox2.Checked == true && CheckBox3.Checked == false && CheckBox4.Checked == false)
                    {
                        SqlDataSource2.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, Producto.Descripcion AS Producto, MarcaProd.MarcaP, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Anio.Anio, Stock.Cantidad, Stock.Ubicacion, Stock.PrecioUnitario, Stock.PrecioVenta, Stock.ID_Existencia, Medida.Medida, Tienda.Tienda FROM Anio INNER JOIN Stock INNER JOIN Producto ON Stock.Codigo = Producto.Codigo ON Anio.ID_Anio = Stock.ID_Anio INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Medida on Stock.ID_Medida = Medida.ID_Medida INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda WHERE Producto.Estado = 1 AND (Producto.Codigo like '%" + TextBox20.Text.Trim() + "%' OR Producto.Producto like '%" + TextBox20.Text.Trim() + "%' OR Producto.Codigo2 like '%" + TextBox20.Text.Trim() + "%') AND  Anio.ID_Anio = " + DropDownList7.SelectedValue;
                        SqlDataSource2.DataBind();
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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gd = GridView2.SelectedRow;
            TextBox7.Text = GridView2.SelectedRow.Cells[0].Text;
            TextBox8.Text = gd.Cells[2].Text;
            TextBox9.Text = gd.Cells[11].Text;
            TextBox10.Text = "0";
            TextBox11.Text = "1";
            cantProd = Convert.ToInt32(gd.Cells[8].Text);
            idStock = Convert.ToInt32(gd.Cells[12].Text);
        }
    }
}