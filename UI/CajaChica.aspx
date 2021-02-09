<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CajaChica.aspx.cs" Inherits="UI.CajaChica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="assets/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"/>
  <!-- iCheck for checkboxes and radio inputs -->
      <link rel="stylesheet" href="assets/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="assets/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css"/>
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="assets/plugins/timepicker/bootstrap-timepicker.min.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>

              <p>New Orders</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>

              <p>Bounce Rate</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>User Registrations</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>Unique Visitors</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>--%>
    <div class="row">
        <div class="col-md-4">
               <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                   <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control pull-right" TextMode="Date"></asp:TextBox>
             
               </div>
        </div>
        <div class="col-md-4">
               <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control pull-right" TextMode="Date"></asp:TextBox>
                </div>
        </div>
        <div class="col-md-4">
            <asp:Button ID="Button1" runat="server" Text="Aceptar"  CssClass="form-control" OnClick="Button1_Click" />
        </div>
    </div>
    <div class="row">
        <div  class="col-md-3">
            <label>Total ingresado a caja</label><br />
            <asp:label runat="server" ID="lblTotalI" CssClass="h2" text="0.00"></asp:label>
        </div>
        <div  class="col-md-3">
            <label>Total retirado de la caja</label><br />
             <asp:label runat="server" ID="lblTotalR" CssClass="h2" text="0.00"></asp:label>
        </div>
        <div  class="col-md-3">
            <asp:GridView ID="GridView2" CssClass="table table-responsive table-bordered table-condensed table-striped" runat="server" DataSourceID="SqlDataSource4" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Total" HeaderText="Total Venta - Q" ItemStyle-Font-Size="Large" ItemStyle-Font-Bold="true" ReadOnly="True" SortExpression="Total" DataFormatString="{0:0.00}"></asp:BoundField>
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo"></asp:BoundField>
<%--                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" ReadOnly="True" SortExpression="Subtotal"></asp:BoundField>
                    <asp:BoundField DataField="TOTALDETALLE" HeaderText="TOTALDETALLE" ReadOnly="True" SortExpression="TOTALDETALLE"></asp:BoundField>--%>
                </Columns>
            </asp:GridView>
            Total Venta : <asp:Label ID="Label3" runat="server" Text="0.0"></asp:Label>
        </div>
        <div  class="col-md-3">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive table-hover table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" OnRowDataBound="GridView1_RowDataBound">
                <Columns>

                    <asp:BoundField DataField="TotalCompraDetalle" ItemStyle-Font-Bold="true"  ItemStyle-Font-Size="Large" HeaderText="Total Compra - Q" ReadOnly="True" SortExpression="TotalCompraDetalle" DataFormatString="{0:0.00}"></asp:BoundField>
                   <%-- <asp:BoundField DataField="TotalCompra" HeaderText="TotalCompra" ReadOnly="True" SortExpression="TotalCompra"></asp:BoundField>--%>
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo"></asp:BoundField>
                </Columns>
            </asp:GridView>
              Total Compra : <asp:Label ID="Label4" runat="server" Text="0.0"></asp:Label>
        </div>
    </div>
    <br />
    <br />
    
    <div class="jumbotron">
        <div class="row">
        <div  class="col-md-6">
            <label>Total ingresados</label><br />
            <asp:label runat="server" ID="Label1" CssClass="h2 pull-right-container" text="0.00"></asp:label>
        </div>
        <div  class="col-md-6">
            <label>Total retirados</label><br />
             <asp:label runat="server" ID="Label2" CssClass="h2 pull-right-container" text="0.00"></asp:label>
        </div>
           </div>
    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT SUM(MontoInicial) AS TotalEntrada FROM CajaEntrada WHERE (Fecha BETWEEN @FechaInicio AND @FechaFinal)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="FechaInicio"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="FechaFinal"></asp:ControlParameter>

        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT SUM(MontoSalida) AS TotalSalida FROM CajaSalidas WHERE (Fecha BETWEEN @FechaInicio AND @FechaFinal)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="FechaInicio"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="FechaFinal"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT SUM(DetalleCompra.Total) AS TotalCompraDetalle, SUM(Compra.Total) AS TotalCompra, TipoPago.Tipo FROM DetalleCompra INNER JOIN Compra ON DetalleCompra.ID_Compra = Compra.ID_Compra INNER JOIN TipoPago ON Compra.ID_TPago = TipoPago.ID_TPago WHERE (CAST(Compra.Fecha AS DATE)  BETWEEN @FechaInicio AND @FechaFinal) GROUP BY TipoPago.Tipo ORDER BY TipoPago.Tipo">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="FechaInicio"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="FechaFinal"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT SUM(Venta.Total) AS Total, TipoPago.Tipo, SUM(Venta.Subtotal) AS Subtotal, SUM(DetalleVenta.Total) AS TOTALDETALLE FROM DetalleVenta INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta INNER JOIN TipoPago ON DetalleVenta.ID_TPago = TipoPago.ID_TPago WHERE (Cast(Venta.Fecha AS DATE) BETWEEN @FechaInicio AND @FechaFinal) GROUP BY TipoPago.Tipo ORDER BY TipoPago.Tipo">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="FechaInicio"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="FechaFinal"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>


        <script src="assets/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="assets/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="assets/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>

    <script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    })

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
  })
</script>
</asp:Content>
