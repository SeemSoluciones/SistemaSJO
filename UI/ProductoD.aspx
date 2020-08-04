<%@ Page Title="" Language="C#" MasterPageFile="~/Digitador.Master" AutoEventWireup="true" CodeBehind="ProductoD.aspx.cs" Inherits="UI.ProductoD" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .fondo{
            background-color: black;
            filter: apha(opacity=90);
            opacity: 0.8;
            z-index: 10000;
        }
    </style>
    
     <section class="content-header">
        <h1 align="center">Producto</h1>
          
    </section>
    <section class="content">
     <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>
     <span class="input-group-btn">  <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button1_Click" />
         <a> <asp:Button ID="Button2" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="Button2_Click"/> </a>
     </span>
          </div>
        <div class="table table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource1"  CssClass="table table-bordered table-hover" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True" HorizontalAlign="Justify" PageSize="50">
                <Columns>
                    <asp:TemplateField HeaderText="Codigo" SortExpression="Codigo">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Codigo") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Codigo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Equivalencia" SortExpression="Codigo2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Codigo2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Codigo2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Producto" SortExpression="Producto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Producto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Producto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MarcaProd" SortExpression="MarcaP">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("MarcaP") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label18" runat="server" Text='<%# Bind("MarcaP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripcion" SortExpression="Descripcion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Proveedor" SortExpression="Proveedor">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Proveedor") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Proveedor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marca" SortExpression="Marca">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Marca") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Marca") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modelo" SortExpression="Modelo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Modelo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Modelo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rubro" SortExpression="Rubro">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Rubro") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Rubro") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="ID Rubro" SortExpression="ID_Rubro" Visible="false">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ID_Rubro") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ID_Rubro") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>        
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Editar" OnClick="LinkButton1_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick='return confirm("Desea Eliminar este Registro");' Text="Eliminar"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BorderStyle="Ridge" Font-Bold="True" Font-Size="XX-Large" />
                <HeaderStyle CssClass="danger" />
                <PagerSettings NextPageText="Siguente" Position="TopAndBottom" PreviousPageText="Anterior" />
                <PagerStyle CssClass="table-responsive" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="" DeleteCommand="EliminarProducto" DeleteCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="Codigo" Type="String" />
                </DeleteParameters>
            </asp:SqlDataSource>
            </div>
       
        <asp:Button ID="Button4" runat="server" Text="Button"  style="display:None" />
       
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       
         <cc1:ModalPopupExtender ID="Button4_ModalPopupExtender" runat="server"  Enabled="True" TargetControlID="Button4" PopupControlID="Panel1" 
              BackgroundCssClass="fondo"  CancelControlID="Cerrar2">
        </cc1:ModalPopupExtender>
        
        <asp:Panel ID="Panel1" runat="server">
            <div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="">Editar datos de producto</h5>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="container-fluid">
									<div class="row">
										<div class="col-12 col-sm-6">
			 	                        <div class="form-group">
                        <label>Codigo producto</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="codigo" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                     <div class="form-group">
                        <label>Equivalencia</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="Equival2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Producto</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="producto" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Marca</label>
                     <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                         <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                        </asp:DropDownList> 
                                  <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY Marca ASC"></asp:SqlDataSource>
                                </div>
                    <div class="form-group">
                     <label>Modelo</label>
                         <asp:DropDownList ID="DropDownList7" CssClass="form-control"  runat="server" DataSourceID="SqlDataSource8" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged1"></asp:DropDownList>
                                     <asp:SqlDataSource ID="SqlDataSource8"  runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @idMarca) ORDER BY Modelo ASC">
                                     <SelectParameters>
                                     <asp:ControlParameter ControlID="DropDownList1" Name="idMarca" PropertyName="SelectedValue" />
                                     </SelectParameters>
                                     </asp:SqlDataSource>
                    </div>
                       <div class="form-group">
                           <label>Rubro </label>
                          <asp:DropDownList ID="DropDownList8" CssClass="form-control" runat="server" DataSourceID="SqlDataSource9" DataTextField="Rubro" DataValueField="ID_Rubro"></asp:DropDownList>
                               <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @idModelo) ORDER BY Rubro ASC">
                                 <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList7" Name="idModelo" PropertyName="SelectedValue" />
                              </SelectParameters>
                            </asp:SqlDataSource>
                       </div>
                     </div>
                      	
									
										<div class="col-12 col-sm-6">
                     <div class="form-group">
                        <label>Proveedor</label>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Proveedor" DataValueField="ID_Proveedor"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Proveedor], [Proveedor] FROM [Proveedor] ORDER BY Proveedor ASC"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label>Imagen</label>
                    </div>
                    <div class="form-group">
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Descripcion</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="descripcion" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Marca produto</label>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="DropDownList10" CssClass="form-control" runat="server" DataSourceID="SqlDataSource11" DataTextField="MarcaP" DataValueField="ID_MaraProd"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_MaraProd], [MarcaP] FROM [MarcaProd] ORDER BY MarcaP ASC"></asp:SqlDataSource>
                    </div>
                              
              
							</div>
                               	</div>
					                </div>
								</div>
							</div>

							<div class="modal-footer"> 
                               <asp:Button ID="Button3" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button3_Click" />
                    
								<button id="Cerrar2" class="btn btn-default" data-dismiss="modal">Cerrar</button>
							</div>
						</div>

        </asp:Panel>
        <asp:Button ID="Button6" runat="server" Text="Button"  style="display:none"/>

        <cc1:ModalPopupExtender ID="Button6_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="Button6" PopupControlID="Panel2" 
              BackgroundCssClass="fondo"  CancelControlID="Cerrar2" >
        </cc1:ModalPopupExtender>

        <asp:Panel ID="Panel2" runat="server">
            <div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="">Nuevo producto</h5>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body">
								<div class="container-fluid">
									<div class="row">
										<div class="col-12 col-sm-6">
			 	<div class="form-group">
                        <label>Codigo producto</label>
                        <asp:TextBox ID="codigo2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class="form-group">
                        <label>Equivalencia</label>
 
                        <asp:TextBox ID="Equival" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Producto</label>
             
                        <asp:TextBox ID="producto2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                   
                     <div class="form-group">
                        <label>Marca</label>
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY Marca ASC"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                     <label>Modelo</label>
                                <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged"></asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @ID_Marca) ORDER BY Modelo ASC">
                        <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList3" Name="ID_Marca" PropertyName="SelectedValue" />
                          </SelectParameters>
                          </asp:SqlDataSource> 
                    </div>
                       <div class="form-group">
                           <label>Rubro </label>
                            <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="Rubro" DataValueField="ID_Rubro"></asp:DropDownList>
                           <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @ID_Modelo) ORDER BY Rubro ASC">
                        <SelectParameters>
                          <asp:ControlParameter ControlID="DropDownList5" Name="ID_Modelo" PropertyName="SelectedValue" />
                      </SelectParameters>
                     </asp:SqlDataSource>
                       </div>
                     <div class="form-group">
                        <label>Proveedor</label>
               
                        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Proveedor" DataValueField="ID_Proveedor"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Proveedor], [Proveedor] FROM [Proveedor] ORDER BY Proveedor ASC"></asp:SqlDataSource>                
                    </div>
                    <div class="form-group">
                        <label>Imagen</label>

                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                    </div>
                     <div class="form-group">
                        <label>Descripcion</label>
                        <asp:TextBox ID="descripcion2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                       
                      </div>				
				<div class="col-12 col-sm-6">
                    <div class="description-block border-right">
                        <div class="form-group">
                              <label>Seleccione el modelo</label>
                         <asp:DropDownList ID="DropDownList9" CssClass="form-control" runat="server" DataSourceID="SqlDataSource10" DataTextField="Anio" DataValueField="ID_Anio"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Anio, Anio FROM Anio ORDER BY Anio ASC"></asp:SqlDataSource>
                      </div>

                        <div class="form-group">
                            <label>Precio producto </label>
                            <asp:TextBox ID="precioProd"  CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Precio producto para venta</label>
                            <asp:TextBox ID="precioVenta" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                     <div class="form-group">
                        <label>Stock inicial</label>
                        <asp:TextBox ID="cantidad" runat="server" CssClass="form-control"></asp:TextBox>
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
                            <label>Marca producto</label>
                            <asp:DropDownList ID="DropDownList11" CssClass="form-control" runat="server" DataSourceID="SqlDataSource12" DataTextField="MarcaP" DataValueField="ID_MaraProd"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_MaraProd], [MarcaP] FROM [MarcaProd] ORDER BY MarcaP ASC"></asp:SqlDataSource>
                        </div>
                        <div class="form-group">
                            <label>Tipo de medicion</label>
                            <asp:DropDownList ID="DropDownList12" CssClass="form-control" runat="server" DataSourceID="SqlDataSource13" DataTextField="Medida" DataValueField="ID_Medida"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Medida], [Medida] FROM [Medida] ORDER BY Media ASC"></asp:SqlDataSource>
                        </div>
						</div>
                     </div>
					                </div>
								</div>
							</div>
                            </div>
							<div class="modal-footer"> 
                               <asp:Button ID="Button5" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button5_Click" />
								<button id="Cerrar" class="btn btn-default" data-dismiss="modal">Cerrar</button>
							</div>
						</div>

        </asp:Panel>


        <div class="modal fade" id="fm-modal-grid" tabindex="-1" role="dialog" aria-labelledby="fm-modal-grid" aria-hidden="true">

             
        </div>

        <asp:Label ID="Label10" runat="server" Text="Label" Visible="False"></asp:Label>

    </section>
</asp:Content>
