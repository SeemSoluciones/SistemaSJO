<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Credito2.aspx.cs" Inherits="UI.Credito2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style type="text/css">
         .fondo{
             background-color:black;
             filter:opha(opacity=90);
             opacity:0.8;
             z-index:10000
         }
     </style>
    
    <div class="content-header"> 

    </div>
    <div class="content">
            <div class="input-group custom-search-form">

               <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button1_Click" />            
               </span></div>
        <div class="jumbotron">
            <div class="row">
                <div class="col-lg-2">
                   <div class="form-group">
                        <label class="form-control">NIT:</label>
                        <label class="form-control">Nombre:</label>
                       <label class="form-control">Deuda pendiente:</label>
                   </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <asp:Label ID="Label1" CssClass="form-control label-primary" runat="server" Text="."></asp:Label>
                         <asp:Label ID="Label2" CssClass="form-control label-primary" runat="server" Text="."></asp:Label>
                         <asp:Label ID="Label4" CssClass="form-control label-primary" runat="server" Text="."></asp:Label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="label label-danger pull-left" Text=""></asp:Label>
            </div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive">
            <Columns>
                <asp:BoundField DataField="ID_Producto" HeaderText="ID" SortExpression="ID_Producto" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="SaldoPendiente" HeaderText="SaldoPendiente" SortExpression="SaldoPendiente" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="FechaCredito" HeaderText="Fecha Credito" SortExpression="FechaCredito" />
                <asp:BoundField DataField="ID_ItemProdCliente" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_ItemProdCliente" />
                <asp:BoundField DataField="ID_Credito" HeaderText="Credito" SortExpression="ID_Credito" />
                 <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckItem" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
               </asp:GridView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="">
               </asp:SqlDataSource>
        <div class="form-group">
            <asp:Button ID="Button5" CssClass="btn btn-danger pull-right" runat="server" Text="Imprimir" Width="200" OnClick="Button5_Click" />
                <asp:Button ID="Button2" runat="server" Text="Aceptar" CssClass="btn btn-default pull-right" OnClick="Button2_Click" Width="200" />
        </div>


        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Button ID="Button3" runat="server" Text="Button" style="display:none;" />
            <cc1:ModalPopupExtender ID="Button3_ModalPopupExtender" runat="server"  Enabled="True" TargetControlID="Button3" PopupControlID="Panel1" BackgroundCssClass="fondo" CancelControlID="Cerrar" >
            </cc1:ModalPopupExtender>
        
        <asp:Panel ID="Panel1" runat="server">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Esta seguro de realizar el siguente operacion?</h5>
                 <button class="close" data-dismiss="modal" aria-label="Cerrar">
                     <span aria-hidden="true">&times;</span>
                 </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">

                
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button4" CssClass="btn btn-danger pull-right" runat="server" Text="Aceptar" OnClick="Button4_Click" />
                <button id="Cerrar" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
            </div>
        </asp:Panel>
        <br />

     </div>
</asp:Content>
