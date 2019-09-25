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
    public partial class ReporteVentaRubro : System.Web.UI.Page
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

            DataTable dt = GenerarReporte(DateTime.Parse(FechaInicio.Text), DateTime.Parse(FechaFinal.Text), int.Parse(DropDownList1.SelectedValue));
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);

            ReportViewer1.LocalReport.DataSources.Add(rds);

            ReportViewer1.LocalReport.ReportPath = "ReportVentaRubro.rdlc";

            ReportParameter[] rptpara = new ReportParameter[]
            {
                new ReportParameter("FeInicio",FechaInicio.Text),
                new ReportParameter("FeFinal",FechaFinal.Text),
                new ReportParameter("Rubro",DropDownList1.SelectedValue)

            };
            ReportViewer1.LocalReport.SetParameters(rptpara);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GenerarReporte(DateTime inicio, DateTime final, int rubro)
        {
            DataTable dt = new DataTable();
            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["BDautorepuestoConnectionString1"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("VentarRubro", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@FechaInicio", SqlDbType.DateTime).Value = inicio;
                cmd.Parameters.Add("@FechaFinal", SqlDbType.DateTime).Value = final;
                cmd.Parameters.Add("@Rubro", SqlDbType.Int).Value = rubro;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }
            return dt;
        }



    }
}