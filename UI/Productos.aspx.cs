﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace UI
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Home.Mensaje = "Ventana productos";
            tbOEM.Columns.Add("ID_OEM");
            tbOEM.Columns.Add("OEM");
            tbOEM.Columns.Add("ID_Marca");
            tbOEM.Columns.Add("Marca");
        }
        Cproducto DatosP = new Cproducto();
        // string IDFinal = "";

       public List<ListaS> dtOEM = new List<ListaS>();

        protected void Button2_Click(object sender, EventArgs e)
        {
           //limpirar();
            Button6_ModalPopupExtender.Show();
        }

        void limpirar()
        {
            codigo2.Text = "";
          
            Equival.Text = "";
          
            TextBox3.Text = "";
            producto2.Text = "";
            TextBox4.Text = "";
            descripcion2.Text = "";
            dt.Clear();
            dt.Reset();
            ViewState["Detalles2"] = null;
            ViewState["Detalles3"] = null;
            ViewState["Detalles"] = null;
            dt2.Clear();
            dt3.Clear();
            dtOEM.Clear();
            
            GridView2.DataSource = null;
            GridView2.DataBind();
            GridView3.DataSource = null;
            GridView3.DataBind();
            GridView4.DataSource = null;
            GridView4.DataBind();
    


        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {

              string msj;
                int idTtienda = 0;

                idTtienda = Convert.ToInt32(Session["IDtienda"]);
                Stream imgStream = FileUpload2 .PostedFile.InputStream;
                int imgLen = FileUpload2.PostedFile.ContentLength;
                byte[] imgBinaryData = new byte[imgLen];
                int n = imgStream.Read(imgBinaryData, 0, imgLen);

          
                     msj = DatosP.InsertarProducto(producto2.Text, descripcion2.Text, imgBinaryData, Convert.ToInt32(DropDownList14.SelectedValue));  
           
           
            foreach(GridViewRow row in GridView3.Rows)
            {
             DatosP.insertarOEM(row.Cells[1].Text, Convert.ToInt32(msj), Convert.ToInt32(row.Cells[3].Text));
            }

            foreach (GridViewRow row in GridView2.Rows)
            {
                DatosP.insertarCodigoMarcaPrd(row.Cells[1].Text, Convert.ToInt32(msj), Convert.ToInt32(row.Cells[3].Text));
            }

            foreach (GridViewRow row in GridView4.Rows)
            {
                DatosP.insertarAnioProducto(Convert.ToInt32(msj),Convert.ToInt32(row.Cells[3].Text), row.Cells[5].Text, row.Cells[6].Text);
            }
                Response.Write("<script>alert('Datos guardado correctamente!')</script>");
                limpirar();
        }
            catch
            {
                Response.Write("<script>alert('Llene los campos correctamente')</script>");
                Button6_ModalPopupExtender.Show();
            }


}

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {

                byte[] imag = FileUpload2.FileBytes;
                //string msj;

                DatosP.EditarProducto(Convert.ToInt32(Label8.Text), TextBox3.Text, TextBox4.Text, imag, Convert.ToInt32(DropDownList18.SelectedValue));

                foreach (GridViewRow row in GridView8.Rows)
                {
                    DatosP.insertarOEM(row.Cells[2].Text, Convert.ToInt32(Label8.Text), Convert.ToInt32(row.Cells[3].Text));
                }

                foreach (GridViewRow row in GridView9.Rows)
                {
                    DatosP.insertarCodigoMarcaPrd(row.Cells[2].Text, Convert.ToInt32(Label8.Text), Convert.ToInt32(row.Cells[3].Text));
                }

                foreach (GridViewRow row in GridView10.Rows)
                {
                    DatosP.insertarAnioProducto(Convert.ToInt32(Label8.Text), Convert.ToInt32(row.Cells[4].Text), row.Cells[5].Text, row.Cells[6].Text);
                }

              
                
                Response.Write("<script>alert('Datos actualizados con exitos, actualiza la pagina!')</script>");
                limpirar();
            }
            catch
            {
                Response.Write("<script>alert('Llene los campos correctamente')</script>");
                Button4_ModalPopupExtender.Show();


            }
        }
   
      

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT DISTINCT Producto.ID_Producto, Producto.Producto, Producto.Descripcion, stuff((Select ', ' + OEM.OEM + ' ~ ' + Marca.Marca From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM, stuff((Select ', ' + CodigoProducto.Codigo + ' ~ ' + MarcaProd.MarcaP From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP, stuff((Select '| ' + AnioInicio + '-' + AnioFinal + ' ~ ' + Rubro + ', ' + Modelo + ', ' + Marca From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP, SubCategoria.SubCategoria + ',' + Categoria.Categoria AS Categoria FROM Producto INNER JOIN SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria INNER JOIN Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria left join OEM on Producto.ID_Producto = OEM.ID_Producto left join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto WHERE (Producto.Estado = 1) AND (Producto.Producto like '%" + TextBox11.Text+ "%' OR OEM.OEM like '%"+TextBox11.Text+ "%' OR CodigoProducto.Codigo like '%"+TextBox11.Text+"%')";
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
         DataTable dt = new DataTable();

        protected void Btn_AgergarOEM(object sender, EventArgs e)
        {

          

            if (codigo2.Text != "")
            {

             SqlDataSource23.SelectParameters["Codigo"].DefaultValue = codigo2.Text;
            SqlDataSource23.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader total;
            total = (SqlDataReader)SqlDataSource23.Select(DataSourceSelectArguments.Empty);
            if (total.Read())
            {
                if (Convert.ToInt32(total["Total"]) == 0)
                {

                dt.Columns.Add("Codigo");
                dt.Columns.Add("Marca");
                dt.Columns.Add("ID_Marca");

                DataRow dr = null;
                if (ViewState["Detalles2"] != null)
                {


                    for (int i = 0; i < 1; i++)
                    {
                        dt = (DataTable)ViewState["Detalles2"];
                        if (dt.Rows.Count > 0)
                        {
                            dr = dt.NewRow();
                            //  dr["ID"] = Label1.Text;
                            dr["Codigo"] = codigo2.Text;
                            dr["Marca"] = DropDownList11.SelectedItem.ToString();
                            dr["ID_Marca"] = DropDownList11.SelectedValue.ToString();
                            dt.Rows.Add(dr);
                            GridView3.DataSource = dt;
                            GridView3.DataBind();

                        }
                    }

                }
                else
                {
                    dr = dt.NewRow();
                    // dr["ID"] = Label1.Text;
                    dr["Codigo"] = codigo2.Text;
                    dr["Marca"] = DropDownList11.SelectedItem.ToString();
                    dr["ID_Marca"] = DropDownList11.SelectedValue.ToString();
                    dt.Rows.Add(dr);
                    GridView3.DataSource = dt;
                    GridView3.DataBind();
                }
                ViewState["Detalles2"] = dt;


                codigo2.Text = "";

                }
                else
                {
                        Response.Write("<script>alert('El codigo aparece en la base de datos, revise si ya esta registrado!')</script>");
                  }
            }



                ////////////////////
            }
            else
            {
                Response.Write("<script>alert('Ingrese un codigo')</script>");
            }
            Button6_ModalPopupExtender.Show();
        }
        DataTable dt2 = new DataTable();
        protected void Btn_AgergarCodigo(object sender, EventArgs e)
        {

            

            if (Equival.Text != "")
            {


             SqlDataSource23.SelectParameters["Codigo"].DefaultValue = Equival.Text;
            SqlDataSource23.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader total;
            total = (SqlDataReader)SqlDataSource23.Select(DataSourceSelectArguments.Empty);
            if (total.Read())
            {
                if (Convert.ToInt32(total["Total"]) == 0)
                {


                dt2.Columns.Add("Codigo");
                dt2.Columns.Add("Marca_Prod");
                dt2.Columns.Add("ID_Marca_P");

                DataRow dr = null;
                if (ViewState["Detalles"] != null)
                {


                    for (int i = 0; i < 1; i++)
                    {
                        dt2 = (DataTable)ViewState["Detalles"];
                        if (dt2.Rows.Count > 0)
                        {
                            dr = dt2.NewRow();
                            //  dr["ID"] = Label1.Text;
                            dr["Codigo"] = Equival.Text;
                            dr["Marca_Prod"] = DropDownList12.SelectedItem.ToString();
                            dr["ID_Marca_P"] = DropDownList12.SelectedValue.ToString();
                            dt2.Rows.Add(dr);
                            GridView2.DataSource = dt2;
                            GridView2.DataBind();

                        }
                    }

                }
                else
                {
                    dr = dt2.NewRow();
                    // dr["ID"] = Label1.Text;
                    dr["Codigo"] = Equival.Text;
                    dr["Marca_Prod"] = DropDownList12.SelectedItem.ToString();
                    dr["ID_Marca_P"] = DropDownList12.SelectedValue.ToString();
                    dt2.Rows.Add(dr);
                    GridView2.DataSource = dt2;
                    GridView2.DataBind();
                }
                ViewState["Detalles"] = dt2;
                Equival.Text = "";
                }
                else
                {
                        Response.Write("<script>alert('El codigo aparece en la base de datos, revise si ya esta registrado!')</script>");
                    }
            }
                //////////////////
            }
            else
            {
                Response.Write("<script>alert('Ingrese un codigo')</script>");
            }
            Button6_ModalPopupExtender.Show();
        }
        DataTable dt3 = new DataTable();
        protected void Btn_RubroAnios(object sender, EventArgs e)
        {
            

            if (DropDownList6.SelectedItem.ToString() != "")
            {
                dt3.Columns.Add("Marca");
                dt3.Columns.Add("Linea");
                dt3.Columns.Add("ID_Rubro");
                dt3.Columns.Add("Rubro");
                dt3.Columns.Add("Anio_Inicial");
                dt3.Columns.Add("Anio_Final");

                DataRow dr = null;
                if (ViewState["Detalles3"] != null)
                {


                    for (int i = 0; i < 1; i++)
                    {
                        dt3 = (DataTable)ViewState["Detalles3"];
                        if (dt3.Rows.Count > 0)
                        {
                            dr = dt3.NewRow();
                            //  dr["ID"] = Label1.Text;
                            dr["Marca"] = DropDownList3.SelectedItem.ToString();
                            dr["Linea"] = DropDownList5.SelectedItem.ToString();
                            dr["ID_Rubro"] = DropDownList6.SelectedValue.ToString();
                            dr["Rubro"] = DropDownList6.SelectedItem.ToString();
                            dr["Anio_Inicial"] = DropDownList4.SelectedItem.ToString();
                            dr["Anio_Final"] = DropDownList9.SelectedItem.ToString();
                            dt3.Rows.Add(dr);
                            GridView4.DataSource = dt3;
                            GridView4.DataBind();

                        }
                    }

                }
                else
                {
                    dr = dt3.NewRow();
                    // dr["ID"] = Label1.Text;
                    dr["Marca"] = DropDownList3.SelectedItem.ToString();
                    dr["Linea"] = DropDownList5.SelectedItem.ToString();
                    dr["ID_Rubro"] = DropDownList6.SelectedValue.ToString();
                    dr["Rubro"] = DropDownList6.SelectedItem.ToString();
                    dr["Anio_Inicial"] = DropDownList4.SelectedItem.ToString();
                    dr["Anio_Final"] = DropDownList9.SelectedItem.ToString();
                    dt3.Rows.Add(dr);
                    GridView4.DataSource = dt3;
                    GridView4.DataBind();
                }
                ViewState["Detalles3"] = dt3;

            }
            else
            {
                Response.Write("<script>alert('Ingrese un codigo')</script>");
            }
            Button6_ModalPopupExtender.Show();
        }


        DataTable tbOEM = new DataTable();

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           // ViewState["Detalles5"] = GridView5;
            string Subcat, Subcat2, IdProducto = "";
            GridViewRow tabla = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            IdProducto = ((Label)tabla.FindControl("Label1")).Text.ToString();
            Label8.Text = IdProducto;
            SqlDataSource20.SelectCommand = "SELECT OEM.ID_OEM, OEM.OEM, Marca.ID_Marca, Marca.Marca FROM OEM INNER JOIN Producto ON OEM.ID_Producto = Producto.ID_Producto INNER JOIN Marca ON OEM.ID_Marca = Marca.ID_Marca WHERE Producto.ID_Producto = "+ IdProducto ;
            SqlDataSource20.DataBind();
            SqlDataSource21.SelectCommand = "SELECT CodigoProducto.ID_CodigoProducto, CodigoProducto.Codigo, MarcaProd.ID_MaraProd, MarcaProd.MarcaP FROM CodigoProducto INNER JOIN  Producto ON CodigoProducto.ID_Producto = Producto.ID_Producto INNER JOIN MarcaProd ON CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd WHERE Producto.ID_Producto = " + IdProducto;
            SqlDataSource21.DataBind();
            SqlDataSource22.SelectCommand = "SELECT AnioProducto.AnioInicio, AnioProducto.AnioFinal, Rubro.ID_Rubro, Rubro.Rubro, Modelo.Modelo, Marca.Marca FROM Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Rubro ON Modelo.ID_Modelo = Rubro.ID_Modelo INNER JOIN AnioProducto ON Rubro.ID_Rubro = AnioProducto.ID_Rubro  WHERE AnioProducto.ID_Producto = " + IdProducto;
            SqlDataSource22.DataBind();
            TextBox3.Text = ((Label)tabla.FindControl("Label2")).Text.ToString();
            TextBox4.Text = ((Label)tabla.FindControl("Label3")).Text.ToString();
            Subcat = ((Label)tabla.FindControl("Label7")).Text.ToString();
            string[] separar;
            separar = Subcat.Split(',');
            //for(int i = 0; i < separar.Length; i++)
            //{
            //   
            //}

            // separar = Subcat2.Split(',');
            string categoria = separar[1];
            //   Response.Write("<script>alert('"+ categoria +"')</script>");
            DropDownList17.SelectedIndex = DropDownList17.Items.IndexOf(DropDownList17.Items.FindByText(categoria));
            // ddlsample.SelectedIndex =      ddlsample.Items.IndexOf(     ddlsample.Items.FindByText("x"));
            SqlDataSource19.SelectCommand = "SELECT ID_SubCategoria, SubCategoria FROM SubCategoria WHERE SubCategoria like '%"+separar[0]+"%'";
            SqlDataSource19.DataBind();

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
        protected void Btn_AgergarOEM2(object sender, EventArgs e)
        {



            foreach (GridViewRow drow in GridView5.Rows)
            {
                DataRow dr = tbOEM.NewRow();
                dr["ID_OEM"] = drow.Cells[0].Text.ToString();
                dr["OEM"] = drow.Cells[1].Text.ToString();
                dr["ID_Marca"] = drow.Cells[2].Text.ToString();
                dr["Marca"] = drow.Cells[3].Text.ToString();
                tbOEM.Rows.Add(dr);
         
            }

            if (TextBox1.Text != "")
            {

                DataRow dr = null;
                if (ViewState["Detalles5"] != null)
                {


                    for (int i = 0; i < 1; i++)
                    {
                        tbOEM = (DataTable)ViewState["Detalles5"];
                        if (tbOEM.Rows.Count > 0)
                        {
                            dr = tbOEM.NewRow();
                            //  dr["ID"] = Label1.Text;
                            dr["ID_OEM"] = "-";
                            dr["OEM"] = TextBox1.Text;
                            dr["ID_Marca"] = DropDownList1.SelectedValue.ToString();
                            dr["Marca"] = DropDownList1.SelectedItem.ToString();

                            tbOEM.Rows.Add(dr);
                            GridView8.DataSource = tbOEM;
                            GridView8.DataBind();
                        }
                    }

                }
                else
                {
                    dr = tbOEM.NewRow();
                    // dr["ID"] = Label1.Text;
                    dr["ID_OEM"] = "-";
                    dr["OEM"] = TextBox1.Text;
                    dr["ID_Marca"] = DropDownList1.SelectedValue.ToString();
                    dr["Marca"] = DropDownList1.SelectedItem.ToString();

                    tbOEM.Rows.Add(dr);
                    GridView8.DataSource = tbOEM;
                    GridView8.DataBind();
                }
                ViewState["Detalles5"] = tbOEM;


                TextBox1.Text = "";
                GridView8.Visible = true;
                GridView5.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('Ingrese un codigo')</script>");
            }
            DatosP.DeleteOEM(Convert.ToInt32(Label8.Text));
            Button4_ModalPopupExtender.Show();
        }

        DataTable tb = new DataTable();
        protected void Btn_AgergarCodigosP(object sender, EventArgs e)
        {
           
                tb.Columns.Add("ID");
                tb.Columns.Add("Codigo");
                tb.Columns.Add("ID_Marca");
                tb.Columns.Add("Marca_P");
            foreach (GridViewRow drow in GridView6.Rows)
            {
                DataRow dr = tb.NewRow();
                dr["ID"] = drow.Cells[0].Text.ToString();
                dr["Codigo"] = drow.Cells[1].Text.ToString();
                dr["ID_Marca"] = drow.Cells[2].Text.ToString();
                dr["Marca_P"] = drow.Cells[3].Text.ToString();
                tb.Rows.Add(dr);

            }

            if (TextBox2.Text != "")
            {
                

                DataRow dr = null;
                if (ViewState["Detalles9"] != null)
                {

                    for (int i = 0; i < 1; i++)
                    {
                        tb = (DataTable)ViewState["Detalles9"];
                        if (tb.Rows.Count > 0)
                        {
                            dr = tb.NewRow();
                            //  dr["ID"] = Label1.Text;
                            dr["ID"] = "-";
                            dr["Codigo"] = TextBox2.Text;
                            dr["ID_Marca"] = DropDownList2.SelectedValue.ToString();
                            dr["Marca_P"] = DropDownList2.SelectedItem.ToString();

                            tb.Rows.Add(dr);
                            GridView9.DataSource = tb;
                            GridView9.DataBind();
                        }
                    }

                }
                else
                {
                    dr = tb.NewRow();
                    // dr["ID"] = Label1.Text;
                    dr["ID"] = "-";
                    dr["Codigo"] = TextBox2.Text;
                    dr["ID_Marca"] = DropDownList2.SelectedValue.ToString();
                    dr["Marca_P"] = DropDownList2.SelectedItem.ToString();

                    tb.Rows.Add(dr);
                    GridView9.DataSource = tb;
                    GridView9.DataBind();
                }
                ViewState["Detalles9"] = tb;


               TextBox2.Text = "";
                GridView9.Visible = true;
                GridView6.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('Ingrese un codigo')</script>");
            }
            DatosP.DeleteCodigoProd(Convert.ToInt32(Label8.Text));
            Button4_ModalPopupExtender.Show();
        }


     DataTable tba = new DataTable();
        protected void Btn_AgergarAnioRP(object sender, EventArgs e)
        {
           
            tba.Columns.Add("Marca");
            tba.Columns.Add("Modelo");
            tba.Columns.Add("Rubro");
            tba.Columns.Add("ID_Rubro");
            tba.Columns.Add("AnioInicio");
            tba.Columns.Add("AnioFinal");
            foreach (GridViewRow drow in GridView7.Rows)
            {
                DataRow dr = tba.NewRow();
                dr["Marca"] = drow.Cells[0].Text.ToString();
                dr["Modelo"] = drow.Cells[1].Text.ToString();
                dr["Rubro"] = drow.Cells[2].Text.ToString();
                dr["ID_Rubro"] = drow.Cells[3].Text.ToString();
                dr["AnioInicio"] = drow.Cells[4].Text.ToString();
                dr["AnioFinal"] = drow.Cells[5].Text.ToString();
                tba.Rows.Add(dr);

            }

            if (DropDownList16.SelectedItem.ToString() != "")
            {


                DataRow dr = null;
                if (ViewState["Detalles11"] != null)
                {

                    for (int i = 0; i < 1; i++)
                    {
                        tba = (DataTable)ViewState["Detalles11"];
                        if (tba.Rows.Count > 0)
                        {
                            dr = tba.NewRow();
                            //  dr["ID"] = Label1.Text;
                            dr["Marca"] = DropDownList7.SelectedItem.ToString();
                            dr["Modelo"] = DropDownList8.SelectedItem.ToString();
                            dr["Rubro"] = DropDownList10.SelectedItem.ToString();
                            dr["ID_Rubro"] = DropDownList10.SelectedValue.ToString();
                            dr["AnioInicio"] = DropDownList15.SelectedItem.ToString();
                            dr["AnioFinal"] = DropDownList16.SelectedItem.ToString();

                            tba.Rows.Add(dr);
                            GridView10.DataSource = tba;
                            GridView10.DataBind();
                        }
                    }

                }
                else
                {
                    dr = tba.NewRow();
                    // dr["ID"] = Label1.Text;
                    dr["Marca"] = DropDownList7.SelectedItem.ToString();
                    dr["Modelo"] = DropDownList8.SelectedItem.ToString();
                    dr["Rubro"] = DropDownList10.SelectedItem.ToString();
                    dr["ID_Rubro"] = DropDownList10.SelectedValue.ToString();
                    dr["AnioInicio"] = DropDownList15.SelectedItem.ToString();
                    dr["AnioFinal"] = DropDownList16.SelectedItem.ToString();

                    tba.Rows.Add(dr);
                    GridView10.DataSource = tba;
                    GridView10.DataBind();
                }
                ViewState["Detalles11"] = tba;


               
                GridView10.Visible = true;
                GridView7.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('Ingrese un codigo')</script>");
            }
            DatosP.DeleteAnioProd(Convert.ToInt32(Label8.Text));
            Button4_ModalPopupExtender.Show();
        }
       
        protected void GridView8_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            tbOEM = (DataTable)ViewState["Detalles5"];
            tbOEM.Rows[index].Delete();
            GridView8.DataSource = tbOEM;
            GridView8.DataBind();
            Button4_ModalPopupExtender.Show();
        }

        protected void DropDownList13_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button6_ModalPopupExtender.Show();
        }

        protected void DropDownList17_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button4_ModalPopupExtender.Show();
        }

        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button4_ModalPopupExtender.Show();
        }

        protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button4_ModalPopupExtender.Show();
        }

        protected void GridView9_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            tb = (DataTable)ViewState["Detalles9"];
            tb.Rows[index].Delete();
            GridView9.DataSource = tb;
            GridView9.DataBind();
            Button4_ModalPopupExtender.Show();
        }

       
        protected void GridView10_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        { int index = Convert.ToInt32(e.RowIndex);
            tba = (DataTable)ViewState["Detalles11"];
            tba.Rows[index].Delete();
            GridView10.DataSource = tba;
            GridView10.DataBind();
            Button4_ModalPopupExtender.Show();

        }

        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            dt = (DataTable)ViewState["Detalles2"];
            dt.Rows[index].Delete();
            GridView3.DataSource = dt;
            GridView3.DataBind();
            Button6_ModalPopupExtender.Show();
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            dt2 = (DataTable)ViewState["Detalles"];
            dt2.Rows[index].Delete();
            GridView2.DataSource = dt2;
            GridView2.DataBind();
            Button6_ModalPopupExtender.Show();
        }

        protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            dt3 = (DataTable)ViewState["Detalles3"];
            dt3.Rows[index].Delete();
            GridView4.DataSource = dt3;
            GridView4.DataBind();
            Button6_ModalPopupExtender.Show();
        }
    }


}