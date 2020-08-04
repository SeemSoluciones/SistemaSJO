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
                            <div class="col-sm-4">
                                <asp:DropDownList CssClass="form-control select2" style="width: 100%;" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Anio" DataValueField="ID_Anio" AutoPostBack="True"></asp:DropDownList>
                                <asp:CheckBox ID="CheckBox2" runat="server" /> Por año.
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Anio], [Anio] FROM [Anio]"></asp:SqlDataSource>
     
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="TextBox20" CssClass="form-control" runat="server"></asp:TextBox>
                                    Buscar por Equivalencia.
                                </div>
                                <div class="col-sm-4">
                                    <asp:Button ID="Button9" CssClass="btn btn-default form-control" runat="server" Text="Buscar" OnClick="Button9_Click" />
                                </div>
              
           </div>
           <div class="table table-bordered">
               <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                   <Columns>
                       <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                       <asp:BoundField DataField="Codigo2" HeaderText="Codigo2" SortExpression="Codigo2" />
                       <asp:BoundField DataField="Producto" HeaderText="Producto" SortExpression="Producto" />
                       <asp:BoundField DataField="MarcaP" HeaderText="MarcaP" SortExpression="MarcaP" />
                       <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                       <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                       <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                       <asp:BoundField DataField="Anio" HeaderText="Anio" SortExpression="Anio" />
                       <asp:BoundField DataField="Cantidad" HeaderText="Cant" SortExpression="Cantidad" />
                       <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                       <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
                       <asp:BoundField DataField="ID_Anio" HeaderText="ID_anio" SortExpression="ID_Anio" />
                       <asp:BoundField DataField="ID_Existencia" HeaderText="IDStock" InsertVisible="False" ReadOnly="True" SortExpression="ID_Existencia" />
                       
                       <asp:TemplateField ShowHeader="False">
                           <ItemTemplate>
                               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar"></asp:LinkButton>
                           </ItemTemplate>
                       </asp:TemplateField>
                       
                   </Columns>
               </asp:GridView>
           </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
          
           
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
