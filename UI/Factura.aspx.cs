using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using System.Drawing.Imaging;
using System.Drawing.Printing;

namespace UI
{
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            //    Button1_Click(sender, e);
                 MostrarReporte();
                // Button1.Click += new EventHandler(Button1_Click)
            }
        }
        private void MostrarReporte()
        {
            ReportViewer1.Reset();

            DataTable dt = GenerarReporte(Convert.ToInt32(Caja.msj));
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);

            ReportViewer1.LocalReport.DataSources.Add(rds);

            ReportViewer1.LocalReport.ReportPath = "Factura.rdlc";

            ReportParameter[] rptpara = new ReportParameter[]
            {
                new ReportParameter("IdVenta", Caja.msj),
                new ReportParameter("Nombre", Caja.nombre),
                new ReportParameter("Nit", Caja.nit),
                new ReportParameter("Ciudad", Caja.ciudad)
            };

            ReportViewer1.LocalReport.SetParameters(rptpara);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GenerarReporte(int idVenta)
        {
            DataTable dt = new DataTable();
            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["BDautorepuestoConnectionString1"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ImprimirFactura", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IdVenta", SqlDbType.Int).Value = idVenta;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }
            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MostrarReporte();
        }
    }
}