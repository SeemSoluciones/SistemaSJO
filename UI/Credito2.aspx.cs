using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using BLL;

namespace UI
{
    public partial class Credito2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
            Home.Mensaje = "Ventana Credito";
        }
        cClientes datos = new cClientes();

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
            if (TextBox1.Text != "")
            {
                DataTable tb = new DataTable();
                tb = datos.ListaClienteCredito(Convert.ToInt32(TextBox1.Text));
                Label1.Text = tb.Rows[0][0].ToString();
                Label2.Text = tb.Rows[0][1].ToString();
                Label4.Text = Convert.ToDecimal( tb.Rows[0][3]).ToString("0.00");
                    SqlDataSource1.SelectCommand = "SELECT Producto.ID_Producto, Producto.Descripcion, Credito.Monto, Credito.SaldoPendiente, Credito.FechaCredito, ItemProdCliente.ID_ItemProdCliente, Credito.ID_Credito FROM ItemProdCliente inner join Credito on ItemProdCliente.ID_Credito = Credito.ID_Credito inner join Producto on ItemProdCliente.ID_Producto = Producto.ID_Producto inner join Cliente on Credito.ID_Cliente = Cliente.ID_Cliente WHERE ItemProdCliente.Estado = 0 AND Cliente.NIT =" + TextBox1.Text;
                    SqlDataSource1.DataBind();
                }
            else
            {
                Response.Write("<script>alert('Ingrese un nit valido')</script>");
            }
            }
            catch
            {
                Response.Write("<script>alert('Error, es posible que el cliente no tenga creditos')</script>");
            }
            
        }
        int contador = 0;
        protected void Button2_Click(object sender, EventArgs e)
        {
            
          foreach(GridViewRow row in GridView1.Rows)
            {
                
                
                CheckBox chkitem = (CheckBox)(row.FindControl("CheckItem"));
                if (chkitem.Checked)
                {
                    contador++; 
                   // datos.EditarCreditoXitem(Convert.ToInt32(row.Cells[6].Text));
                    //datos.InsertarAbonoCredito2(Convert.ToDecimal(row.Cells[3].Text), 0, Convert.ToInt32(row.Cells[7].Text), Convert.ToInt32(row.Cells[6].Text));
                }
            }
            Label5.Text = "Ah seleccionado " + contador + " itmes.";
            Button3_ModalPopupExtender.Show();
          //  Response.Redirect("Credito2.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            foreach(GridViewRow row in GridView1.Rows)
            {
                CheckBox chkitem = (CheckBox)(row.FindControl("CheckItem"));
                if (chkitem.Checked)
                {
                    datos.EditarCreditoXitem(Convert.ToInt32(row.Cells[5].Text));
                    datos.InsertarAbonoCredito2(Convert.ToDecimal(row.Cells[2].Text), 0, Convert.ToInt32(row.Cells[6].Text), Convert.ToInt32(row.Cells[5].Text));
                }
            }
            Label7.Text = "Items cancelado con exito!";
        //  SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Producto, Rubro.Rubro, Credito.Monto, Credito.SaldoPendiente, Credito.FechaCredito, ItemProdCliente.ID_ItemProdCliente, Credito.ID_Credito FROM Rubro INNER JOIN Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN Producto ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN ItemProdCliente ON Producto.Codigo = ItemProdCliente.Codigo INNER JOIN Credito ON ItemProdCliente.ID_Credito = Credito.ID_Credito INNER JOIN Cliente ON Credito.ID_Cliente = Cliente.ID_Cliente WHERE ItemProdCliente.Estado = 0 AND Cliente.NIT = " + TextBox1.Text;
            SqlDataSource1.SelectCommand = "SELECT Producto.ID_Producto, Producto.Descripcion, Credito.Monto, Credito.SaldoPendiente, Credito.FechaCredito, ItemProdCliente.ID_ItemProdCliente, Credito.ID_Credito FROM ItemProdCliente inner join Credito on ItemProdCliente.ID_Credito = Credito.ID_Credito inner join Producto on ItemProdCliente.ID_Producto = Producto.ID_Producto inner join Cliente on Credito.ID_Cliente = Cliente.ID_Cliente WHERE ItemProdCliente.Estado = 0 AND Cliente.NIT =" + TextBox1.Text;
            SqlDataSource1.DataBind();
        }
        public static int Nit;
        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
              Nit = Convert.ToInt32(TextBox1.Text);
            Response.Write("<script>window.open('ImpresionCredito.aspx','Titulo', 'height=300','width=300')</script>");
      
            }
            catch
            {
                Response.Write("<script>alert('Eror, ingrese un dato valido')</script>");
            }
        }
    }
}