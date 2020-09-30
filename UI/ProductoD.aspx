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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" DataSourceID="SqlDataSource1"  CssClass="table table-bordered table-hover" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True" HorizontalAlign="Justify" PageSize="50">
                <Columns>
                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID_Producto">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_Producto") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_Producto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Producto" SortExpression="Producto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Producto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Producto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripcion" SortExpression="Descripcion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OEM" SortExpression="LISTAOEM">
                        <EditItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("LISTAOEM") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("LISTAOEM") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Codigos" SortExpression="LISTACODP">
                        <EditItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("LISTACODP") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("LISTACODP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Año-Rubro" SortExpression="LISTANIOP">
                        <EditItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("LISTANIOP") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("LISTANIOP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria" SortExpression="Categoria">
                        <EditItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Categoria") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Categoria") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" OnClick="LinkButton1_Click"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"></asp:LinkButton>
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
								<h5 class="modal-title" id="">Editar datos de producto  </h5>
                                <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="container-fluid">

                                      <div class="row">
                       <div class="col-sm-4">
                            <label> Codigos (OEM) producto</label>
			    	      
                      <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
                        <div class="col-sm-4">
                            <label>Marca de automovil</label>
                            <div class="input-group">
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource12" DataTextField="Marca" DataValueField="ID_Marca"></asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca]"></asp:SqlDataSource>
                                 <div class="input-group-btn">
                                   <button type="button" class="btn btn-danger" onserverclick="Btn_AgergarOEM2" runat="server" >Action</button>
                              </div>
                            </div>
                        </div>
                       <div class="col-lg-4">
                           <asp:GridView ID="GridView5" CssClass="table table-responsive table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource20" CellPadding="4" ForeColor="#333333" GridLines="None">
                               <AlternatingRowStyle BackColor="White" />
                               <Columns>
                                   <asp:BoundField DataField="ID_OEM" HeaderText="ID_OEM" InsertVisible="False" ReadOnly="True" SortExpression="ID_OEM" />
                                   <asp:BoundField DataField="OEM" HeaderText="OEM" SortExpression="OEM" />
                                   <asp:BoundField DataField="ID_Marca" HeaderText="ID_Marca" InsertVisible="False" ReadOnly="True" SortExpression="ID_Marca" />
                                   <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                               </Columns>
                               <EditRowStyle BackColor="#2461BF" />
                               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                               <RowStyle BackColor="#EFF3FB" />
                               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                               <SortedAscendingCellStyle BackColor="#F5F7FB" />
                               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                               <SortedDescendingCellStyle BackColor="#E9EBEF" />
                               <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="">
                           </asp:SqlDataSource>
                           <asp:GridView ID="GridView8" CssClass="table table-responsive table-striped" Visible="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                               <AlternatingRowStyle BackColor="White" />
                               <EditRowStyle BackColor="#2461BF" />
                               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                               <RowStyle BackColor="#EFF3FB" />
                               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                               <SortedAscendingCellStyle BackColor="#F5F7FB" />
                               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                               <SortedDescendingCellStyle BackColor="#E9EBEF" />
                               <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           </asp:GridView>
                       </div>

                   </div>
        
                   
                     <br />

                   
                     
                         <div class="row">
                             <div class="col-sm-4">
                                 <label>Codigos de las marcas</label>  
                                   <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                             </div>
                             <div class="col-sm-4">
                                 <label>Marca del codigo</label>
                                 <div class="input-group">
                                     <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource13" DataTextField="MarcaP" DataValueField="ID_MaraProd"></asp:DropDownList>                        
                                       <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_MaraProd], [MarcaP] FROM [MarcaProd]"></asp:SqlDataSource>
                                       <div class="input-group-btn">
                                     <button type="button" class="btn btn-danger" onserverclick="Btn_AgergarCodigosP" runat="server">Action</button>
                                  </div>
                                 </div>
                             </div>
                             <div class="col-sm-4">
                                 <asp:GridView ID="GridView6" CssClass="table table-condensed table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource21" CellPadding="4" ForeColor="#333333" GridLines="None">
                                     <AlternatingRowStyle BackColor="White" />
                                     <Columns>
                                         <asp:BoundField DataField="ID_CodigoProducto" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_CodigoProducto" />
                                         <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                                         <asp:BoundField DataField="ID_MaraProd" HeaderText="ID Marca" InsertVisible="False" ReadOnly="True" SortExpression="ID_MaraProd" />
                                         <asp:BoundField DataField="MarcaP" HeaderText="Marca P" SortExpression="MarcaP" />
                                     </Columns>
                                     <EditRowStyle BackColor="#2461BF" />
                                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                     <RowStyle BackColor="#EFF3FB" />
                                     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                     <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                     <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                     <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                     <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                 </asp:GridView>
                                 <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                                 <asp:GridView ID="GridView9"  CssClass="table table-condensed table-responsive" Visible="False"  runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                     <AlternatingRowStyle BackColor="White" />
                                     <EditRowStyle BackColor="#2461BF" />
                                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                     <RowStyle BackColor="#EFF3FB" />
                                     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                     <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                     <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                     <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                     <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                 </asp:GridView>
                                     </div>
                         </div>
                      
                     
                                    <br />
                    <div class="form-group">
                        <label>Producto (formas en que lo buscaran)</label>            
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Descripcion (Es lo que se mostrara en venta)</label>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>

                    </div>
                     <div>

                           <div class="row">
                <div class="col-xs-2">
                    <h5>Marca</h5>
                       <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY Marca ASC"></asp:SqlDataSource>
                  
                </div>
                <div class="col-xs-2">
                    <h5>Modelo</h5>
                          <asp:DropDownList ID="DropDownList8" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged"></asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @ID_Marca) ORDER BY Modelo ASC">
                        <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList3" Name="ID_Marca" PropertyName="SelectedValue" />
                          </SelectParameters>
                          </asp:SqlDataSource> 
                </div>
                <div class="col-xs-2">
                    <h5>Rubro</h5>
                  <asp:DropDownList ID="DropDownList10" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="Rubro" DataValueField="ID_Rubro"></asp:DropDownList>
                           <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @ID_Modelo) ORDER BY Rubro ASC">
                        <SelectParameters>
                          <asp:ControlParameter ControlID="DropDownList5" Name="ID_Modelo" PropertyName="SelectedValue" />
                      </SelectParameters>
                     </asp:SqlDataSource>
                </div>
                <div class="col-xs-2">
                     <h5>Año inicial</h5>
                     <asp:DropDownList ID="DropDownList15" CssClass="form-control" runat="server" DataSourceID="SqlDataSource10" DataTextField="Anio" DataValueField="ID_Anio"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Anio, Anio FROM Anio ORDER BY Anio ASC"></asp:SqlDataSource>
                      
                </div>
                <div class="col-xs-2">
                    <h5>Año final</h5>
                      <asp:DropDownList ID="DropDownList16" CssClass="form-control" runat="server" DataSourceID="SqlDataSource10" DataTextField="Anio" DataValueField="ID_Anio"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Anio, Anio FROM Anio ORDER BY Anio ASC"></asp:SqlDataSource>
                </div>
                 <div class="col-xs-2">
                    <h5>Agregar</h5>
                      <div class="input-group-btn">
                             <button type="button" runat="server" onserverclick="Btn_AgergarAnioRP"  class="btn btn-danger">Agregar</button>
                         </div>
                 </div>
              </div>
                         <asp:GridView ID="GridView7" CssClass="table table-striped table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Rubro" DataSourceID="SqlDataSource22" CellPadding="4" ForeColor="#333333" GridLines="None">
                             <AlternatingRowStyle BackColor="White" />
                             <Columns>
                                <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                                 <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                                 <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                                <asp:BoundField DataField="ID_Rubro" HeaderText="ID_Rubro" InsertVisible="False" ReadOnly="True" SortExpression="ID_Rubro" /> 
                                  <asp:BoundField DataField="AnioInicio" HeaderText="Anio Inicio" SortExpression="AnioInicio" />
                                 <asp:BoundField DataField="AnioFinal" HeaderText="Anio Final" SortExpression="AnioFinal" />
                             </Columns>
                             <EditRowStyle BackColor="#2461BF" />
                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                             <RowStyle BackColor="#EFF3FB" />
                             <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                             <SortedAscendingCellStyle BackColor="#F5F7FB" />
                             <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                             <SortedDescendingCellStyle BackColor="#E9EBEF" />
                             <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                         <asp:GridView ID="GridView10" runat="server" Visible="False" CssClass="table table-striped table-responsive" CellPadding="4" ForeColor="#333333" GridLines="None">
                             <AlternatingRowStyle BackColor="White" />
                             <EditRowStyle BackColor="#2461BF" />
                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                             <RowStyle BackColor="#EFF3FB" />
                             <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                             <SortedAscendingCellStyle BackColor="#F5F7FB" />
                             <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                             <SortedDescendingCellStyle BackColor="#E9EBEF" />
                             <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           </asp:GridView>
                          </div>
                      <div class="row">
                          <div class="form-group">
                          <div class="col-xs-6"> 
                              <label>Categoria</label>
                          <asp:DropDownList ID="DropDownList17" CssClass="form-control" runat="server" DataSourceID="SqlDataSource14" DataTextField="Categoria" DataValueField="ID_Categoria"></asp:DropDownList>

                              <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Categoria], [Categoria] FROM [Categoria]"></asp:SqlDataSource>

                          </div>
                           <div class="col-xs-6">
                               <label>SubCategoria</label>
                               <asp:DropDownList ID="DropDownList18" CssClass="form-control" runat="server" DataSourceID="SqlDataSource15" DataTextField="SubCategoria" DataValueField="ID_SubCategoria"></asp:DropDownList>

                               <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_SubCategoria], [SubCategoria] FROM [SubCategoria] WHERE (([Estado] = @Estado) AND ([ID_Categoria] = @ID_Categoria))">
                                   <SelectParameters>
                                       <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                                       <asp:ControlParameter ControlID="DropDownList13" Name="ID_Categoria" PropertyName="SelectedValue" Type="Int32" />
                                   </SelectParameters>
                               </asp:SqlDataSource>

                           </div>
                         </div>
                          
                      </div>
                  
                    
                    
                    <div class="form-group">
                        <label>Imagen</label>

                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                    </div>
                   
                        
        
                       
								
								
							</div>

							<div class="modal-footer"> 
                               <asp:Button ID="Button3" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button3_Click" />
                    
								<button id="Cerrar2" class="btn btn-default" data-dismiss="modal">Cerrar</button>
							</div>
						</div>
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
                       <div class="col-sm-4">
                            <label> Codigos (OEM) producto</label>
			    	      
                      <asp:TextBox ID="codigo2" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
                        <div class="col-sm-4">
                            <label>Marca de automovil</label>
                            <div class="input-group">
                                <asp:DropDownList ID="DropDownList11" CssClass="form-control" runat="server" DataSourceID="SqlDataSource12" DataTextField="Marca" DataValueField="ID_Marca"></asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca]"></asp:SqlDataSource>
                                 <div class="input-group-btn">
                                   <button type="button" class="btn btn-danger" runat="server" onserverclick ="Btn_AgergarOEM">Action</button>
                              </div>
                            </div>
                        </div>
                       <div class="col-lg-4">
                           <asp:GridView ID="GridView3" CssClass="table table-responsive table-striped" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                               <AlternatingRowStyle BackColor="White" />
                               <EditRowStyle BackColor="#2461BF" />
                               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                               <RowStyle BackColor="#EFF3FB" />
                               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                               <SortedAscendingCellStyle BackColor="#F5F7FB" />
                               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                               <SortedDescendingCellStyle BackColor="#E9EBEF" />
                               <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           </asp:GridView>
                       </div>

                   </div>
        
                   
                     <br />

                   
                     
                         <div class="row">
                             <div class="col-sm-4">
                                 <label>Codigos de las marcas</label>  
                                   <asp:TextBox ID="Equival" runat="server" CssClass="form-control"></asp:TextBox>
                             </div>
                             <div class="col-sm-4">
                                 <label>Marca del codigo</label>
                                 <div class="input-group">
                                     <asp:DropDownList ID="DropDownList12" CssClass="form-control" runat="server" DataSourceID="SqlDataSource13" DataTextField="MarcaP" DataValueField="ID_MaraProd"></asp:DropDownList>                        
                                       <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_MaraProd], [MarcaP] FROM [MarcaProd]"></asp:SqlDataSource>
                                       <div class="input-group-btn">
                                     <button type="button" class="btn btn-danger" runat="server" onserverclick="Btn_AgergarCodigo">Action</button>
                                  </div>
                                 </div>
                             </div>
                             <div class="col-sm-4">
                                 <asp:GridView ID="GridView2" CssClass="table table-condensed table-responsive" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                     <AlternatingRowStyle BackColor="White" />
                                     <EditRowStyle BackColor="#2461BF" />
                                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                     <RowStyle BackColor="#EFF3FB" />
                                     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                     <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                     <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                     <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                     <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                 </asp:GridView>
                             </div>
                         </div>
                      
                     
                                    <br />
                    <div class="form-group">
                        <label>Producto (formas en que lo buscaran)</label>            
                        <asp:TextBox ID="producto2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Descripcion (Es lo que se mostrara en venta)</label>
                        <asp:TextBox ID="descripcion2" runat="server" CssClass="form-control"></asp:TextBox>

                    </div>
                     <div>

                           <div class="row">
                <div class="col-xs-2">
                    <h5>Marca</h5>
                       <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY Marca ASC"></asp:SqlDataSource>
                  
                </div>
                <div class="col-xs-2">
                    <h5>Modelo</h5>
                          <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged"></asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @ID_Marca) ORDER BY Modelo ASC">
                        <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList3" Name="ID_Marca" PropertyName="SelectedValue" />
                          </SelectParameters>
                          </asp:SqlDataSource> 
                </div>
                <div class="col-xs-2">
                    <h5>Rubro</h5>
                  <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="Rubro" DataValueField="ID_Rubro"></asp:DropDownList>
                           <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @ID_Modelo) ORDER BY Rubro ASC">
                        <SelectParameters>
                          <asp:ControlParameter ControlID="DropDownList5" Name="ID_Modelo" PropertyName="SelectedValue" />
                      </SelectParameters>
                     </asp:SqlDataSource>
                </div>
                <div class="col-xs-2">
                     <h5>Año inicial</h5>
                     <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server" DataSourceID="SqlDataSource10" DataTextField="Anio" DataValueField="ID_Anio"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Anio, Anio FROM Anio ORDER BY Anio ASC"></asp:SqlDataSource>
                      
                </div>
                <div class="col-xs-2">
                    <h5>Año final</h5>
                      <asp:DropDownList ID="DropDownList9" CssClass="form-control" runat="server" DataSourceID="SqlDataSource10" DataTextField="Anio" DataValueField="ID_Anio"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Anio, Anio FROM Anio ORDER BY Anio ASC"></asp:SqlDataSource>
                </div>
                 <div class="col-xs-2">
                    <h5>Agregar</h5>
                      <div class="input-group-btn">
                             <button type="button" runat="server" onserverclick="Btn_RubroAnios" class="btn btn-danger">Agregar</button>
                         </div>
                 </div>
              </div>
                         <asp:GridView ID="GridView4" CssClass="table table-striped table-responsive" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                             <AlternatingRowStyle BackColor="White" />
                             <EditRowStyle BackColor="#2461BF" />
                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                             <RowStyle BackColor="#EFF3FB" />
                             <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                             <SortedAscendingCellStyle BackColor="#F5F7FB" />
                             <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                             <SortedDescendingCellStyle BackColor="#E9EBEF" />
                             <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           </asp:GridView>
                     </div>
                      <div class="row">
                          <div class="form-group">
                          <div class="col-xs-6"> 
                              <label>Categoria</label>
                          <asp:DropDownList ID="DropDownList13" CssClass="form-control" runat="server" DataSourceID="SqlDataSource14" DataTextField="Categoria" DataValueField="ID_Categoria"></asp:DropDownList>

                              <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Categoria], [Categoria] FROM [Categoria]"></asp:SqlDataSource>

                          </div>
                           <div class="col-xs-6">
                               <label>SubCategoria</label>
                               <asp:DropDownList ID="DropDownList14" CssClass="form-control" runat="server" DataSourceID="SqlDataSource15" DataTextField="SubCategoria" DataValueField="ID_SubCategoria"></asp:DropDownList>

                               <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_SubCategoria], [SubCategoria] FROM [SubCategoria] WHERE (([Estado] = @Estado) AND ([ID_Categoria] = @ID_Categoria))">
                                   <SelectParameters>
                                       <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                                       <asp:ControlParameter ControlID="DropDownList13" Name="ID_Categoria" PropertyName="SelectedValue" Type="Int32" />
                                   </SelectParameters>
                               </asp:SqlDataSource>

                           </div>
                         </div>
                          
                      </div>
                  
                    
                    
                    <div class="form-group">
                        <label>Imagen</label>

                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
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
