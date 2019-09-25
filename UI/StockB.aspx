<%@ Page Title="" Language="C#" MasterPageFile="~/Bodegero.Master" AutoEventWireup="true" CodeBehind="StockB.aspx.cs" Inherits="UI.StockB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .fondo{
            background-color:black;
            filter:apha(opacity=90);
            opacity:0.8;
            z-index:10000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Buscar" />
    </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Codigo">
        <Columns>
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
            <asp:BoundField DataField="Cantidad_Min" HeaderText="Cantidad_Min" SortExpression="Cantidad_Min" />
            <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
            <asp:BoundField DataField="Producto" HeaderText="Producto" ReadOnly="True" SortExpression="Producto" />
            <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda" />
        </Columns>
    </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Top(50) Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Producto.Codigo, Producto.Producto + ':  ' + Producto.Descripcion AS Producto, Tienda.Tienda FROM Stock INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Producto ON Stock.Codigo = Producto.Codigo WHERE (Producto.Estado = 1) AND (Tienda.ID_Tienda = @ID_Tienda)">
                <SelectParameters>
                    <asp:SessionParameter Name="ID_Tienda" SessionField="IdTienda" />
                </SelectParameters>
    </asp:SqlDataSource>
            </asp:Content>
