<%@ Page Title="" Language="C#" MasterPageFile="~/Bodegero.Master" AutoEventWireup="true" CodeBehind="ReporteStockMinimoT.aspx.cs" Inherits="UI.ReporteStockMinimoT" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <div class="col-md-4">
    <div class="form-group">
    <label>Tienda</label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Tienda" DataValueField="ID_Tienda"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT * FROM [Tienda]"></asp:SqlDataSource>
    </div>

        </div>
     
     <asp:Button ID="Button4" runat="server" Text="Generar Reporte" CssClass="btn btn-success pull-right" Width="200"  OnClick="Button4_Click"> </asp:Button>
               <br />                        
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" SizeToReportContent="true" CssClass="table table-responsive"></rsweb:ReportViewer>
      

    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="UI.BDautorepuestoDataSetTableAdapters.ReportesVentasTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="UI.BDautorepuestoDataSetTableAdapters.inventarioStockTableAdapter"></asp:ObjectDataSource>
      

</asp:Content>
