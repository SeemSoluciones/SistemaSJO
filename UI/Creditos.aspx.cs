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
    public partial class Creditos : System.Web.UI.Page
    {
        cClientes datos = new cClientes();
        decimal Pendiente = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label6.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT Cliente.NIT, Cliente.Nombre, Cliente.Apellidos, Credito.Monto, Credito.SaldoPendiente, Credito.FechaCredito, Credito.FechaCredito + InfoCreditos.DiasMax AS FechaPago, Venta.Total AS TotalCompra, Credito.ID_Credito FROM Cliente INNER JOIN Credito ON Cliente.ID_Cliente = Credito.ID_Cliente INNER JOIN Venta ON Credito.ID_Venta = Venta.ID_Venta INNER JOIN InfoCreditos ON Cliente.ID_Cliente = InfoCreditos.ID_Cliente WHERE (Credito.Estado = 1 AND Cliente.NIT like '%" + TextBox1.Text+ "%') OR (Credito.Estado = 1 AND Cliente.Nombre like '%" + TextBox1.Text+"%')";
            SqlDataSource1.DataBind();
       
         }
        protected void btnBuscar(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            Label2.Text = GridView1.SelectedRow.Cells[0].Text;
            Label3.Text = GridView1.SelectedRow.Cells[1].Text + " " + GridView1.SelectedRow.Cells[2].Text;
            Label4.Text = GridView1.SelectedRow.Cells[4].Text;
            Label5.Text = GridView1.SelectedRow.Cells[5].Text;
            Label1.Text = GridView1.SelectedRow.Cells[8].Text;
           

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           try
            {
               
            Pendiente = Convert.ToDecimal(Label4.Text) - Convert.ToDecimal(TextBox2.Text);

                if(Pendiente == 0)
                {
                    datos.CreditoPagado(false, Convert.ToInt32(Label1.Text));
                    datos.InsertarAbonoCredito(Convert.ToDecimal(TextBox2.Text), Pendiente, Convert.ToInt32(Label1.Text));
                     Response.Redirect("Creditos.aspx");
                }               
                else if (Pendiente < 0)
                {
                    Response.Write("<script>alert('EL monto ingresado supera al credito')</script>");
                }
                else
                {
                    datos.InsertarAbonoCredito(Convert.ToDecimal(TextBox2.Text), Pendiente, Convert.ToInt32(Label1.Text));
                    Response.Redirect("Creditos.aspx");
                }
            }
            catch
            {
                Response.Write("<script>alert('Error, revise los campos')</script>");
            }
        }
    }
}