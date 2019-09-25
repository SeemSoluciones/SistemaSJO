﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Bodegero.Master" AutoEventWireup="true" CodeBehind="EntregaPB.aspx.cs" Inherits="UI.EntregaPB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="refresh" content="300"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row col-md-4">
<div class="form-group">
        <label>Lista de clientes</label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass ="form-control select2" multiple="multiple" data-placeholder="Select a State"
                        style="width: 100%;" DataSourceID="SqlDataSource2" DataTextField="ID_Venta" DataValueField="ID_Venta"  AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Venta.ID_Venta FROM Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta WHERE (Estados.ID_Tienda = @IDtienda) AND Estados.EstadoBodega = 1">
            <SelectParameters>
                <asp:SessionParameter Name="IDtienda" SessionField="IDtienda" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </div>
    <br />
    <div class="row col-md-4">

    </div>
    <div class ="row col-md-4">
        <%--<div class="col-lg-4 col-xs-8">--%>
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>
                  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3>

              <p>Total Nuevos Ordenes</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="EntregaPB.aspx" class="small-box-footer">Refrescar la pagina<i class="fa fa-arrow-circle-right"></i></a>
          </div>
        <%--</div>--%>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT COUNT(Venta.ID_Venta) AS total FROM Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta WHERE (Estados.ID_Tienda = @IdTienda) AND (Estados.EstadoBodega = 1)">
                <SelectParameters>
                    <asp:Parameter Name="IdTienda" />
                </SelectParameters>
            </asp:SqlDataSource>

       </div>
    <div class="form-group">
        <label>Listado de productos</label>
        </div>
    <asp:gridview runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource1" CssClass="table table-responsive" OnRowDataBound="Unnamed1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="ID_Venta" HeaderText="ID_Venta" SortExpression="ID_Venta"/>
            <asp:BoundField DataField="NoFac_Pref" HeaderText="NoFac_Pref" SortExpression="NoFac_Pref" />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
            <asp:BoundField DataField="Product" HeaderText="Product" ReadOnly="True" SortExpression="Product" />
            <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
            <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
            <asp:BoundField DataField="MarcaP" HeaderText="MarcaP" SortExpression="MarcaP" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" ItemStyle-BackColor="Red" >
            </asp:BoundField>
            <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion"  ItemStyle-BackColor ="YellowGreen">
            </asp:BoundField>
        </Columns>
    </asp:gridview>

    <div class="form-group">
        <asp:Button ID="Button1" runat="server" Text="Realizar entrega del (de los) producto(s)." CssClass="btn btn-danger btn-flat"  OnClientClick='return confirm("Esta seguro de entregar producto?");' OnClick="Button1_Click"/>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>"  SelectCommand="SELECT Bitacora.ID_Venta, Venta.NoFac_Pref, Producto.Codigo, Producto.Producto + '  ' + Producto.Descripcion AS Product, Rubro.Rubro, Modelo.Modelo, Marca.Marca, MarcaProd.MarcaP, DetalleVenta.Cantidad, Stock.Ubicacion FROM DetalleVenta INNER JOIN Producto ON DetalleVenta.Codigo = Producto.Codigo INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Stock ON Producto.Codigo = Stock.Codigo INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta INNER JOIN Bitacora ON Venta.ID_Venta = Bitacora.ID_Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Modelo ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca WHERE (Estados.EstadoBodega = 1) AND (Bitacora.ID_Venta = @ID_Venta)" UpdateCommand="UPDATE Estados SET EstadoBodega = 0 WHERE (ID_Venta = @ID_Venta)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ID_Venta" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID_Venta" />
        </UpdateParameters>
        </asp:SqlDataSource>

    
</asp:Content>

