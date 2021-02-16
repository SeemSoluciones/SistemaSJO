using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace UI
{
    public partial class EntregaPB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource2.SelectParameters["IDtienda"].DefaultValue = Session["IdTienda"].ToString();
            SqlDataSource2.DataBind();
            SqlDataSource3.SelectParameters["IdTienda"].DefaultValue = Session["IdTienda"].ToString();
            SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader totalP;
            totalP = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if(totalP.Read())
            {
                Label1.Text = totalP["total"].ToString();
            }

            Bodegero.Mensaje = "Entrega de productos";
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
            
        }


        string _estado;

        protected void Unnamed1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(tipoGrid == 1)
            {
                int msj = 0;
            SqlDataSource1.UpdateParameters["ID_Venta"].DefaultValue = DropDownList1.SelectedValue;
           msj = SqlDataSource1.Update();
            if(msj > 0)
            {
               
                Response.Write("<script>alert('Entrega exitosa!')</script>");
                Response.Redirect("EntregaPB.aspx");
             
            }
            else
            {
                Response.Write("<script>alert('Error, no se realizo cambio en la Base de datos!')</script>");
            }
            //   SqlDataSource2.SelectCommand = "SELECT DISTINCT Venta.ID_Venta, 'ID Venta' + ': '+ CAST(Venta.ID_Venta AS nvarchar) +' - '+ Cliente.Nombre + ' ' + Cliente.Apellidos AS Cliente FROM Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta inner join Cliente on Venta.ID_Cliente = Cliente.ID_Cliente WHERE (Estados.ID_Tienda = "+ Session["IdTienda"].ToString()+") AND Estados.EstadoBodega = 1";
          //  SqlDataSource2.DataBind();
            SqlDataSource3.SelectParameters["IdTienda"].DefaultValue = Session["IdTienda"].ToString();
            SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader totalP;
            totalP = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (totalP.Read())
            {
                Label1.Text = totalP["total"].ToString();
            }
            }
            else if(tipoGrid == 2)
            {
                int msj = 0;
                SqlDataSource5.UpdateParameters["ID_Cotizacion"].DefaultValue = DropDownList2.SelectedValue;
                msj = SqlDataSource5.Update();
                if (msj > 0)
                {

                    Response.Write("<script>alert('Entrega exitosa!')</script>");
                    Response.Redirect("EntregaPB.aspx");

                }
                else
                {
                    Response.Write("<script>alert('Error, no se realizo cambio en la Base de datos!')</script>");
                }
              
                SqlDataSource3.SelectParameters["IdTienda"].DefaultValue = Session["IdTienda"].ToString();
                SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader totalP;
                totalP = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
                if (totalP.Read())
                {
                    Label1.Text = totalP["total"].ToString();
                }
            }
           
        }
        public static int tipoGrid = 0;
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            tipoGrid = 1;
            Grid1.Visible = true;
            Grid2.Visible = false;
            Button1.Enabled = true;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            tipoGrid = 2;
            Grid1.Visible = false;
            Grid2.Visible = true;
            Button1.Enabled = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("EntregaPB.aspx");
        }




        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Button1.Enabled = true;
        //    SqlDataSource1.SelectParameters["ID_Venta"].DefaultValue = DropDownList1.SelectedValue;
        //    SqlDataSource1.DataBind();
        //}
    }
}