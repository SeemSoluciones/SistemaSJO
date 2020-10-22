<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Exportacion.aspx.cs" Inherits="UI.Exportacion" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .fondo{
            background-color: black;
            filter: opha(opacity= 90);
            opacity: 0.8;
            z-index: 10000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
       <div class="box-header">

       </div>
       <div class="box-body">
            <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
             <label class="label label-default">Exportar de:</label>
             <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-lg"></asp:TextBox>
            </div>
            </div>
                <div class="col-lg-6">
           <div class="form-group">
             <label class="label label-default">A:</label>
               <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="form-control select2" style="width: 100%;"  DataSourceID="SqlDataSource3" DataTextField="Tienda" DataValueField="ID_Tienda"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Tienda], [Tienda] FROM [Tienda] WHERE ([Estado] = @Estado)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
                </div>
            </div>
            <div class="row">
            <div class="col-md-12">
                <div class="box box-info collapsed-box">
                    <div class="box-header with-border">
                       <div class="row">
                                <div class="col-sm-2">
                                  <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True"></asp:DropDownList> 
                                 <%--  <asp:CheckBox ID="CheckBox3" runat="server" />Por marca--%>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY Marca ASC"></asp:SqlDataSource>
                                </div>
                                <div class="col-sm-2">
                                    <asp:DropDownList ID="DropDownList5" CssClass="form-control"  runat="server" DataSourceID="SqlDataSource6" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True"></asp:DropDownList>
                                 <%-- <asp:CheckBox ID="CheckBox4" runat="server" />Por modelo/linea --%>
                                    <asp:SqlDataSource ID="SqlDataSource6"  runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @idMarca) ORDER BY Modelo Asc">
                                     <SelectParameters>
                                     <asp:ControlParameter ControlID="DropDownList2" Name="idMarca" PropertyName="SelectedValue" />
                                     </SelectParameters>
                                     </asp:SqlDataSource>
                                </div>
                                <div class="col-sm-1">
                                     <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Rubro" DataValueField="ID_Rubro"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @idModelo) ORDER BY Rubro">
                                     <SelectParameters>
                                      <asp:ControlParameter ControlID="DropDownList5" Name="idModelo" PropertyName="SelectedValue" />
                                      </SelectParameters>
                                      </asp:SqlDataSource>
                                </div>
                                <div class="col-sm-1">
                                     <asp:DropDownList CssClass="form-control select2" ID="DropDownList7" runat="server" DataSourceID="SqlDataSource8" DataTextField="Anio" DataValueField="ID_Anio"></asp:DropDownList>
                                    <asp:CheckBox ID="CheckBox2" runat="server" /> Por año.
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Anio], [Anio] FROM [Anio] ORDER BY Anio ASC "></asp:SqlDataSource>
     
                                </div>
                           <div class="col-xs-2">
                               <asp:DropDownList ID="DropDownList4" CssClass="form-control select2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Categoria" DataValueField="ID_SubCategoria" AutoPostBack="true" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged"></asp:DropDownList>
                               <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT SubCategoria.ID_SubCategoria, Categoria.Categoria + '  ' + SubCategoria.SubCategoria AS Categoria FROM Categoria INNER JOIN SubCategoria ON Categoria.ID_Categoria = SubCategoria.ID_Categoria"></asp:SqlDataSource>
                           </div>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="TextBox20" CssClass="form-control" runat="server"></asp:TextBox>
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
                                <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive-lg table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
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
                                        <asp:BoundField DataField="ID_Existencia" HeaderText="ID2" SortExpression="ID_Existencia" InsertVisible="False" ReadOnly="True" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="" CssClass="fa fa-cart-plus" CommandName="Select" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                        </asp:GridView>
                    </div>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                    </div>
                </div>
                 
            </div>
        </div>
           
            <br />
           <asp:Label ID="Label5" runat="server" Text="" CssClass="label label-success" Font-Size="Larger"></asp:Label>
            <br />
           
       </div>
   </div>


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Button ID="Button1" runat="server" Text="Button" style="display:None" />

    <cc1:ModalPopupExtender ID="Button1_ModalPopupExtender" runat="server" BackgroundCssClass="fondo" CancelControlID="Cerrar"  Enabled="True" TargetControlID="Button1" PopupControlID="Panel1">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="Panel1" runat="server">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Exportacion de producto.</h5>
                <button  data-dismiss="modal" class="close" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                <div class="form-group">
                    <label>Actualmente existe: </label> 
                    <asp:Label ID="Label1" runat="server" Text="" CssClass="form-control label label-info" Font-Size="Medium"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Ingrese la cantidad que desea exportar:</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                    <div class="form-group">
                    <label>Para la tienda </label> 
                    <asp:Label ID="Label2" runat="server" Text="" CssClass="form-control label label-warning" Font-Size="Medium"></asp:Label>
                </div>
                  </div>
            </div>
            </div>
            <div class="modal-footer">
                   <asp:Button ID="Button3" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button3_Click"/>
				<button id="Cerrar" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            
            </div>
        </div>
    </asp:Panel>

    <asp:Button ID="Button10" runat="server" Text="Button" Style ="display:none" />

    <cc1:ModalPopupExtender ID="Button10_ModalPopupExtender" runat="server"  Enabled="True" 
        TargetControlID="Button10" PopupControlID="Panel2" CancelControlID="Cerrar2" BackgroundCssClass="fondo">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="Panel2" runat="server">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Exportacion de producto.</h5>
                <button  data-dismiss="modal" class="close" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                             <div class="form-group">
                    <label>Actualmente existe: </label> 
                    <asp:Label ID="Label3" runat="server" Text="" CssClass="form-control label label-info" Font-Size="Medium"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Ingrese la cantidad que desea exportar:</label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                    <div class="form-group">
                    <label>Para la tienda </label> 
                    <asp:Label ID="Label4" runat="server" Text="" CssClass="form-control label label-warning" Font-Size="Medium"></asp:Label>
                </div>
                        </div>
                        <div class="col-md-6">

                        <div class="form-group">
                            <label>Precio producto </label>
                            <asp:TextBox ID="precioProd"  CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Precio producto para venta</label>
                            <asp:TextBox ID="precioVenta" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    <div class="form-group">
                        <label>Stock minimo</label>
                        <asp:TextBox ID="cantidadMinima" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Ubicación</label>
                        <asp:TextBox ID="ubicacion" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
       
                        <div class="form-group">
                            <label>Medida</label>
                            <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Medida" DataValueField="ID_Medida"></asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Medida], [Medida] FROM [Medida]"></asp:SqlDataSource>
                        </div>
                        </div>
                    </div>
                    </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                   <asp:Button ID="Button2" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button2_Click"/>
				<button id="Cerrar2" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            
            </div>
    </asp:Panel>

</asp:Content>
