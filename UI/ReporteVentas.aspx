<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ReporteVentas.aspx.cs" Inherits="UI.ReporteVentas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-md-6">
    <div class="form-group">
    <label>Fecha Inicial</label>
    <asp:TextBox ID="FechaInicio" runat="server" Cssclass="form-control" TextMode="Date"></asp:TextBox>
    </div>
        </div>
        <div class="col-md-6">
    <div class="form-group">
    <label>Fecha Final</label>
    <asp:TextBox ID="FechaFinal" runat="server" Cssclass="form-control" TextMode="Date"></asp:TextBox>
    </div>
        </div>
    </div>
     
     <asp:Button ID="Button4" runat="server" Text="Generar Reporte" CssClass="btn btn-success pull-right" Width="200"  OnClick="Button4_Click"> </asp:Button>
               <br />                        
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" SizeToReportContent="True" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="ReportVentas.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
      

    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="UI.BDautorepuestoDataSetTableAdapters.ReportesVentasTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="UI.BDautorepuestoDataSetTableAdapters.inventarioStockTableAdapter"></asp:ObjectDataSource>
      

</asp:Content>
