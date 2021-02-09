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

               <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
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
                <div class="col-lg-6">
                    <asp:GridView ID="GridView2" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="NIT" HeaderText="NIT" SortExpression="NIT"></asp:BoundField>
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" ReadOnly="True" DataFormatString="{0:0.00}"></asp:BoundField>
                            <asp:BoundField DataField="Pendiente" HeaderText="Pendiente" SortExpression="Pendiente" ReadOnly="True" DataFormatString="{0:0.00}"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="select distinct Cliente.NIT, Cliente.Nombre + '  ' + Cliente.Apellidos AS Nombre, Sum(Credito.Monto) as Monto,  SUM(Credito.SaldoPendiente) as Pendiente
from Credito inner join Venta on Venta.ID_Venta = Credito.ID_Venta
inner join Cliente on Credito.ID_Cliente = Cliente.ID_Cliente and Venta.ID_Cliente = Cliente.ID_Cliente
where  Credito.SaldoPendiente  != 0
Group by NIT, Nombre, Apellidos
Order by Nombre asc"></asp:SqlDataSource>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="label label-danger pull-left" Text=""></asp:Label>
            </div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="ID_Producto" HeaderText="ID" SortExpression="ID_Producto" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="FechaCredito" HeaderText="Fecha Credito" SortExpression="FechaCredito" />
                <asp:BoundField DataField="ID_ItemProdCliente" HeaderText="ID I" InsertVisible="False" ReadOnly="True" SortExpression="ID_ItemProdCliente" />
                <asp:BoundField DataField="ID_Credito" HeaderText="ID C" SortExpression="ID_Credito" />
                <asp:BoundField DataField="ID_Venta" HeaderText="ID V" SortExpression="ID_Venta" />
                <asp:BoundField DataField="Motorista" HeaderText="Motorista" SortExpression="Motorista"/>
                 <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckItem" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
               </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Producto.ID_Producto, Producto.Descripcion, DetalleVenta.Total, DetalleVenta.Cantidad, DetalleVenta.Total, Credito.FechaCredito, ItemProdCliente.ID_ItemProdCliente, Credito.ID_Credito, Venta.ID_Venta, Empleado.Nombre + ' ' + Empleado.Apellidos AS Motorista
FROM  Venta INNER JOIN
         DetalleVenta ON Venta.ID_Venta = DetalleVenta.ID_Venta INNER JOIN
         Stock ON DetalleVenta.ID_Existencia = Stock.ID_Existencia INNER JOIN
         Cliente ON Venta.ID_Cliente = Cliente.ID_Cliente INNER JOIN
         Credito ON Venta.ID_Venta = Credito.ID_Venta INNER JOIN
         ItemProdCliente ON Credito.ID_Credito = ItemProdCliente.ID_Credito INNER JOIN
         Producto ON Stock.ID_Producto = Producto.ID_Producto AND ItemProdCliente.ID_Existencia = Stock.ID_Existencia left JOIN
         Motoristas ON Venta.ID_Venta = Motoristas.ID_Venta left JOIN
         Empleado ON Motoristas.ID_Empleado = Empleado.ID_Empleado
WHERE ItemProdCliente.Estado = 0 AND Cliente.NIT =  @NIT">
                   <SelectParameters>
                       <asp:Parameter Name="NIT" />
                   </SelectParameters>
               </asp:SqlDataSource>
        <div class="row">
            <div class="col-sm-3"></div>
             <div class="col-sm-3"></div>
             <div class="col-sm-3">
                 <div class="form-group">Saldo total pendiente</div>
             </div>
             <div class="col-sm-3">
                 <div class="form-group">
                     <asp:TextBox ID="TextBox2"  CssClass="form-control" Enabled="false" runat="server"></asp:TextBox></div>
             </div>
        </div>
        <div class="form-group">
            <asp:Button ID="Button5" CssClass="btn btn-primary pull-right" runat="server" Text="Imprimir" Width="200" OnClick="Button5_Click" />
                <asp:Button ID="Button2" runat="server" Text="Aceptar" CssClass="btn btn-default pull-right" OnClick="Button2_Click" Width="200" />
                    <asp:Button ID="Button10" runat="server" CssClass="btn btn-danger pull-right" Text="Refrescar pagina" OnClick="Button10_Click" />

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
