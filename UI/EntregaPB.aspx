﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Bodegero.Master" AutoEventWireup="true" CodeBehind="EntregaPB.aspx.cs" Inherits="UI.EntregaPB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <label>Lista de clientes con entrega pendientes</label>
        </div>
    <asp:gridview runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource1" CssClass="table table-responsive" OnRowDataBound="Unnamed1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="ID_Venta" HeaderText="ID_Venta" SortExpression="ID_Venta" />
            <asp:BoundField DataField="NoFac_Pref" HeaderText="NoFac_Pref" SortExpression="NoFac_Pref" />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
            <asp:BoundField DataField="Product" HeaderText="Product" ReadOnly="True" SortExpression="Product" />
            <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
            <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
            <asp:BoundField DataField="MarcaP" HeaderText="MarcaP" SortExpression="MarcaP" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
            <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Entregar" OnClientClick='return confirm("Esta seguro de entregar el producto?");'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:gridview>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" DeleteCommand="UPDATE Estados SET EstadoBodega = 1 WHERE (ID_Venta = @ID_Venta)" SelectCommand="SELECT Bitacora.ID_Venta, Venta.NoFac_Pref, Producto.Codigo, Producto.Producto + '  ' + Producto.Descripcion AS Product, Rubro.Rubro, Modelo.Modelo, Marca.Marca, MarcaProd.MarcaP, DetalleVenta.Cantidad, Stock.Ubicacion FROM DetalleVenta INNER JOIN Producto ON DetalleVenta.Codigo = Producto.Codigo INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Stock ON Producto.Codigo = Stock.Codigo INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta INNER JOIN Bitacora ON Venta.ID_Venta = Bitacora.ID_Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta INNER JOIN MarcaProd ON Producto.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Modelo ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca WHERE (Estados.EstadoBodega = 1)">
        <DeleteParameters>
            <asp:Parameter Name="ID_Venta" />
        </DeleteParameters>
        </asp:SqlDataSource>
</asp:Content>

