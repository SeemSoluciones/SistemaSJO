<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Factura2.aspx.cs" Inherits="UI.Factura2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>Preforma</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="assets/bower_components/bootstrap/dist/css/bootstrap.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="assets/bower_components/font-awesome/css/font-awesome.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="assets/bower_components/Ionicons/css/ionicons.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.min.css"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>

</head>
<body onload="window.print();">
    <form id="form1" runat="server">
   <div class="wrapper">
  <!-- Main content -->
  <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <i class="fa fa-globe"></i> Autorepuesto San Juan, Inc.
          <small class="pull-right">Date:  <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
      <div class="col-sm-4 invoice-col">
        Sucursal:
        <address>
          <strong>Autorepuesto SanJuan, Inc.</strong><br>
          Direccion: Entrada a San Juan <br>
          Ostuncalco, Quetzaltenango.<br>
          Phone: (502) 4067 8250<br>
        </address>
      </div>
      <!-- /.col -->
      <div class="col-sm-4 invoice-col">
        Datos del cliente:
        <address>
          <strong>Nombre:  
            <asp:Label ID="Nombre" runat="server" Text=""></asp:Label> </strong><br>
           NIT: 
            <asp:Label ID="nit" runat="server" Text=""></asp:Label> <br>
           Direccion: 
            <asp:Label ID="Dire" runat="server" Text=""></asp:Label><br>
        </address>
      </div>
      <!-- /.col -->
      <div class="col-sm-4 invoice-col">
        <b>Datos generales</b><br>
        <b>Order ID:</b> 
            <asp:Label ID="Label5" runat="server" Text=""></asp:Label> <br>
        <b>Fecha:</b>
            <asp:Label ID="Label6" runat="server" Text=""></asp:Label> <br>
          <b>Forma de pago:</b>
            <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
          <br/>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
      <div class="col-xs-12 table-responsive">
      <table class="table table-striped">
            <asp:GridView ID="GridView1" CssClass="table table-responsive table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
                <Columns>
                                <asp:BoundField DataField="Cantidad" HeaderText="Cant" ReadOnly="True" SortExpression="Codigo" />
                                <asp:BoundField DataField="Codigos" HeaderText="Codigos" SortExpression="Codigos" />   
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}"/>
                                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
       </table>
            <table class="table table-striped">
            <asp:GridView ID="GridView2" CssClass="table table-responsive table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
                <Columns>
                                <asp:BoundField DataField="Cantidad" HeaderText="Cant" ReadOnly="True" SortExpression="Codigo" />
                                <asp:BoundField DataField="Codigos" HeaderText="Codigos" SortExpression="Codigos" />   
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" DataFormatString="{0:0.00}"/>
                                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
       </table>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
      <!-- accepted payments column -->
      <div class="col-xs-6">
        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
         Cualquier cambio o devolucion sera realizado dentro de 5 dias habiles.
        </p>
      </div>
      <!-- /.col -->
      <div class="col-xs-6">

        <div class="table-responsive">
          <table class="table">
            <tr>
              <th style="width:50%">Subtotal:</th>
              <td>  <asp:Label ID="Label1" runat="server" Text="0.0"></asp:Label> </td>
            </tr>
            <tr>
              <th>Descuento</th>
              <td>  <asp:Label ID="Label2" runat="server" Text="0.0"></asp:Label> </td>
              <td></td>
            </tr>
            <tr>
              <th>Total:</th>
              <td>  <asp:Label ID="Label3" runat="server" Text="0.0"></asp:Label> </td>
              <td></td>
            </tr>
          </table>
        </div>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
    </form>
</body>
</html>
