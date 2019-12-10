using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace UI
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana productos";
        }
        Cproducto DatosP = new Cproducto();
       // string IDFinal = "";

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button6_ModalPopupExtender.Show();
        }


        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {

                byte[] imag = FileUpload1.FileBytes;
                string msj;
                int idTtienda = 0;
                idTtienda = Convert.ToInt32(Session["IDtienda"]);
               // idTienda = Application["IDtienda"].ToString();
                msj = DatosP.InsertarProducto(codigo2.Text,Equival.Text , producto2.Text, descripcion2.Text, imag, Convert.ToInt32(DropDownList6.SelectedValue) , Convert.ToInt32(DropDownList4.SelectedValue), Convert.ToInt32(DropDownList11.SelectedValue));            
                DatosP.InsertarStock(Convert.ToInt32(cantidad.Text), Convert.ToInt32(cantidadMinima.Text), ubicacion.Text, Convert.ToDecimal(precioProd.Text), Convert.ToDecimal(precioVenta.Text), codigo2.Text, Convert.ToInt32(DropDownList9.SelectedValue), idTtienda, Convert.ToInt32(DropDownList12.SelectedValue));
                Response.Redirect("Productos.aspx");   
            }
            catch
            {
                Response.Write("<script>alert('Llene los campos correctamente')</script>");
            }
            
        }
/*
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text);
            codigo.Text = GridView1.SelectedRow.Cells[1].Text;
            producto.Text = GridView1.SelectedRow.Cells[2].Text;
            descripcion.Text = GridView1.SelectedRow.Cells[3].Text;
            precioUnitario.Text = GridView1.SelectedRow.Cells[4].Text;
            precioventa.Text = GridView1.SelectedRow.Cells[5].Text;
            marca.Text = GridView1.SelectedRow.Cells[6].Text;
            //DropDownList1.Text = GridView1.SelectedRow.Cells[7].Text;
            //DropDownList2.DataMember = GridView1.SelectedRow.Cells[9].Text;

        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            GridViewRow tabla = (GridViewRow)(((Button)sender).Parent.Parent);
            string ID = ((Label)tabla.FindControl("lblID")).Text.ToString();
            codigo.Text = ((Label)tabla.FindControl("lblcod")).Text.ToString();
            producto.Text = ((Label)tabla.FindControl("lblprod")).Text.ToString();
            descripcion.Text = ((Label)tabla.FindControl("lblDesc")).Text.ToString();
            precioUnitario.Text = ((Label)tabla.FindControl("lblpU")).Text.ToString();
            precioventa.Text = ((Label)tabla.FindControl("lblpV")).Text.ToString();
            marca.Text = ((Label)tabla.FindControl("lblmarca")).Text.ToString();
            marca.Text = ID;
            Boton10.ServerClick += new EventHandler(Button7_Click);
            
       
        protected void Button7_Click(object sender, EventArgs e)
        {
            codigo.Text = GridView1.SelectedRow.Cells[1].Text;
            producto.Text = GridView1.SelectedRow.Cells[2].Text;
            descripcion.Text = GridView1.SelectedRow.Cells[3].Text;
            precioUnitario.Text = GridView1.SelectedRow.Cells[4].Text;
            precioventa.Text = GridView1.SelectedRow.Cells[5].Text;
            marca.Text = GridView1.SelectedRow.Cells[6].Text;
          

        } }

      

*/
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {

                byte[] imag = FileUpload1.FileBytes;
                string msj;
                 msj = DatosP.EditarProducto(codigo.Text,Equival2.Text , producto.Text, descripcion.Text, imag,  Convert.ToInt32(DropDownList8.SelectedValue), Convert.ToInt32(DropDownList2.SelectedValue), Convert.ToInt32(DropDownList10.SelectedValue));
             //   Response.Write("<script>alert('" + msj + "')</script>");
                Response.Redirect("Productos.aspx");
           }
            catch
            {
                Response.Write("<script>alert('Llene los campos correctamente')</script>");
            }
        }
   
      

        protected void Button1_Click(object sender, EventArgs e)
        {
           SqlDataSource1.SelectCommand = "SELECT Producto.Codigo, Producto.Codigo2, MarcaProd.MarcaP,Producto.Producto, Producto.Descripcion, Proveedor.Proveedor, Rubro.ID_Rubro, Rubro.Rubro, Modelo.Modelo, Marca.Marca FROM Marca INNER JOIN Modelo ON Marca.ID_Marca = Modelo.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN Producto INNER JOIN Proveedor ON Producto.ID_Proveedor = Proveedor.ID_Proveedor ON Rubro.ID_Rubro = Producto.ID_Rubro INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd WHERE (Producto.Estado = 1 AND Producto.Producto like '%" + TextBox11.Text + "%') OR (Producto.Estado = 1 AND Producto.Codigo like '%" + TextBox11.Text+"%') OR (Producto.Estado = 1 AND Producto.Codigo2 like '%" + TextBox11.Text+"%')";
            SqlDataSource1.DataBind();
        }
/*
     

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label label = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            Application["IDglobal"] = label.Text;
            Application["IDglobal"] = TextBox11.Text;
            Button6_ModalPopupExtender.Show();
        }
        */

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        
        }

        
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string IdRubro,ValorRubro, valorMarca, valorModelo = "";
            GridViewRow tabla = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            codigo.Text = ((Label)tabla.FindControl("Label1")).Text.ToString();
            Equival2.Text = ((Label)tabla.FindControl("Label2")).Text.ToString();
            producto.Text = ((Label)tabla.FindControl("Label3")).Text.ToString();
            descripcion.Text = ((Label)tabla.FindControl("Label4")).Text.ToString();
            IdRubro = ((Label)tabla.FindControl("Label6")).Text.ToString();     
            valorMarca = ((Label)tabla.FindControl("Label8")).Text.ToString();
            valorModelo = ((Label)tabla.FindControl("Label9")).Text.ToString();
            ValorRubro = ((Label)tabla.FindControl("Label10")).Text.ToString();
            SqlDataSource8.SelectCommand = "Select Modelo.ID_Modelo, Modelo.Modelo From Modelo inner join Marca on Modelo.ID_Marca = Marca.ID_Marca Where Marca.Marca = '"+ valorMarca+"'";
            SqlDataSource8.DataBind();

            DropDownList7.SelectedIndex = DropDownList7.Items.IndexOf(DropDownList7.Items.FindByText(valorModelo));
            DropDownList1.SelectedIndex = DropDownList1.Items.IndexOf(DropDownList1.Items.FindByText(valorMarca));

            //  DropDownList8.SelectedIndex = DropDownList8.Items.IndexOf(DropDownList8.Items.FindByText(ValorRubro));
            SqlDataSource9.SelectCommand = "SELECT ID_Rubro, Rubro FROM Rubro WHERE ID_Rubro = " + Convert.ToInt32(IdRubro);
            SqlDataSource9.DataBind();

            Button4_ModalPopupExtender.Show();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button6_ModalPopupExtender.Show();
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button6_ModalPopupExtender.Show();
        }
        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
             Button4_ModalPopupExtender.Show();
        }

        protected void DropDownList7_SelectedIndexChanged1(object sender, EventArgs e)
        {
             Button4_ModalPopupExtender.Show();
        }

    }


}