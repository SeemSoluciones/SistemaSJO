<%@ Page Title="" Language="C#" MasterPageFile="~/Digitador.Master" AutoEventWireup="true" CodeBehind="DevProProD.aspx.cs" Inherits="UI.DevProProD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    
    
    <div class="content-head">

  </div>
    <div class="content">
          <div class="row">
        <div class="col-md-4">
            <div class="form-group">
            <label>No factura/preforma</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>  
        </div>
         <div class="col-md-4">
                 <label>Proveedor</label>
                 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Proveedor" DataValueField="ID_Proveedor"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Proveedor, Proveedor FROM Proveedor WHERE (Estado = 1)"></asp:SqlDataSource>
        </div>
         <div class="col-md-4">
              <div class="form-group">
            <label>Fecha</label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
            </div>  
        </div>
    </div>
        <!------------------------------- -->
           <div class="row">
            <div class="col-md-12">
                <div class="box box-info collapsed-box">
                    <div class="box-header with-border">
                       <div class="row">
                                <div class="col-sm-2">
                                  <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True" AppendDataBoundItems="true">
                                      <asp:ListItem Value="0">Seleccione uno...</asp:ListItem>
                                    </asp:DropDownList> 
                                 <%--  <asp:CheckBox ID="CheckBox3" runat="server" />Por marca--%>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY Marca ASC"></asp:SqlDataSource>
                                </div>
                                <div class="col-sm-2">
                                    <asp:DropDownList ID="DropDownList5" CssClass="form-control"  runat="server" DataSourceID="SqlDataSource6" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True">
                                        <asp:ListItem Value="0">Seleccione uno...</asp:ListItem>
                                    </asp:DropDownList>
                               
                                    <asp:SqlDataSource ID="SqlDataSource6"  runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @idMarca) ORDER BY Modelo Asc">
                                     <SelectParameters>
                                     <asp:ControlParameter ControlID="DropDownList2" Name="idMarca" PropertyName="SelectedValue" />
                                     </SelectParameters>
                                     </asp:SqlDataSource>
                                </div>
                                <div class="col-sm-1">
                                     <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Rubro" DataValueField="ID_Rubro">
                                         <asp:ListItem Value="0">Seleccione uno...</asp:ListItem>
                                     </asp:DropDownList >
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @idModelo) ORDER BY Rubro">
                                     <SelectParameters>
                                      <asp:ControlParameter ControlID="DropDownList5" Name="idModelo" PropertyName="SelectedValue" />
                                      </SelectParameters>
                                      </asp:SqlDataSource>
                                </div>
                                <div class="col-sm-1">
                                     <asp:DropDownList CssClass="form-control select2" ID="DropDownList7" runat="server" DataSourceID="SqlDataSource8" DataTextField="Anio" DataValueField="ID_Anio" AppendDataBoundItems="true">
                                         <asp:ListItem Value="0">Seleccione uno...</asp:ListItem>
                                     </asp:DropDownList>
                                   
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Anio], [Anio] FROM [Anio] ORDER BY Anio ASC "></asp:SqlDataSource>
     
                                </div>
                           <div class="col-xs-2">
                               <asp:DropDownList ID="DropDownList3" CssClass="form-control select2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Categoria" DataValueField="ID_SubCategoria" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AppendDataBoundItems="true">
                                   <asp:ListItem Value="0">Seleccione uno...</asp:ListItem>
                               </asp:DropDownList>
                               <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT SubCategoria.ID_SubCategoria, Categoria.Categoria + '  ' + SubCategoria.SubCategoria AS Categoria FROM Categoria INNER JOIN SubCategoria ON Categoria.ID_Categoria = SubCategoria.ID_Categoria ORDER BY Categoria.Categoria"></asp:SqlDataSource>
                           </div>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="TextBox20" CssClass="form-control" runat="server"></asp:TextBox>
                                      <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" />Desmarcar para solo codigo
                                </div>
                                <div class="col-sm-1">
                                    <asp:Button ID="Button9" CssClass="btn btn-default form-control" runat="server" Text="Buscar" OnClick="Button9_Click" />
                                </div>
                        
                                <div class="col-sm-1">
                              
                              <button type="button" class="btn btn-social-icon btn-success" data-widget="collapse"><i class="fa fa-plus-square"></i> </button>
                               </div>
                            </div>
                    </div>
                    <div class="box-body">
                      
                            <div class="table table-responsive">
                                <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive-lg table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource9" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" >
                                    <Columns>
                             
                                        <asp:BoundField DataField="LISTAOEM" HeaderText="LISTA OEM" SortExpression="LISTAOEM" ReadOnly="True" />
                                        <asp:BoundField DataField="LISTACODP" HeaderText="LISTA CODP" SortExpression="LISTACODP" ReadOnly="True" />
                                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                        <asp:BoundField DataField="LISTANIOP" HeaderText="Rubro-Año" SortExpression="LISTANIOP" ReadOnly="True" />
                                        <asp:BoundField DataField="MarcaP" HeaderText="Marca Prod" SortExpression="MarcaP" />
                                        <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio C" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}"  />
                                        <asp:BoundField DataField="PrecioVenta" HeaderText="Precio V" SortExpression="PrecioVenta" DataFormatString="{0:0.00}"  />
                                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" ItemStyle-Font-Bold="true" ItemStyle-BorderColor="LightGreen" />
                                         <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                                        <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
                                        <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda" />
                                        <asp:BoundField DataField="ID_Existencia" HeaderText="ID1" SortExpression="ID_Existencia" InsertVisible="False" ReadOnly="True" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="" CssClass="btn btn-danger fa fa-cart-plus" CommandName="Select" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                        </asp:GridView>
                    </div>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                    </div>
                </div>
                 
            </div>
        </div>

 <%--  <asp:BoundField DataField="ID_Producto" HeaderText="ID" ReadOnly="True" SortExpression="ID_Producto" InsertVisible="False" />
                                        <asp:BoundField DataField="LISTAOEM" HeaderText="LISTA OEM" SortExpression="LISTAOEM" ReadOnly="True" />
                                        <asp:BoundField DataField="LISTACODP" HeaderText="LISTA CODP" SortExpression="LISTACODP" ReadOnly="True" />
                                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                        <asp:BoundField DataField="LISTANIOP" HeaderText="Rubro-Año" SortExpression="LISTANIOP" ReadOnly="True" />
                                        <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" ReadOnly="True" />
                                        <asp:BoundField DataField="MarcaP" HeaderText="Marca Prod" SortExpression="MarcaP" />
                                        <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio C" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}"  />
                                        <asp:BoundField DataField="PrecioVenta" HeaderText="Precio V" SortExpression="PrecioVenta" DataFormatString="{0:0.00}"  />
                                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" ItemStyle-Font-Bold="true" ItemStyle-BorderColor="LightGreen" />
                                         <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                                        <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
                                        <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda" />
                                        <asp:BoundField DataField="ID_Existencia" HeaderText="ID2" SortExpression="ID_Existencia" InsertVisible="False" ReadOnly="True" />--%>




         <div class="row">
             <div class="col-sm-2">
            <div class="form-group">
            <label>Codigo</label>
            <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
            </div>  
         </div>
         <div class="col-sm-4">
            <div class="form-group">
            <label>Producto</label>
            <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
            </div>  
        </div>
         <div class="col-sm-2">
             <div class="form-group">
            <label>Motivo</label>
            <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server"></asp:TextBox>
            </div> 
        </div>
         <div class="col-sm-2">
             <div class="form-group">
            <label>Cantidad</label>
            <asp:TextBox ID="TextBox11" CssClass="form-control" runat="server"></asp:TextBox>
            </div> 
        </div>
              <div class="col-sm-2">
             <div class="form-group">
            <label>Aceptar</label>
                 <asp:Button ID="Button2" runat="server"  CssClass="form-control btn-success" Text="Agregar" OnClick="Button2_Click" />
            </div> 
        </div>
        </div>
        <div class="table table-responsive">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
        </div>   

        <asp:Button ID="Button3" runat="server" CssClass="btn btn-success pull-right" Text="Guardar" OnClick="Button3_Click" />

         <div class="row">
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" DeleteCommand="EliminarDevProPro" SelectCommand="SELECT DevProPro.Factura,  Producto.Descripcion, DevProPro.Cantidad, Proveedor.Proveedor, DevProPro.Motivo, DevProPro.ID_DevProPro FROM DevProPro INNER JOIN Producto ON DevProPro.ID_Producto = Producto.ID_Producto INNER JOIN Proveedor ON DevProPro.ID_Proveedor = Proveedor.ID_Proveedor WHERE (DevProPro.Estado = 1)" DeleteCommandType="StoredProcedure">
                 <DeleteParameters>
                     <asp:Parameter Name="ID_DevProPro"/>
                 </DeleteParameters>
             </asp:SqlDataSource>
        </div>

    </div>

    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>

    <div>
        <h3>Listado de productos pendiente de devolver al proveedor.</h3>
    </div>



    <asp:GridView ID="GridView3" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="ID_DevProPro" HeaderText="ID Dev" ReadOnly="True" SortExpression="ID_DevProPro" InsertVisible="False" />
            <asp:BoundField DataField="Factura" HeaderText="Factura" SortExpression="Factura" />
            <asp:BoundField DataField="Motivo" HeaderText="Motivo" SortExpression="Motivo" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True" SortExpression="Descripcion" />
            <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor" />
            <asp:BoundField DataField="ID_Existencia" HeaderText="ID_Existencia" SortExpression="ID_Existencia" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="ID_Proveedor" HeaderText="ID_Proveedor" ReadOnly="True" InsertVisible="False" SortExpression="ID_Proveedor"></asp:BoundField>


            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Entregar" CommandName="Select" CausesValidation="False" ID="LinkButton1" OnClientClick="return confirm('Desea realizar la entrega del producto al provedor');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>"
        SelectCommand="SELECT DevProPro.ID_DevProPro, DevProPro.Factura, DevProPro.Motivo, DevProPro.Cantidad, Producto.Descripcion + ' ~ '+MarcaProd.MarcaP AS Descripcion, Proveedor.Proveedor, Stock.ID_Existencia, Proveedor.ID_Proveedor FROM DevProPro INNER JOIN Proveedor ON DevProPro.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN Stock ON DevProPro.ID_Existencia = Stock.ID_Existencia inner join Producto on Producto.ID_Producto = Stock.ID_Producto inner join MarcaProd on Stock.ID_MaraProd = MarcaProd.ID_MaraProd WHERE (DevProPro.Estado = 1)" UpdateCommand="EliminarProPro" UpdateCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:Parameter Name="ID_DevProPro" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Cantidad" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID_Existencia" Type="Int32"></asp:Parameter>
        </UpdateParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' InsertCommand="INSERT INTO DevPro2(ID_Existencia, ID_Proveedor, Motivo, Estado, Factura, Cantidad) VALUES (@ID_Existencia, @ID_Proveedor, @Motivo, 0, @Factura, @Cantidad)" SelectCommand="SELECT DevPro2.* FROM DevPro2">
        <InsertParameters>
            <asp:Parameter Name="ID_Existencia" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID_Proveedor" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Motivo" Type="String"></asp:Parameter>
            <asp:Parameter Name="Factura" Type="String"></asp:Parameter>
            <asp:Parameter Name="Cantidad" Type="Int32"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
