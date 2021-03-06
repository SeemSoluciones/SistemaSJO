﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Caja.aspx.cs" Inherits="UI.Caja" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <style type="text/css">
        .fondo{
            background-color:black;
            filter:apha(opacity=90);
            opacity:0.8;
            z-index:10000;
        }
    </style>

    <div class="content-head">

  </div>
    <div class="content">
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
                               <asp:DropDownList ID="DropDownList3" CssClass="form-control select2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Categoria" DataValueField="ID_SubCategoria" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AppendDataBoundItems="true">
                                   <asp:ListItem Value="0">Seleccione uno...</asp:ListItem>
                               </asp:DropDownList>
                               <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT SubCategoria.ID_SubCategoria, Categoria.Categoria + '  ' + SubCategoria.SubCategoria AS Categoria FROM Categoria INNER JOIN SubCategoria ON Categoria.ID_Categoria = SubCategoria.ID_Categoria ORDER BY Categoria.Categoria"></asp:SqlDataSource>
                           </div>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="TextBox20" CssClass="form-control" runat="server"></asp:TextBox>
                                      <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" />Desmarcar para solo codigo
                                </div>
                                <div class="col-sm-1">
                                    <asp:Button ID="Button9" CssClass="btn btn-default form-control" runat="server" Text="Buscar" OnClick="Button9_Click" />
                                </div>
                        
                                <div class="col-sm-1">
                               <button type="button" class="btn btn-social-icon btn-warning" runat="server" id="btnBuscar" onserverclick="btnBuscar_Click"><i class="fa fa-search"></i> </button>
                              
                              <button type="button" class="btn btn-social-icon btn-success" data-widget="collapse"><i class="fa fa-plus-square"></i> </button>
                               </div>
                            </div>
                    </div>
                    <div class="box-body">
                      
                            <div class="table table-responsive">
                                <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive-lg table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowDataBound="GridView2_RowDataBound">
                                    <Columns>
                                        
                                      
                                        <asp:BoundField DataField="LISTAOEM" HeaderText="LISTA OEM" SortExpression="LISTAOEM" ReadOnly="True" />
                                        <asp:BoundField DataField="LISTACODP" HeaderText="LISTA CODP" SortExpression="LISTACODP" ReadOnly="True" />
                                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                        <asp:BoundField DataField="LISTANIOP" HeaderText="Rubro-Año" SortExpression="LISTANIOP" ReadOnly="True" />
                                        <asp:BoundField DataField="MarcaP" HeaderText="Marca Prod" SortExpression="MarcaP" />
                                        <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio C" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}"  />
                                        <asp:BoundField DataField="PrecioVenta" HeaderText="Precio V" SortExpression="PrecioVenta" DataFormatString="{0:0.00}"  />
                                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Large" ItemStyle-BorderColor="LightGreen" />
                                         <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                                        <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
                                        <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda" />
                                        <asp:BoundField DataField="ID_Existencia" HeaderText="ID1" SortExpression="ID_Existencia" InsertVisible="False" ReadOnly="True" />
                                         <asp:BoundField DataField="Pendiente" HeaderText="NO Vender" SortExpression="Pendiente" ItemStyle-Font-Size="Large" />
                                       <asp:HyperLinkField DataNavigateUrlFields="ID_Producto" DataNavigateUrlFormatString="Details.aspx?id={0}" Text="Ver" Target="_blank" HeaderText="Foto"></asp:HyperLinkField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="" CssClass="btn btn-success fa fa-cart-plus" CommandName="Select" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                    </Columns>
                        </asp:GridView>
                    </div>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                    </div>
                </div>
                 
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4">
                <div class="form-group">
                    <label>Listado de cotizaciones</label>
                    <asp:DropDownList ID="DropDownList8" CssClass="form-control select2-container" runat="server" DataSourceID="SqlDataSource9" DataTextField="Nombre" DataValueField="ID_Cotizacion" AutoPostBack="True" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged" AppendDataBoundItems="true" >
                        <asp:ListItem Value="00">Elija una opcion...</asp:ListItem>
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="Select ID_Cotizacion, 'ID Cotizacion' + ': '+ CAST(ID_Cotizacion as nvarchar) + ' - ' + Nombre + ' = '  + (CASE WHEN ID_Empleado > 1 THEN 'En condicion' ELSE 'Libre' END) As Nombre FROM CotizacionVenta WHERE (Estado = 1)"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT Empleado.ID_Empleado, Empleado.Nombre + ' ' + Empleado.Apellidos AS Nombre FROM Empleado INNER JOIN CotizacionVenta ON Empleado.ID_Empleado = CotizacionVenta.ID_Empleado WHERE (CotizacionVenta.ID_Cotizacion = @ID_Cotizacion)">
                        <SelectParameters>
                            <asp:Parameter Name="ID_Cotizacion"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                      </div>
            </div>
                <div class="col-xs-4">
                    <div class="form-group">

                </div>
            </div>
                <div class="col-xs-4">
                    <div class="form-group">
                        <label>Enviar para asignar motorista.</label>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:DropDownList ID="DropDownList9" runat="server" BackColor="White" ForeColor="White" CssClass="form-control select2-dropdown" DataSourceID="SqlDataSource11" DataTextField="Nombre" DataValueField="ID_Empleado" Enabled="False" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">______________</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT Empleado.ID_Empleado, Empleado.Nombre + ' ' + Empleado.Apellidos AS Nombre FROM Empleado INNER JOIN Usuario ON Empleado.ID_Usuario = Usuario.ID_Usuario INNER JOIN Rol ON Usuario.ID_Rol = Rol.ID_Rol WHERE (Empleado.Estado = 1) AND (Empleado.ID_Tienda = @ID_Tienda) AND (Rol.Rol = 'Motorista' OR Rol.Rol = 'MOTORISTA')">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="IDtienda" Name="ID_Tienda"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
            </div>
        </div>
          <div class="row">
        <div class="col-md-4">            
            <div class="form-group">
            <label>Forma de pago</label>
                <asp:DropDownList ID="DropDownList4"  CssClass="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="Tipo" DataValueField="ID_TPago" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_TPago, Tipo FROM TipoPago WHERE (Estado = 1)"></asp:SqlDataSource>
            </div>
        </div>
         <div class="col-md-4">
             <div class="form-group">
            <label>Caja</label>
                 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Caja" DataValueField="ID_Caja"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Caja], [Caja] FROM [Caja] WHERE ([ID_Tienda] = @ID_Tienda)">
                     <SelectParameters>
                         <asp:Parameter Name="ID_Tienda" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
            </div> 
        </div>
         <div class="col-md-4">
              <div class="form-group">
            <label>Fecha</label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
            </div>  
        </div>
    </div>



        <div class="row">
             <div class="col-md-4">
            <div class="form-group">
            <label>Nit</label>
            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" OnTextChanged="TextBox3_TextChanged" AutoPostBack="true" Text="1"></asp:TextBox>
            </div>  
        </div>
         <div class="col-md-4">
            <div class="form-group">
            <label>Nombre</label>
            <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
            </div>  
        </div>
         <div class="col-md-4">
             <div class="form-group">
            <label>Dirección</label>
            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
            </div> 
        </div>
        </div>

         <div class="row">
             <div class="col-sm-2">
            <div class="form-group">
            <label>Codigo</label>
            <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
            </div>  
         </div>
         <div class="col-sm-2">
            <div class="form-group">
            <label>Producto</label>
            <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
            </div>  
        </div>
         <div class="col-sm-2">
             <div class="form-group">
            <label>Precio Venta</label>
            <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="TextBox9_TextChanged" ></asp:TextBox>
            </div> 
        </div>
              <div class="col-sm-2">
             <div class="form-group">
            <label>Descuento</label>
            <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server" OnTextChanged="TextBox10_TextChanged" AutoPostBack="True"></asp:TextBox>
                 <asp:Label ID="Label8" runat="server" Text="Label" Visible="False"></asp:Label>
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

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" OnRowDataBound="GridView1_RowDataBound" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="Button1" runat="server" CssClass="btn btn-danger fa fa-trash-o" CausesValidation="False" CommandName="Delete"  />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
        </div>
        
        <div class="row">
            <div class="col-md-6">

            </div>
            <div class="col-md-3">
                <label class="pull-right"></label>
            </div>
            <div class="col-md-3">
                 <div class="input-group input-group-sm">
                <input type="text" class="form-control" runat="server" id="TxtDescuento" enableviewstate="False" visible="false"/>
                    <span class="input-group-btn">
                        <asp:Button ID="Button11" runat="server" Text="Aplicar" CssClass="btn btn-info btn-flat" Visible="false" OnClick="Button11_Click"/>
                    </span>
              </div>
            </div>
        </div>
        <div class="row">
         <div class="col-md-6">
        </div>
         <div class="col-md-3">
            <div class="form-group">
            <label class="pull-right">Subtotal  </label>      </div>  
        </div>
         <div class="col-md-3">
             <div class="form-group">
                 <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" Font-Bold="True" Enabled="False"></asp:TextBox>
        </div>
          </div>
        </div>

        <div class="row">
         <div class="col-md-3">
               
        </div>
            <div class="col-md-3"> 
               
              
            </div>
         <div class="col-md-3">
            <div class="form-group">
            <label class="pull-right">Descuento</label>
            </div>  
        </div>
         <div class="col-md-3">
             <div class="form-group">
                 <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control" Font-Bold="True" Enabled="False"></asp:TextBox>
        </div>
          </div>
        </div>

        <div class="row">
         <div class="col-md-6">
        </div>
         <div class="col-md-3">
            <div class="form-group">
            <label class="pull-right">Total</label>
            </div>  
        </div>
         <div class="col-md-3">
             <div class="form-group">
                 <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control" Font-Bold="True" Enabled="False"></asp:TextBox>
        </div>
          </div>
           
        </div>
        <div class="row">
         <div class="col-md-6">
        </div>
         <div class="col-md-3">
            <div class="form-group">
            <label runat="server" id="labelcheque" class="pull-right" visible="false">Cheque No.</label>
            </div>  
        </div>
         <div class="col-md-3">
             <div class="form-group">
                 <asp:TextBox ID="TextBox100" runat="server" CssClass="form-control" Font-Bold="True" Visible="false"></asp:TextBox>
        </div>
          </div>
             <asp:Label ID="Label6" runat="server" CssClass="label label-danger pull-right" Font-Size="Large"></asp:Label>
        </div>
        <div>
            <br />
            <br />
        </div>
        
               <asp:Button ID="Button1" runat="server" Text="Imprimir venta" CssClass="btn btn-info pull-right" OnClick="Button1_Click"/>
        <asp:Button ID="Button3" runat="server" CssClass="btn btn-success pull-right" Text="Cobrar Guardar" OnClick="Button3_Click" />

        <button id="botonCot" runat="server" class="btn btn-dark pull-right" onserverclick="btnCot_Click">Cotizacion</button>
        <asp:Button ID="Button10" runat="server" CssClass="btn btn-danger pull-right" Text="Nueva venta" OnClick="Button10_Click" />

    </div>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>



    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Button ID="Button4" runat="server" Text="Button" Style="display:none" />
    <cc1:ModalPopupExtender ID="Button4_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="Button4" PopupControlID="Panel1"
        BackgroundCssClass="fondo" >
    </cc1:ModalPopupExtender>
  
    <asp:Panel ID="Panel1" runat="server">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Crédito al cliente</h3>
                <asp:Label ID="Label7" runat="server"  CssClass="label label-danger" Text=""></asp:Label>
            </div>
            <div class="modal-body">
                <div class="col-12 col-sm-6">
                <div class="form-group">
                    <label>Crédito máximo</label>
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                    <div class="form-control">
                        <label>Total compra</label>
                        <asp:Label ID="Label2" runat="server" Text="0.0"></asp:Label>
                    </div>
                    </div>
                <div class="col-12 col-sm-6">
                <div class="form-group">
                    <label>Días máximo</label>
                    <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="" CssClass="label-warning"></asp:Label><br />
                        <asp:Label ID="Label5" runat="server" Text="" CssClass="label-info"></asp:Label>
                    </div>
            </div>
                </div>
            <div class="modal-footer">
                 <asp:Button ID="Button8" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button8_Click"/>
                 <asp:Button ID="Button5" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="Button5_Click" />
								<button id="Cerrar" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>

        </div>
    </asp:Panel>



   
    <asp:Button ID="Button6" runat="server" Text="Button"  style="display:None"  />
    <cc1:ModalPopupExtender ID="Button6_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="Button6"
        PopupControlID="Panel2"   BackgroundCssClass="fondo">
    </cc1:ModalPopupExtender>
    
    <asp:Panel ID="Panel2" runat="server" >
        <div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="">El cliente no existe! Registrar?</h5>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
            <div class="modal-body">
                     <div class="row">
                                <div class="col-12 col-sm-6">
                             <div class="form-group">
                            <label>NIT</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Nombres</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Apellidos</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox18" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                              </div>
                           <div class="col-12 col-sm-6">
                                    
                             <div class="form-group">
                            <label>Direccion</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtEdad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Telefono</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                               <asp:Label ID="Label3" runat="server" Text="Label" CssClass="label-danger"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Button7" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button7_Click" />
								<button class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
            </div>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="Select Producto.ID_Producto AS ID, Producto.Descripcion +' ~ Marca:'+ MarcaProd.MarcaP AS Descripcion, DetalleCotizacion.Precio, 0 AS Descuento,DetalleCotizacion.Cantidad, DetalleCotizacion.Total, Stock.ID_Existencia AS IDstock
From CotizacionVenta inner join DetalleCotizacion on CotizacionVenta.ID_Cotizacion = DetalleCotizacion.ID_Cotizacion inner join Stock on DetalleCotizacion.ID_Existencia = Stock.ID_Existencia inner join Producto on Stock.ID_Producto = Producto.ID_Producto inner join MarcaProd on MarcaProd.ID_MaraProd = Stock.ID_MaraProd
Where CotizacionVenta.ID_Cotizacion = @IDcotizacion AND CotizacionVenta.Estado = 1">
            <SelectParameters>
                <asp:Parameter Name="IDcotizacion"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" InsertCommand="INSERT INTO Cheque(NoCheque, Cantidad, ID_Venta, SiCobrado) VALUES (@NoCheque, @Cantidad, @ID_Venta, 0)" SelectCommand="SELECT ID_Cheque, NoCheque, SiCobrado, Cantidad, Banco, ID_Venta FROM Cheque">
            <InsertParameters>
                <asp:Parameter Name="NoCheque" />
                <asp:Parameter Name="Cantidad" />
                <asp:Parameter Name="ID_Venta" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT DevProPro.ID_DevProPro,  DevProPro.Cantidad,  Stock.ID_Existencia
FROM DevProPro INNER JOIN Proveedor ON DevProPro.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN 
Stock ON DevProPro.ID_Existencia = Stock.ID_Existencia inner join 
Producto on Producto.ID_Producto = Stock.ID_Producto inner join 
MarcaProd on Stock.ID_MaraProd = MarcaProd.ID_MaraProd 
WHERE (DevProPro.Estado = 1)	AND (Stock.ID_Existencia = @ID_Existencia)">
            <SelectParameters>
                <asp:Parameter Name="ID_Existencia"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <script type="text/javascript">
        $('input[type=text]').focus(function () {
            $(this).select();
        });
    </script>
   
</asp:Content>
