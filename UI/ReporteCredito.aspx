<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ReporteCredito.aspx.cs" Inherits="UI.ReporteCredito" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="input-group custom-search-form">    
     <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
            <span class="input-group-btn">
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Aceptar" OnClick="Button1_Click" />
            </span>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" CssClass="table table-responsive" Height="517px" Width="1176px">
        <LocalReport ReportPath="Report1Abonos.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>

<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="ListaTotalesYpendientes" TypeName="UI.BDautorepuestoDataSetTableAdapters.ListaTotalesYpendienteCreditosTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="DatosClienteDelCredito" TypeName="UI.BDautorepuestoDataSetTableAdapters.ClienteTableAdapter"></asp:ObjectDataSource>

</asp:Content>
