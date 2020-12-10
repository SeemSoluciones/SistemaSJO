<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImpresionCredito.aspx.cs" Inherits="UI.ImpresionCredito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Credito pendiente</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="assets/bower_components/bootstrap/dist/css/bootstrap.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="assets/bower_components/font-awesome/css/font-awesome.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="assets/bower_components/Ionicons/css/ionicons.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.min.css"/>
</head>
<body onload="window.print();">
    <form id="form1" runat="server">
        <div class="wrapper">
           <section class="invoice">
         <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <i class="fa fa-globe"></i> Autorepuesto San Juan, Inc.
          <small class="pull-right">Date:  <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
            <div class="row">
                <div class="col-sm-6 invoice-col">
                    Datos del cliente: <br />
                      <b>NIT:</b>  <asp:Label ID="Label1" runat="server" Text="."></asp:Label> <br />
                       <b>Nombre:</b>  <asp:Label ID="Label2" runat="server" Text="."></asp:Label><br />
                       <b>Deuda pendiente:</b>  <asp:Label ID="Label4" runat="server" Text="."></asp:Label><br />
                    
                </div>
                <div class="col-sm-2 invoice-col">

                </div>
         <div class="col-sm-4 invoice-col">
        Sucursal:
        <address>
          <strong>Autorepuesto SanJuan, Inc.</strong><br/>
          Direccion: Entrada a San Juan <br/>
          Ostuncalco, Quetzaltenango.<br/>
           Telefono: (502) 4067 8250 / 5560 5310<br>
        </address>
      </div>
            </div>
       <div class="row">
      <div class="col-xs-12 table-responsive">
      <table class="table table-striped">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="ID_Producto" HeaderText="ID_Producto" SortExpression="ID_Producto" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio p" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}"/>
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="FechaCredito" HeaderText="FechaCredito" SortExpression="FechaCredito"  />
            </Columns>
               <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
               </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="select  Producto.ID_Producto, Producto.Descripcion, DetalleVenta.PrecioUnitario, DetalleVenta.Total
, Credito.FechaCredito, ItemProdCliente.ID_ItemProdCliente, Credito.ID_Credito
from Venta inner join DetalleVenta on Venta.ID_Venta = DetalleVenta.ID_Venta 
inner join Stock on  DetalleVenta.ID_Existencia = Stock.ID_Existencia
inner join Cliente on Venta.ID_Cliente = Cliente.ID_Cliente
inner join Credito on Venta.ID_Venta = Credito.ID_Venta 
inner join ItemProdCliente on Credito.ID_Credito = ItemProdCliente.ID_Credito
inner join Producto on Stock.ID_Producto = Producto.ID_Producto and ItemProdCliente.ID_Existencia = Stock.ID_Existencia
where Cliente.NIT = @NIT AND ItemProdCliente.Estado = 0">
              <SelectParameters>
                  <asp:Parameter Name="NIT"></asp:Parameter>
              </SelectParameters>
          </asp:SqlDataSource>
          </table>
          </div>
           </div>
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
           </section>
        </div>
    </form>
</body>
</html>
