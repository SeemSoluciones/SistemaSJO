<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="UI.Stock" %>

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

    <script language="JavaScript">
     //   document.onkeydown = function (evt) { return (evt ? evt.which : event.keyCode) != 13 };
</script>
    <%--<script type="text/javascript">
        function detectar_tecla(){
            with (event) {
                if(keyCode==113)
                {
                 
                    $('#<%=Button2.ClientID%>').click();
                    return false;
                
                }
               
            }
        }
    </script>--%>
    <div class="content">
        
      <div class="row">
        <div class="col-md-12">
     <div class="box box-default collapsed-box">
            <div class="box-header with-border ">
              <h3 class="box-title">Agregar producto a stock </h3>

              <div class="box-tools pull-right">
                  <a href="Productos.aspx" target="_blank">Nuevo producto</a>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Codigo</label>

                            <div class="input-group">
                            <div class="input-group-btn">
                              <asp:Button ID="Button3" runat="server" CssClass="btn btn-danger" Text="Buscar" OnClick="Button3_Click" TabIndex="3" />
                             </div>
                            <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                             </div>
                      
                        <div class="form-group">
                            <label>Producto</label>
                            <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Seleccione año</label>
                         <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Anio" DataValueField="ID_Anio"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Anio, Anio FROM Anio"></asp:SqlDataSource>
                        </div>
                           </div>
                    <div class="col-sm-6">
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
                            <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Medida" DataValueField="ID_Medida"></asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Medida], [Medida] FROM [Medida]"></asp:SqlDataSource>

                        </div>
                    </div>
                </div>
                    
            </div> 
         <div class="box-footer">
             <asp:Button ID="Button1" runat="server" Text="Guardar"  CssClass="btn btn-primary pull-right" Width="200"  OnClick="Button1_Click" />
         </div>
            <!-- /.box-body -->
          </div>
      </div>
       </div>
          <!-- /.box -->
  
             <div class="input-group custom-search-form">
              <span class="input-group-btn">    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True"></asp:DropDownList> </span> 
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca]"></asp:SqlDataSource>
             <span class="input-group-btn">    <asp:DropDownList ID="DropDownList3" CssClass="form-control"  runat="server" DataSourceID="SqlDataSource4" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True"></asp:DropDownList> </span> 
                 <asp:SqlDataSource ID="SqlDataSource4"  runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @idMarca)">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList2" Name="idMarca" PropertyName="SelectedValue" />
                     </SelectParameters>
                 </asp:SqlDataSource>
               <span class="input-group-btn">  <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="Rubro" DataValueField="ID_Rubro" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged"></asp:DropDownList> </span> 
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @idModelo)">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList3" Name="idModelo" PropertyName="SelectedValue" />
                     </SelectParameters>
                 </asp:SqlDataSource>
                 <span class="input-group-btn">
                     <asp:DropDownList CssClass="form-control" ID="DropDownList5" runat="server" DataSourceID="SqlDataSource6" DataTextField="Anio" DataValueField="ID_Anio" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                 </span>  <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Anio], [Anio] FROM [Anio]"></asp:SqlDataSource>
               <span class="input-group-btn">  <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" OnTextChanged="TextBox3_TextChanged" AutoPostBack="True"></asp:TextBox></span>
               <span class="input-group-btn"><asp:CheckBox ID="CheckBox1" runat="server" />Incluir año</span>
        <span class="input-group-btn">  <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button2_Click"/>             
                </span>
              </div>
        
        <div class="table table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive table-hover" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField SelectText="Editar" ShowSelectButton="True" DeleteText="X" />
                <asp:BoundField DataField="ID_Existencia" HeaderText="ID_Exi" InsertVisible="False" ReadOnly="True" SortExpression="ID_Existencia" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cant" SortExpression="Cantidad" />
                <asp:BoundField DataField="Cantidad_Min" HeaderText="Cant Min" SortExpression="Cantidad_Min" />
                <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                <asp:BoundField DataField="PrecioUnitario" HeaderText="P/Unit" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="PrecioVenta" HeaderText="P/V" SortExpression="PrecioVenta" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="MarcaP" HeaderText="Marca P" SortExpression="MarcaP" />
                <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                <asp:BoundField DataField="Anio" HeaderText="Anio" SortExpression="Anio" />
            </Columns>
        </asp:GridView>
            </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="" DeleteCommand="DELETE FROM Stock WHERE (ID_Existencia = @ID_Existencia)">
            <DeleteParameters>
                <asp:Parameter Name="ID_Existencia" />
            </DeleteParameters>
        </asp:SqlDataSource>

        
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        

        <asp:Button ID="Button6" runat="server" Text="Button"  style="display:None" />

        <cc1:ModalPopupExtender ID="Button6_ModalPopupExtender" runat="server"  Enabled="True" TargetControlID="Button6" PopupControlID="Panel2" 
              BackgroundCssClass="fondo"  CancelControlID="Cerrar2">
        </cc1:ModalPopupExtender>
        
        <asp:Panel ID="Panel2" runat="server">
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
                                   <label>ID stock</label>
                                   <asp:TextBox ID="IDstock" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                               </div>
                                <div class="form-group">
                                   <label>Cantidad Minima</label>
                                   <asp:TextBox ID="Cant" runat="server" CssClass="form-control"></asp:TextBox>
                               </div>
                                <div class="form-group">
                                   <label>Ubicacion</label>
                                   <asp:TextBox CssClass="form-control" ID="Ubi" runat="server"></asp:TextBox>
                               </div>                   
                                        
                      	</div>
										<div class="col-12 col-sm-6">
                   
                              <div class="form-group">
                                   <label>Precio producto</label>
                                   <asp:TextBox ID="PrecioP" runat="server" CssClass="form-control"></asp:TextBox>
                               </div>
                                <div class="form-group">
                                   <label>Precio venta</label>
                                   <asp:TextBox ID="PrecioVe" runat="server" CssClass="form-control"></asp:TextBox>
                               </div>
                                            <div class="form-group">
                                                <label>Año</label>
                                                <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-control" DataSourceID="SqlDataSource9" DataTextField="Anio" DataValueField="ID_Anio">
                                                    <asp:ListItem Value="" Text="Selecciona una opción" ></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Anio], [Anio] FROM [Anio]"></asp:SqlDataSource>
                                            </div>
              
							</div>
                               	</div>
					                </div>
								</div>
							</div>
                            
							<div class="modal-footer"> 
                               <asp:Button ID="Button4" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button4_Click1" />
                                <asp:Button ID="Button5" runat="server" Text="Eliminar" CssClass="btn btn-danger pull-left" OnClick="Button5_Click" OnClientClick="OnClientClick='return confirm(&quot;Desea Eliminar este Registro&quot;);'" />
								<button id="Cerrar2" class="btn btn-default" data-dismiss="modal">Cerrar</button>
							</div>
						</div>

        </asp:Panel>

        </div>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Codigo, Descripcion FROM Producto WHERE (Codigo = @Codigo) AND (Estado = 1)">
        <SelectParameters>
            <asp:Parameter Name="Codigo" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
