<%@ Page Title="" Language="C#" MasterPageFile="~/Digitador.Master" AutoEventWireup="true" CodeBehind="StockM.aspx.cs" Inherits="UI.StockM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="content">
        <div class="box">
        <div class="box-body">
             <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button2_Click" />             
                </span>
              </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive table-hover" DataKeyNames="Codigo" AllowPaging="True" PageSize="20">
                <Columns>
                    <asp:BoundField DataField="Cantidad" HeaderText="Cant" SortExpression="Cantidad" />
                    <asp:BoundField DataField="Cantidad_Min" HeaderText="Cant Min" SortExpression="Cantidad_Min" />
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" ReadOnly="True" />
                    <asp:BoundField DataField="Productos" HeaderText="Productos" SortExpression="Productos" ReadOnly="True" />
                    <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                    <asp:BoundField DataField="Anio" HeaderText="Anio" SortExpression="Anio" />
                    <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                    <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda" />
                </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Stock.Cantidad, Stock.Cantidad_Min, Producto.Codigo, Producto.Producto + '  ' + Producto.Descripcion AS Productos, Stock.Ubicacion, Anio.Anio, Rubro.Rubro, Modelo.Modelo, Marca.Marca, Tienda.Tienda FROM Stock INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Producto ON Stock.Codigo = Producto.Codigo INNER JOIN Rubro ON Producto.ID_Rubro = Rubro.ID_Rubro INNER JOIN Modelo ON Rubro.ID_Modelo = Modelo.ID_Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio WHERE (Producto.Estado = 1) AND (Stock.Cantidad &lt;= Stock.Cantidad_Min) ORDER BY Productos"></asp:SqlDataSource>
        </div>
        </div>
    </div>
</asp:Content>
