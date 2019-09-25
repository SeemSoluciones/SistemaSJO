<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImpCompro.aspx.cs" Inherits="UI.ImpCompro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Imprimir comprobante</title>
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
                       <b>Total pago:</b>  <asp:Label ID="Label4" runat="server" Text="."></asp:Label><br />
                    
                </div>
                <div class="col-sm-2 invoice-col">

                </div>
         <div class="col-sm-4 invoice-col">
        Sucursal:
        <address>
          <strong>Autorepuesto SanJuan, Inc.</strong><br/>
          Direccion: Entrada a San Juan <br/>
          Ostuncalco, Quetzaltenango.<br/>
          Phone: (502) 4067 8250<br>
        </address>
      </div>
            </div>
       <div class="row">
      <div class="col-xs-12 table-responsive">
      <table class="table table-striped">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                   <asp:BoundField DataField="Codigo" HeaderText="Producto" SortExpression="Codigo" />
                        <asp:BoundField DataField="FechaPedido" HeaderText="Fecha Pedido" SortExpression="FechaPedido" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha Entrega" SortExpression="FechaEntrega" DataFormatString="{0:dd/MMyyyy}" />
                        <asp:BoundField DataField="Anticipo" HeaderText="Anticipo" SortExpression="Anticipo" DataFormatString="{0:0.00}" />
                        <asp:BoundField DataField="PrecioReal" HeaderText="Precio" SortExpression="PrecioReal" DataFormatString="{0:0.00}" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
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
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="">
               </asp:SqlDataSource>
          </table>
          </div>
           </div>
               <div class="row">
                   <div class="col-md-6"></div>
                   <div class="col-md-6">
                       <h2>Producto entregado y cancelado!</h2>
                   </div>
               </div>
           </section>
        </div>

    </form>
</body>
</html>
