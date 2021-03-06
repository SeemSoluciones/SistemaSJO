﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Cobrador.Master" AutoEventWireup="true" CodeBehind="CajaCobrador.aspx.cs" Inherits="UI.CajaCobrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta http-equiv="refresh" content="300"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <h3 class="">Clientes pendiente de cobro.</h3>
        <div class="row">
            <div class="col-md-4">
                    <div class="small-box bg-gray-light">
            <div class="inner">
               <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False">
                      <Columns>
                          <asp:BoundField DataField="TOTAL" HeaderText="TOTAL     " ReadOnly="True" SortExpression="TOTAL" />
                          <asp:BoundField DataField="Tipo" HeaderText="Formas de pago" SortExpression="Tipo" />
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

              <p>Total recaudado hoy.</p>
            </div>
            <div class="icon">
              <i class="ion ion-cash"></i>
            </div>
            <a href="CajaCobrador.aspx" class="small-box-footer">Refrescar la pagina<i class="fa fa-arrow-circle-right"></i></a>
          </div>
            </div>
            <div class="col-md-4">

            </div>
            <div class="col-md-4">
                <div class="small-box bg-aqua">
            <div class="inner">
              <h3>
                  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3>
                

              <p>Total Nuevos Ordenes</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="CajaCobrador.aspx" class="small-box-footer">Refrescar la pagina<i class="fa fa-arrow-circle-right"></i></a>
          </div>
            </div>



             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT COUNT(Venta.ID_Venta) AS total FROM Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta WHERE (Estados.ID_Tienda = @IdTienda) AND (Estados.EstadoCajero = 1)">
                <SelectParameters>
                    <asp:Parameter Name="IdTienda" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
       
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive" DataKeyNames="ID_Venta" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_Venta" ItemStyle-BackColor ="Red" HeaderText="ID Venta" InsertVisible="False" ReadOnly="True" SortExpression="ID_Venta" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" DataFormatString="{0:0.00}" />
            <asp:BoundField DataField="Descuento" HeaderText="Descuento" SortExpression="Descuento" DataFormatString="{0:0.00}" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}"  ItemStyle-Font-Size="Larger" ItemStyle-Font-Bold="true"/>
            <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CssClass="label label-success fa fa-money" runat="server" CausesValidation="False" CommandName="Delete" Text="Cobrar" OnClientClick='return confirm("Esta seguro de cobrar esta venta?");'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Venta.ID_Venta, Venta.NoFac_Pref, Venta.Fecha, Venta.Subtotal, Venta.Descuento, 'Q '+ CAST(Venta.Total AS nvarchar) AS Total, Caja.Caja FROM Estados INNER JOIN Venta ON Estados.ID_Venta = Venta.ID_Venta INNER JOIN Tienda ON Estados.ID_Tienda = Tienda.ID_Tienda INNER JOIN Caja ON Tienda.ID_Tienda = Caja.ID_Tienda INNER JOIN Bitacora ON Venta.ID_Venta = Bitacora.ID_Venta AND Caja.ID_Caja = Bitacora.ID_Caja WHERE (Tienda.ID_Tienda = @IDtienda) AND (Estados.EstadoCajero = 1)" DeleteCommand="UPDATE Estados SET EstadoCajero = 0 WHERE (ID_Venta = @ID_Venta)">
        <DeleteParameters>
            <asp:Parameter Name="ID_Venta" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="IDtienda" SessionField="IDtienda" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT 'Q.'+ CAST(ISNULL(SUM(Venta.Total), 0) AS VARCHAR) AS TOTAL, TipoPago.Tipo FROM Venta INNER JOIN DetalleVenta ON Venta.ID_Venta = DetalleVenta.ID_Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta inner JOIN TipoPago on TipoPago.ID_TPago = DetalleVenta.ID_TPago WHERE (Estados.ID_Tienda = @IDtienda) AND (Estados.EstadoCajero = 0) AND (CONVERT (date, Venta.Fecha) = CONVERT (date, GETDATE())) GROUP BY TipoPago.Tipo">
            <SelectParameters>
                <asp:SessionParameter SessionField="IDtienda" Name="IDtienda"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
</asp:Content>
