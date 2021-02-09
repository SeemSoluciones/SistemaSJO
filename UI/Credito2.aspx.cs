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
                tb = datos.ListaClienteCredito(Convert.ToInt32(TextBox1.Text.Trim()));
                Label1.Text = tb.Rows[0][0].ToString();
                Label2.Text = tb.Rows[0][1].ToString();
                Label4.Text = Convert.ToDecimal(tb.Rows[0][2]).ToString("0.00");
                    SqlDataSource1.SelectParameters["NIT"].DefaultValue = TextBox1.Text;
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
            Nit = Convert.ToInt32(TextBox1.Text);
            decimal totalpagar = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                
                
                CheckBox chkitem = (CheckBox)(row.FindControl("CheckItem"));
                if (chkitem.Checked)
                {
                    totalpagar += Convert.ToDecimal(row.Cells[4].Text); 
                    contador++;

                }
            }
            Label5.Text = "Ah seleccionado " + contador + " itmes." + "TOTAL A PAGAR: " + totalpagar;
            Button3_ModalPopupExtender.Show();
          //  Response.Redirect("Credito2.aspx");
        }
        public static string nombre, nit;
        protected void Button4_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID_Producto");
            dt.Columns.Add("Descripcion");
            dt.Columns.Add("Precio");
            dt.Columns.Add("Cantidad");
            dt.Columns.Add("Total");    
            DataRow dr = null;
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkitem = (CheckBox)(row.FindControl("CheckItem"));
                if (chkitem.Checked)
                {
                               dr = dt.NewRow();
                                dr["ID_Producto"] = row.Cells[0].Text.ToString();
                                dr["Descripcion"] = row.Cells[1].Text.ToString();
                                dr["Precio"] = row.Cells[2].Text.ToString();
                                dr["Cantidad"] = row.Cells[3].Text.ToString();
                                dr["Total"] = row.Cells[4].Text.ToString();
                                dt.Rows.Add(dr);
                    Session["tablaitemcredito"] = dt;
                    datos.EditarCreditoXitem(Convert.ToInt32(row.Cells[6].Text));
                    datos.InsertarAbonoCredito2(Convert.ToDecimal(row.Cells[2].Text), 0, Convert.ToInt32(row.Cells[7].Text), Convert.ToInt32(row.Cells[6].Text));
                }
            }
            nit = Label1.Text;
            nombre = Label2.Text;
            
            pendiente = TextBox2.Text;
            Label7.Text = "Items cancelado con exito!";
           SqlDataSource1.SelectParameters["NIT"].DefaultValue = TextBox1.Text;
            SqlDataSource1.DataBind();
            SqlDataSource2.DataBind();
            Button2.Enabled = false;
            Response.Write("<script>window.open('ImpresionCreditoPagos.aspx','Titulo', 'height=300','width=300')</script>");
        }
        public static int Nit;
        public static string pendiente;
        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
              Nit = Convert.ToInt32(TextBox1.Text);
                pendiente = TextBox2.Text;
                Button2.Enabled = false;
                Response.Write("<script>window.open('ImpresionCredito.aspx','Titulo', 'height=300','width=300')</script>");
      
            }
            catch
            {
                Response.Write("<script>alert('Eror, ingrese un dato valido')</script>");
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text != "")
                {
                    DataTable tb = new DataTable();
                    tb = datos.ListaClienteCredito(Convert.ToInt32(TextBox1.Text.Trim()));
                    Label1.Text = tb.Rows[0][0].ToString();
                    Label2.Text = tb.Rows[0][1].ToString();
                    Label4.Text = Convert.ToDecimal(tb.Rows[0][2]).ToString("0.00");
                    SqlDataSource1.SelectParameters["NIT"].DefaultValue =  TextBox1.Text;
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
        decimal total = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
              total += Convert.ToDecimal(e.Row.Cells[4].Text);
            }
            TextBox2.Text = total.ToString();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Credito2.aspx");
        }

    }
}