<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Encargos.aspx.cs" Inherits="UI.Encargos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .fondo{
            background-color:black;
            filter:apha(opacity=95);
            opacity:0.8;
            z-index:10000;
        }
    </style>
    
     <section class="content-header">
       <h1 align="center">Mercaderia por encargo</h1>
    </section>
<section class ="content">
    <div class="row">
         <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                 <div class="form-group">
                            <label>NIT cliente</label>
                        </div>
                       <div class="form-group">
                          
                             <div class="row col-sm-3">
                                   <div class="form-group">
                                       <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                      </div>
                               </div>
                               <div class="row col-sm-2">
                                   <div class="form-group">
                                        <asp:Button ID="Button4" runat="server" Text="+" CssClass="form-control btn-success"  OnClick="Button4_Click"> </asp:Button> 
                                   </div>
                               </div>
                           
                               <div class="row col-sm-9">
                                   <div class="form-group">
                                       <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Nombre cliente"></asp:TextBox>
                                   </div>
                               </div>
                          
                       </div>
                          <div class="form-group">
                            <label>Fecha recibido</label>
                        </div>
                        <div class="form-group">
                              <asp:TextBox ID="FechaActual" runat="server" Cssclass="form-control" Enabled="False"></asp:TextBox>
                          </div>  
                     <div class="form-group">
                            <label>Fecha de entrega</label>
                        </div>   
                       <div class="form-group">
                           <asp:TextBox ID="FechaEn" runat="server" Cssclass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                         <label>Producto</label>
                        </div>
                       <div class="form-group">
                     <asp:TextBox runat="server" CssClass="form-control" ID="Producto"></asp:TextBox>
                       </div>
                </div>
            </div>
    </div>
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="form-group">
                       <label>Precio del producto</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox9" CssClass="form-control"  TextMode="Number" runat="server"></asp:TextBox>
                         </div>
                    <div class="form-group">
                        <label>Anticipo</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Informacion adicional</label>
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class="form-group">
                            <label>Fotografia</label>
                        </div>
                        <div class="form-group">
                            <asp:FileUpload ID="FileUpload1" runat="server" placeholder="subir" CssClass="form-control"/>
                    </div>   

                </div>
            </div>
        </div>
        </div>
    <div align="center">
            <table>
                <tr>
                    <td> 
                        <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>


    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
 
    <br />
    <br />
        <div class="box box-success">
            <div class="box-header">
                <h3>Listado de productos <small>Pendiente de entrega</small> </h3>
            </div>
            <div class="box-body">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ListaEncargos" DataValueField="ID_ProdXen" CssClass="table table-responsive table-bordered" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <Columns>
                       
                        <asp:BoundField DataField="NIT" HeaderText="NIT" SortExpression="NIT" />
                        <asp:BoundField DataField="Nom" HeaderText="Nombre" ReadOnly="True" SortExpression="Nom" />
                        <asp:BoundField DataField="Producto" HeaderText="Producto" SortExpression="Producto" />
                        <asp:BoundField DataField="FechaPedido" HeaderText="FechaPedido" SortExpression="FechaPedido" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" SortExpression="FechaEntrega" DataFormatString="{0:dd/MMyyyy}" />
                        <asp:BoundField DataField="Anticipo" HeaderText="Anticipo" SortExpression="Anticipo" DataFormatString="{0:0.00}" />
                        <asp:BoundField DataField="PrecioReal" HeaderText="PrecioReal" SortExpression="PrecioReal" DataFormatString="{0:0.00}" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                        <asp:BoundField DataField="ID_ProdXen" HeaderText="ID" SortExpression="ID_ProdXen" InsertVisible="False" ReadOnly="True"/>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="ListaEncargos" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Cliente.NIT, Cliente.Nombre + '  ' + Cliente.Apellidos AS Nom, ProductoXencargo.Producto,  ProductoXencargo.FechaPedido, ProductoXencargo.FechaEntrega, ProductoXencargo.Anticipo, ProductoXencargo.PrecioReal, ProductoXencargo.Descripcion, ProductoXencargo.Fotografia, ProductoXencargo.Estado, ProductoXencargo.ID_ProdXen FROM ProductoXencargo  INNER JOIN Cliente ON ProductoXencargo.ID_Cliente = Cliente.ID_Cliente WHERE (ProductoXencargo.Estado = 0)"></asp:SqlDataSource>
            </div>
        </div>
    
    
    <asp:ScriptManager ID="ScripManager1" runat="server"></asp:ScriptManager>
    <asp:Button ID="Button3" runat="server" Text="Button"  style="display:None"  />
    <cc1:ModalPopupExtender ID="Button3_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="Button3"
        PopupControlID="Panel1"   BackgroundCssClass="fondo">
    </cc1:ModalPopupExtender>
    
    <asp:Panel ID="Panel1" runat="server" >
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
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Nombres</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Apellidos</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
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
                               <asp:Label ID="Label2" runat="server" CssClass="label-danger"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Button5" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button5_Click" />
								<button class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
            </div>
    </asp:Panel>
    <asp:Button ID="Button6" runat="server" Text="Button" style="display:none" />

    <cc1:ModalPopupExtender ID="Button6_ModalPopupExtender" runat="server"  Enabled="True" TargetControlID="Button6" 
         PopupControlID="Panel2"   BackgroundCssClass="fondo">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="Panel2" runat="server">
        <div class="modal-content" >
        <div class="modal-header">
								<h5 class="modal-title" id=""> <asp:Label ID="Label3" runat="server" Text="Mensaje" CssClass="label-info"></asp:Label>     </h5>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
        <div class="modal-body">
            <h3>Cancelar producto para ingreso en caja?</h3>
            <div class="form-group">
                <label>Cliente</label>
                <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control"></asp:TextBox>
                <label>Restante</label>
                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button7" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button7_Click" />
		<button class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
            </div>
    </asp:Panel>
</section>

</asp:Content>
