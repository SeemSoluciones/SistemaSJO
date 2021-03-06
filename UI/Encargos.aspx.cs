﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using BLL;

namespace UI
{
    public partial class Encargos : System.Web.UI.Page
    {
        Cproducto Datos = new Cproducto();
        cClientes DatosCl = new cClientes();
        DataTable tabla = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana Encomienda de productos";
            FechaActual.Text = System.DateTime.Now.ToString("yyyy/MM/dd");
        }

        int IDc = 0;
        string nom = "";
        public static string nit2, nombre, idEncargo = "";
        public static double total, abono, pendiente;
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] imag = FileUpload1.FileBytes;
                string idTienda = Session["IDtienda"].ToString();
                string idEmpleado = Session["IdEmpleado"].ToString();
                total = Convert.ToDouble(TextBox9.Text);
                abono = Convert.ToDouble(TextBox2.Text);
                pendiente = total - abono;
                nit2 = TextBox1.Text;
                nombre = TextBox3.Text;
               idEncargo = Datos.nuevoEncargo(Convert.ToDateTime(FechaEn.Text), Convert.ToDecimal(TextBox2.Text), TextBox4.Text, Producto.Text, Convert.ToInt32(Label1.Text), imag, Convert.ToDecimal(TextBox9.Text), Convert.ToInt32(idEmpleado), TextBox11.Text);
               // Datos.InsertarVenta(Convert.ToDecimal(TextBox2.Text), 0, Convert.ToDecimal(TextBox2.Text), 0,Convert.ToInt32(idEmpleado) ,Convert.ToInt32(idTienda), Convert.ToInt32(Label1.Text));
              //  Response.Write("<script>alert('" + msj + "')</script>");
                Response.Write("<script>window.open('ComprobanteEncargo.aspx','Titulo', 'height=300','width=300')</script>");
                ListaEncargos.SelectCommand = "SELECT Cliente.NIT, Cliente.Nombre + '  ' + Cliente.Apellidos AS Nom, ProductoXencargo.Producto, ProductoXencargo.FechaPedido, ProductoXencargo.FechaEntrega, ProductoXencargo.Anticipo, ProductoXencargo.PrecioReal, ProductoXencargo.Descripcion, ProductoXencargo.Fotografia, ProductoXencargo.Estado, ProductoXencargo.ID_ProdXen, Empleado.Nombre + ' ' + Empleado.Apellidos AS Nombre, Tienda.Tienda, ProductoXencargo.Proveedor FROM ProductoXencargo INNER JOIN Cliente ON ProductoXencargo.ID_Cliente = Cliente.ID_Cliente INNER JOIN Empleado ON ProductoXencargo.ID_Empleado = Empleado.ID_Empleado INNER JOIN Tienda ON Empleado.ID_Tienda = Tienda.ID_Tienda WHERE (ProductoXencargo.Estado = 0)";
                ListaEncargos.DataBind();
                // Response.Redirect("Encargos.aspx");
            }
            catch
            {
                Response.Write("<script>alert('LLenes los campos correctamente')</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string str = TextBox1.Text.Trim();
            int Num;
            bool isNum = int.TryParse(str, out Num);
            if (!isNum)
            {
                Response.Write("<script>alert('Introduce un NIT')</script>");
            }
            else
            {
                int SiExiste = DatosCl.SiExisteCliente(Convert.ToInt32(TextBox1.Text));
                if(SiExiste == 0)
                {
                     Button3_ModalPopupExtender.Show();
                    TextBox5.Text = TextBox1.Text;
                }
                else
                {
                tabla = DatosCl.ListaUncliente(Convert.ToInt32(TextBox1.Text));
                IDc = Convert.ToInt32(tabla.Rows[0][0]);
                nom = tabla.Rows[0][7].ToString();
                TextBox3.Text = nom;
                Label1.Text = IDc.ToString();
                }   
            }
        }

        private static string ID_E, anticipo, IdProd = "";
        public static decimal Resto = 0, nit;
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable tablaProd = new DataTable();
            
            GridViewRow dt = GridView2.SelectedRow;
            ID_E = dt.Cells[8].Text;
            anticipo = dt.Cells[5].Text;
            nit = Convert.ToInt32(dt.Cells[0].Text);
           // CodProd = dt.Cells[2].Text;
           // tablaProd = Datos.BuscarProducto2(CodProd);
           // IdProd = dt.Cells[5].Text;
            Resto = Convert.ToDecimal(dt.Cells[6].Text) - Convert.ToDecimal(anticipo);
            TextBox8.Text = Resto.ToString();
            TextBox10.Text = nit.ToString() +" "+ dt.Cells[1].Text;
            Button6_ModalPopupExtender.Show();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                string msj;
                msj = DatosCl.InsertarCliente(Convert.ToInt32(TextBox5.Text), TextBox6.Text, TextBox7.Text, txtEdad.Text, Convert.ToInt32(txtTelefono.Text), 0, "", "",0);
                Label2.Text = msj;
               
                tabla = DatosCl.ListaUncliente(Convert.ToInt32(TextBox1.Text));
                IDc = Convert.ToInt32(tabla.Rows[0][0]);
                nom = tabla.Rows[0][7].ToString();
                TextBox3.Text = nom;
                Label1.Text = IDc.ToString();

            }
            catch
            {
                Label2.Text =  "Error, revise los campos";
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            try
            {
                string msj;
                string idTienda = Session["IDtienda"].ToString();
                string idEmpleado = Session["IdEmpleado"].ToString();
                decimal subtotal, total = 0;
                subtotal = Resto + Convert.ToDecimal(anticipo);
                total = Resto + Convert.ToDecimal(anticipo); ;
               
                Datos.EliminarEncargo(Convert.ToInt32(ID_E));
          
                Response.Write("<script>alert('Se ha realizado el pago pendiente de: "+total+"')</script>");
                Response.Write("<script>window.open('ImpCompro.aspx','Titulo', 'height=300','width=300')</script>");


                ListaEncargos.SelectCommand = "SELECT Cliente.NIT, Cliente.Nombre + '  ' + Cliente.Apellidos AS Nom, ProductoXencargo.Producto, ProductoXencargo.FechaPedido, ProductoXencargo.FechaEntrega, ProductoXencargo.Anticipo, ProductoXencargo.PrecioReal, ProductoXencargo.Descripcion, ProductoXencargo.Fotografia, ProductoXencargo.Estado, ProductoXencargo.ID_ProdXen, Empleado.Nombre + ' ' + Empleado.Apellidos AS Nombre, Tienda.Tienda, ProductoXencargo.Proveedor FROM ProductoXencargo INNER JOIN Cliente ON ProductoXencargo.ID_Cliente = Cliente.ID_Cliente INNER JOIN Empleado ON ProductoXencargo.ID_Empleado = Empleado.ID_Empleado INNER JOIN Tienda ON Empleado.ID_Tienda = Tienda.ID_Tienda WHERE(ProductoXencargo.Estado = 0)";
                ListaEncargos.DataBind();
            }
            catch
            {
                Label3.Text = "Error, revise los campos";
            }
             
        }
    }
}