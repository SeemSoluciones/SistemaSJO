<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="StockMinimo.aspx.cs" Inherits="UI.StockMinimo" %>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive table-hover" DataKeyNames="ID_Producto" AllowPaging="True" PageSize="20">
                <Columns>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID_Producto" SortExpression="ID_Producto" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="LISTAOEM" HeaderText="LISTAOEM" SortExpression="LISTAOEM" ReadOnly="True" />
                    <asp:BoundField DataField="LISTACODP" HeaderText="LISTACODP" SortExpression="LISTACODP" ReadOnly="True" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="LISTANIOP" HeaderText="LISTANIOP" SortExpression="LISTANIOP" ReadOnly="True" />
                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" ReadOnly="True" />
                    <asp:BoundField DataField="MarcaP" HeaderText="MarcaP" SortExpression="MarcaP" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                    <asp:BoundField DataField="Cantidad_Min" HeaderText="Cantidad_Min" SortExpression="Cantidad_Min" />
                    <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                    <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida"></asp:BoundField>
                    <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda"></asp:BoundField>
                </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT DISTINCT Producto.ID_Producto,stuff((Select ', ' + OEM.OEM From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM , stuff((Select ', ' + CodigoProducto.Codigo From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP,Producto.Descripcion, stuff((Select '| ' + Marca +', '+ Modelo + ', ' + Rubro + ' ~ ' + AnioInicio + '-'+AnioFinal  
From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria, MarcaProd.MarcaP,  Stock.Cantidad, Stock.Cantidad_Min, Stock.Ubicacion, Medida.Medida,           Tienda.Tienda
FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN          SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN          MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN          Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join OEM on Producto.ID_Producto = OEM.ID_Producto inner join CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto  
Where (Producto.Estado = 1) AND  (Stock.Cantidad <= Stock.Cantidad_Min)
Order by Producto.Descripcion"></asp:SqlDataSource>
        </div>
        </div>
    </div>

</asp:Content>
