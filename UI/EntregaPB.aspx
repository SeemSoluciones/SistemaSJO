<%@ Page Title="" Language="C#" MasterPageFile="~/Bodegero.Master" AutoEventWireup="true" CodeBehind="EntregaPB.aspx.cs" Inherits="UI.EntregaPB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="refresh" content="300"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row col-md-4">
<div class="form-group">
        <label>Lista de clientes</label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass ="form-control select2" multiple="multiple" data-placeholder="Select a State" AppendDataBoundItems="true" AutoPostBack="true"
                        style="width: 100%;" DataSourceID="SqlDataSource2" DataTextField="Cliente" DataValueField="ID_Venta"  >
            <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT DISTINCT Venta.ID_Venta, 'ID Venta' + ': '+ CAST(Venta.ID_Venta AS nvarchar) +' - '+ Cliente.Nombre + ' ' + Cliente.Apellidos AS Cliente FROM Venta INNER JOIN Estados ON Venta.ID_Venta = Estados.ID_Venta inner join Cliente on Venta.ID_Cliente = Cliente.ID_Cliente WHERE (Estados.ID_Tienda = @IDtienda) AND Estados.EstadoBodega = 1">
            <SelectParameters>
                <asp:SessionParameter SessionField="IdTienda" Name="IDtienda"></asp:SessionParameter>


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
    <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CssClass="table table-responsive" OnRowDataBound="Unnamed1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="Stock" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
             <asp:BoundField DataField="ID_Venta" HeaderText="Venta" SortExpression="ID_Venta" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
            <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
            <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
            <asp:BoundField DataField="MarcaP" HeaderText="MarcaP" SortExpression="MarcaP" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
            <asp:BoundField DataField="LISTANIOP" HeaderText="LISTANIOP" SortExpression="LISTANIOP" ReadOnly="True" />
            <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" ReadOnly="True" />
        </Columns>
    </asp:gridview>

    <div class="form-group">
        <asp:Button ID="Button1" runat="server" Text="Realizar entrega del (de los) producto(s)." CssClass="btn btn-danger btn-flat"  OnClientClick='return confirm("Esta seguro de entregar producto?");' OnClick="Button1_Click"/>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT DISTINCT Venta.ID_Venta, Stock.ID_Existencia AS ID,  Stock.Cantidad, Stock.Ubicacion, Medida.Medida,  MarcaProd.MarcaP,Producto.Descripcion, 
stuff((Select '| ' + Marca +', '+ Modelo + ', ' + Rubro + ' ~ ' + AnioInicio + '-'+AnioFinal From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,
SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria
FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN        
  SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN
            MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN         
			 Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join 
			 OEM on Producto.ID_Producto = OEM.ID_Producto inner join 
			 CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto inner join
			 DetalleVenta on DetalleVenta.ID_Existencia =  Stock.ID_Existencia inner join
			 Venta on Venta.ID_Venta = DetalleVenta.ID_Venta inner join 
			 Estados on Estados.ID_Venta = Venta.ID_Venta
 Where Estados.EstadoBodega = 1 AND Venta.ID_Venta = @ID_Venta"
        UpdateCommand="UPDATE Estados SET EstadoBodega = 0 WHERE (ID_Venta = @ID_Venta)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="ID_Venta"></asp:ControlParameter>


        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID_Venta" />
        </UpdateParameters>
        </asp:SqlDataSource>

    
</asp:Content>

