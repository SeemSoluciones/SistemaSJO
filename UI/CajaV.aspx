<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedor.Master" AutoEventWireup="true" CodeBehind="CajaV.aspx.cs" Inherits="UI.CajaV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        function detectar_tecla() {
            with (event) {
                if(keyCode==113)
                {
                 
                    $('#<%=Button12.ClientID%>').click();
                    return false;
                
                }
               
            }
        }
        document.onkeydown = detectar_tecla;
    </script>
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
                                  <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True"></asp:DropDownList>
                                    <asp:CheckBox ID="CheckBox3" runat="server" />Por marca 
                                  <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY Marca ASC"></asp:SqlDataSource>
                                </div>
                                <div class="col-sm-2">
                                    <asp:DropDownList ID="DropDownList5" CssClass="form-control"  runat="server" DataSourceID="SqlDataSource6" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True"></asp:DropDownList>
                                    <asp:CheckBox ID="CheckBox4" runat="server" />Por modelo/linea
                                     <asp:SqlDataSource ID="SqlDataSource6"  runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @idMarca) ORDER BY Modelo ASC">
                                     <SelectParameters>
                                     <asp:ControlParameter ControlID="DropDownList2" Name="idMarca" PropertyName="SelectedValue" />
                                     </SelectParameters>
                                     </asp:SqlDataSource>
                                </div>
                                <div class="col-sm-2">
                                     <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Rubro" DataValueField="ID_Rubro" AutoPostBack="True" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @idModelo) ORDER BY Rubro ASC">
                                     <SelectParameters>
                                      <asp:ControlParameter ControlID="DropDownList5" Name="idModelo" PropertyName="SelectedValue" />
                                      </SelectParameters>
                                      </asp:SqlDataSource>
                                </div>
                                <div class="col-sm-1">
                                     <asp:DropDownList CssClass="form-control select2" ID="DropDownList7" runat="server" DataSourceID="SqlDataSource8" DataTextField="Anio" DataValueField="ID_Anio" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:CheckBox ID="CheckBox2" runat="server" /> Por año.
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Anio], [Anio] FROM [Anio] ORDER BY Anio ASC"></asp:SqlDataSource>
     
                                </div>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="TextBox20" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-2">
                                    <asp:Button ID="Button9" CssClass="btn btn-default form-control" runat="server" Text="Buscar" OnClick="Button9_Click" />
                                </div>
                           <div class="col-sm-1">
                         <asp:Button ID="Button12" CssClass="btn btn-warning form-control" runat="server"  data-widget="collapse" Text="EXPANDIR"/>    
                           </div>
                            </div>
                         <!-- <div class="box-tools pull-right">
                            <a href="Productos.aspx" target="_blank" > Nuevo producto 
                        </div></a>-->
                    </div>
                    <div class="box-body">
                      
                            <div class="table table-responsive">
                        <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive-lg table-hover" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowDataBound="GridView2_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                                <asp:BoundField DataField="Codigo2" HeaderText="Equivalencia" SortExpression="Codigo2" />
                                <asp:BoundField DataField="Producto" HeaderText="Producto" SortExpression="Producto" />
                                <asp:BoundField DataField="Marcap" HeaderText="MarProd" SortExpression="MarcaP"/>
                                <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                                <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                                <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                                <asp:BoundField DataField="Anio" HeaderText="Anio" SortExpression="Anio" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cant" SortExpression="Cantidad" />
                                <asp:BoundField DataField="PrecioVenta" HeaderText="Precio V" SortExpression="PrecioVenta" DataFormatString="{0:0.00}" />
                                <asp:BoundField DataField="ID_Existencia" HeaderText="ID Stock" SortExpression="ID_Existencia" />
                                <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida"/>
                                <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda"/>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger fa fa-cart-plus" CausesValidation="False" CommandName="Select" Text=""></asp:LinkButton>
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
        <div class="col-md-4">            
            <div class="form-group">
            <label>Forma de pago</label>
                <asp:DropDownList ID="DropDownList4"  CssClass="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="Tipo" DataValueField="ID_TPago"></asp:DropDownList>
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
            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
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
            <label>Precio U</label>
            <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server"></asp:TextBox>
            </div> 
        </div>
              <div class="col-sm-2">
             <div class="form-group">
            <label>Descuento</label>
            <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server"></asp:TextBox>
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
                <asp:CommandField HeaderText="" ShowDeleteButton="True" ShowHeader="True" ButtonType="Button" DeleteImageUrl="~/Login/imagenes/Delete_48px.png" DeleteText="X" />
            </Columns>
            </asp:GridView>
        </div>
        
        <div class="row">
            <div class="col-md-6">

            </div>
            <div class="col-md-3">
                <label class="pull-right">Aplicar descuento en general</label>
            </div>
            <div class="col-md-3">
                 <div class="input-group input-group-sm">
                <input type="text" class="form-control" runat="server" id="TxtDescuento" enableviewstate="True"/>
                    <span class="input-group-btn">
                        <asp:Button ID="Button11" runat="server" Text="Aplicar" CssClass="btn btn-info btn-flat" OnClick="Button11_Click"/>
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
            <asp:Label ID="Label6" runat="server" CssClass="label label-danger pull-right" Font-Size="Large"></asp:Label>
        </div>
        <div>
            <br />
            <br />
        </div>
        <asp:Button ID="Button1" runat="server" Text="Imprimir" CssClass="btn btn-info pull-right" OnClick="Button1_Click" Enabled="False"/>
        <asp:Button ID="Button3" runat="server" CssClass="btn btn-success pull-right" Text="Guardar" OnClick="Button3_Click" />
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
                        <asp:Label ID="Label4" runat="server" Text="" CssClass="label-warning"></asp:Label>
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



    <asp:Button ID="Button6" runat="server" Text="Button" style="display:none" />
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
    </asp:Panel>
    <script type="text/javascript">
        $('input[type=text]').focus(function () {
            $(this).select();
        });
    </script>
</asp:Content>
