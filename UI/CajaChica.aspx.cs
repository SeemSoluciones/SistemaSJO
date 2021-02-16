using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UI
{
    public partial class CajaChica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Caja chica";
        }

       
        protected void Button1_Click(object sender, EventArgs e)
        {
           

                try
                {
                    SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader listado;
                    listado = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    if (listado.Read())
                    {
                        lblTotalI.Text = Convert.ToDecimal(listado["TotalEntrada"]).ToString("0.00");
                    }
                    else
                    {
                        lblTotalI.Text = "0";
                    }
                    SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader listadoSalida;
                    listadoSalida = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                    if (listadoSalida.Read())
                    {
                        lblTotalR.Text = Convert.ToDecimal(listadoSalida["TotalSalida"]).ToString("0.00");
                    }
                    else
                    {
                        lblTotalR.Text = "0";
                    }

                    Label1.Text = (Convert.ToDecimal(lblTotalI.Text) + Convert.ToDecimal(Label3.Text)).ToString();
                    Label2.Text = (Convert.ToDecimal(lblTotalR.Text) + Convert.ToDecimal(Label4.Text)).ToString();
                }
                catch(Exception er)
                {
                    Response.Write("<script>alert('Error! Rango de fecha incorrecta o No existe un registro con la fecha ingresada."+er+"')</script>");
                }
          
        }
        decimal totalCompra=0, TotalVenta=0;

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                totalCompra = totalCompra + Convert.ToDecimal(e.Row.Cells[0].Text);
            }
            Label4.Text = totalCompra.ToString();

        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                TotalVenta = TotalVenta + Convert.ToDecimal(e.Row.Cells[0].Text);
            }
            Label3.Text = TotalVenta.ToString();
        }
    }
}