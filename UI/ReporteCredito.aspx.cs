using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;
using System.Data.SqlClient;
namespace UI
{
    public partial class ReporteCredito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MostrarReporte();
        }


        private void MostrarReporte()
        {
            ReportViewer1.Reset();
           

            DataTable dt = GenerarReporte(int.Parse(TextBox1.Text));
            DataTable dt2 = GenerarReporte2(int.Parse(TextBox1.Text));
           // DataTable dt3 = GenerarReporte3(int.Parse(TextBox1.Text));*/
            ReportDataSource rds = new ReportDataSource("DataSet1",dt);
            ReportDataSource rds2 = new ReportDataSource("DataSet2",dt2);
            //ReportDataSource rds3 = new ReportDataSource("DataSet3",dt3);
            //ReportViewer1.LocalReport.DataSources.Add(rds3);
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.DataSources.Add(rds2);
            

            ReportViewer1.LocalReport.ReportPath = "Report1Abonos.rdlc";

            ReportParameter[] rptpara = new ReportParameter[]
            {
                new ReportParameter("Nit", TextBox1.Text)
            };
            ReportViewer1.LocalReport.SetParameters(rptpara);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GenerarReporte(int nit)
        {
            DataTable dt = new DataTable();
      
            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["BDautorepuestoConnectionString1"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ListaAbonosXclientes", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Nit", SqlDbType.Int).Value = nit;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
            }
            return dt;
            
        }
        
        private DataTable GenerarReporte2(int nit)
        {
            DataTable dt = new DataTable();

            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["BDautorepuestoConnectionString1"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                
                SqlCommand cmd2 = new SqlCommand("DatosClienteDelCredito", cn);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.Add("@Nit", SqlDbType.Int).Value = nit;

                SqlDataAdapter adp2 = new SqlDataAdapter(cmd2);
                adp2.Fill(dt);

            }
            return dt;

        }
        /*
        private DataTable GenerarReporte3(int nit)
        {
            DataTable dt = new DataTable();

            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["BDautorepuestoConnectionString1"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
               

                SqlCommand cmd3 = new SqlCommand("ListaTotalesYpendienteCreditos", cn);
                cmd3.CommandType = CommandType.StoredProcedure;
                cmd3.Parameters.Add("@Nit", SqlDbType.Int).Value = nit;

                SqlDataAdapter adp3 = new SqlDataAdapter(cmd3);
                adp3.Fill(dt);

            }
            return dt;

        }*/
    }
}