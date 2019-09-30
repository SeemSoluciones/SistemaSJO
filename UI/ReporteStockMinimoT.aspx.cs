using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace UI
{
    public partial class ReporteStockMinimoT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MostrarReporte();
        }

        private void MostrarReporte()
        {
            ReportViewer1.Reset();

            DataTable dt = GenerarReporte(int.Parse(DropDownList1.SelectedValue));
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);

            ReportViewer1.LocalReport.DataSources.Add(rds);

            ReportViewer1.LocalReport.ReportPath = "ReportStockMinimoT.rdlc";

            ReportParameter[] rptpara = new ReportParameter[]
            {


                new ReportParameter("Tienda",DropDownList1.SelectedValue)

            };
            ReportViewer1.LocalReport.SetParameters(rptpara);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GenerarReporte(int idTienda)
        {
            DataTable dt = new DataTable();
            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["BDautorepuestoConnectionString1"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("StockMinimoTienda", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Tienda", SqlDbType.Int).Value = idTienda;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }
            return dt;
        }
    }
}