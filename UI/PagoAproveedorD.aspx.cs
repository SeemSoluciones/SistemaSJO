using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UI
{
    public partial class PagoAproveedorD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Digitador.Mensaje = "Pago a proveedor";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            Label1.Text = row.Cells[6].Text;
            Label2.Text = row.Cells[3].Text;
            Label3.Text = row.Cells[5].Text;
            Label4.Text = row.Cells[4].Text;
            Label6.Text = row.Cells[2].Text;
            SqlDataSource1.SelectParameters["ID_Compra"].DefaultValue = row.Cells[2].Text;
            SqlDataSource1.DataBind();

            SqlDataSource3.SelectParameters["ID_Compra"].DefaultValue = row.Cells[2].Text;
            SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader total;
            total = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (total.Read())
            {
                if (Convert.ToInt16(total["TOTAL"].ToString()) > 0)
                {
                    Label5.Visible = true;
                    Label5.Text = "Favor de revisar si no se tiene productos pendiente de devolucion al proveedor. Verificar producto en Ventana devolucion de productos a proveedores";
                    Button1.Enabled = false;
                    TextBox2.Visible = false;
                    TextBox1.Visible = false;
                    Label9.Visible = false;
                }
                else
                {
                    Label5.Text = "";
                    Label5.Visible = false;
                    Button1.Enabled = true;
                    TextBox2.Visible = true;
                    TextBox1.Visible = true;
                    Label9.Visible = true;

                }

            }
            Button1.Enabled = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.UpdateParameters["ID_Compra"].DefaultValue = Label6.Text;
                SqlDataSource1.UpdateParameters["Cheque"].DefaultValue = TextBox1.Text;
                SqlDataSource1.UpdateParameters["NoRecibo"].DefaultValue = TextBox2.Text;
                SqlDataSource1.Update();
                Response.Redirect("PagoAproveedorD.aspx");
            }
            catch
            {
                Label5.Text = "Error, revise los datos correctamente";
            }

        }
        decimal total, total2, total3;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total = total + Convert.ToDecimal(e.Row.Cells[3].Text);
            }
            Label7.Text = total.ToString();
        }
        decimal totalVarios, totalfac; int contar;

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in GridView2.Rows)
                {
                    CheckBox VerSiCheck = (CheckBox)(row.FindControl("CheckBox1"));
                    if (VerSiCheck.Checked == true)
                    {
                        SqlDataSource1.UpdateParameters["ID_Compra"].DefaultValue = row.Cells[2].Text;
                        SqlDataSource1.UpdateParameters["Cheque"].DefaultValue = TextBox1.Text;
                        SqlDataSource1.UpdateParameters["NoRecibo"].DefaultValue = TextBox2.Text;
                        SqlDataSource1.Update();

                    }
                }
                Response.Redirect("PagoAproveedorD.aspx");
            }
            catch
            {
                Label5.Text = "Error, revise los datos correctamente";
            }
        }

        protected void checkbox1changed(object sender, EventArgs e)
        {

            foreach (GridViewRow row in GridView2.Rows)
            {
                CheckBox VerSiCheck = (CheckBox)(row.FindControl("CheckBox1"));

                if (VerSiCheck.Checked == true)
                {
                    totalVarios = totalVarios + Convert.ToDecimal(row.Cells[4].Text);
                    contar = contar + 1;
                }
                if (contar > 0)
                {
                    Button1.Enabled = false;
                    Button2.Enabled = true;
                }
                else
                {
                    Button1.Enabled = true;
                    Button2.Enabled = false;
                }
                Label10.Text = totalVarios.ToString();
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Visible = true;
            TextBox2.Visible = true;
            Label9.Visible = true;
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total2 = total2 + Convert.ToDecimal(e.Row.Cells[4].Text);
                SqlDataSource3.SelectParameters["ID_Compra"].DefaultValue = e.Row.Cells[2].Text;
                SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader total;
                total = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
                if (total.Read())
                {
                    if (Convert.ToInt16(total["TOTAL"].ToString()) > 0)
                    {
                        e.Row.Cells[7].Text = "No";
                        e.Row.Cells[7].CssClass = "label-danger";
                        e.Row.Cells[0].Enabled = false;
                    }
                    else
                    {
                        e.Row.Cells[7].Text = "Si";
                        e.Row.Cells[7].CssClass = "label-success";
                    }
                }
            }

            Label8.Text = total2.ToString();
        }
    }
}