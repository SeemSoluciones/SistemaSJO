<%@ Page Title="" Language="C#" MasterPageFile="~/Revisable.Master" AutoEventWireup="true" CodeBehind="AsignacionMotorista.aspx.cs" Inherits="UI.AsignacionMotorista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-primary">
        <div class="box-header">
            <div class="box-title">
                Asignacion de motorista (Servicio a domicilio)
            </div>
        </div>
        <div class="box-body">
             <div class="row col-md-4">
         <label>Lista de clientes con asignacion de motoristas</label>
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control select2" multiple="multiple" data-placeholder="Select a State" AppendDataBoundItems="true" AutoPostBack="true"
            Style="width: 100%;" DataSourceID="SqlDataSource4" DataTextField="Cliente" DataValueField="ID_Cotizacion" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
            <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="Select ID_Cotizacion, 'ID Cotizacion' + ': '+ CAST(ID_Cotizacion as nvarchar) + ' - ' + Nombre As Cliente
from CotizacionVenta
where ID_Empleado = 1 AND EstadoRevisador IS Null">
        </asp:SqlDataSource>
    </div>
              <div class="row col-md-4">
                    <div class="form-group">
                        <label>Enviar para asignar motorista.</label>
                        <asp:DropDownList ID="DropDownList9" runat="server" CssClass="form-control select2-dropdown" DataSourceID="SqlDataSource11" DataTextField="Nombre" DataValueField="ID_Empleado" Enabled="False" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT Empleado.ID_Empleado, Empleado.Nombre + ' ' + Empleado.Apellidos AS Nombre FROM Empleado INNER JOIN Usuario ON Empleado.ID_Usuario = Usuario.ID_Usuario INNER JOIN Rol ON Usuario.ID_Rol = Rol.ID_Rol WHERE (Empleado.Estado = 1) AND (Empleado.ID_Tienda = @ID_Tienda) AND (Rol.Rol = 'Motorista' OR Rol.Rol = 'MOTORISTA')">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="IDtienda" Name="ID_Tienda"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
            </div>
            <div class="table table-responsive">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="ID_Cotizacion" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ID_Cotizacion" HeaderText="ID_Cotizacion" ReadOnly="True" InsertVisible="False" SortExpression="ID_Cotizacion"></asp:BoundField>
                        <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion"></asp:BoundField>
                        <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida"></asp:BoundField>
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad"></asp:BoundField>
                        <asp:BoundField DataField="MarcaP" HeaderText="MarcaP" SortExpression="MarcaP"></asp:BoundField>
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion"></asp:BoundField>
                        <asp:BoundField DataField="LISTAOEM" HeaderText="LISTAOEM" ReadOnly="True" SortExpression="LISTAOEM"></asp:BoundField>
                        <asp:BoundField DataField="LISTACODP" HeaderText="LISTACODP" ReadOnly="True" SortExpression="LISTACODP"></asp:BoundField>
                        <asp:BoundField DataField="LISTANIOP" HeaderText="LISTANIOP" ReadOnly="True" SortExpression="LISTANIOP"></asp:BoundField>
                        <asp:BoundField DataField="Categoria" HeaderText="Categoria" ReadOnly="True" SortExpression="Categoria"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT DISTINCT CotizacionVenta.ID_Cotizacion, Stock.Ubicacion, Medida.Medida, DetalleCotizacion.Cantidad ,  MarcaProd.MarcaP,Producto.Descripcion, 
        stuff((Select ', ' + OEM.OEM From OEM inner join Marca on OEM.ID_Marca = Marca.ID_Marca Where OEM.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTAOEM,
        stuff((Select ', ' + CodigoProducto.Codigo From CodigoProducto inner join MarcaProd on CodigoProducto.ID_MaraProd = MarcaProd.ID_MaraProd Where CodigoProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTACODP,
stuff((Select '| ' + Marca +', '+ Modelo + ', ' + Rubro + ' ~ ' + AnioInicio + '-'+AnioFinal From Marca inner join Modelo on Marca.ID_Marca = Modelo.ID_Marca inner join Rubro on Modelo.ID_Modelo = Rubro.ID_Modelo inner join AnioProducto on Rubro.ID_Rubro = AnioProducto.ID_Rubro Where AnioProducto.ID_Producto = Producto.ID_Producto For XML Path('')), 1,2,'') AS LISTANIOP,
SubCategoria.SubCategoria+', '+ Categoria.Categoria AS Categoria
FROM  Medida INNER JOIN          Stock INNER JOIN          Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN          Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN        
  SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria ON Medida.ID_Medida = Stock.ID_Medida INNER JOIN
            MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN         
			 Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria inner join 
			 OEM on Producto.ID_Producto = OEM.ID_Producto inner join 
			 CodigoProducto on Producto.ID_Producto = CodigoProducto.ID_Producto inner join
			 DetalleCotizacion on DetalleCotizacion.ID_Existencia =  Stock.ID_Existencia inner join
			 CotizacionVenta on CotizacionVenta.ID_Cotizacion = DetalleCotizacion.ID_Cotizacion
 Where CotizacionVenta.ID_Cotizacion = @ID_Cotizacion"
                    UpdateCommand="UPDATE CotizacionVenta SET EstadoRevisador = 1, ID_Empleado = @ID_Empleado WHERE (ID_Cotizacion = @ID_Cotizacion)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="ID_Cotizacion"></asp:ControlParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID_Empleado"></asp:Parameter>
                        <asp:Parameter Name="ID_Cotizacion"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server"  Enabled="false" CssClass="btn btn-primary btn-flat" Text="Realizar entrega." OnClientClick="return confirm('Desea realizar la entrega de producto al motorista seleccionado');" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
