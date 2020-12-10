<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Devolucion.aspx.cs" Inherits="UI.Devolucion" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .fondo{
            background-color:black;
            filter:apha(opacity=95);
            opacity:0.8;
            z-index:10000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
    <div class="row col-lg-6">
        <div class="input-group custom-search-form">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="True" placeholder="Ingrese el numero de venta" ></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button1_Click"/>            
        </span></div>
    </div>
    <br />
    <br />
    <asp:GridView ID="GridView1"  CssClass ="table table-responsive table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="ID_Venta,ID_Producto,ID_DetalleVenta">
        <Columns>
            <asp:BoundField DataField="ID_Venta" HeaderText="ID Venta" InsertVisible="False" ReadOnly="True" SortExpression="ID_Venta" />
            <asp:BoundField DataField="NoFac_Pref" HeaderText="No Preforma" SortExpression="NoFac_Pref" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
             <asp:BoundField DataField="ID_Producto" HeaderText="ID_Producto" SortExpression="ID_Producto" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
            <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}" />
            <asp:BoundField DataField="ID_DetalleVenta" HeaderText="ID dv" InsertVisible="False" ReadOnly="True" SortExpression="ID_DetalleVenta" />
            <asp:BoundField DataField="ID_Existencia" HeaderText="ID Stock" InsertVisible="False" ReadOnly="True" SortExpression="ID_Existencia" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Venta.ID_Venta, Venta.NoFac_Pref, Venta.Fecha, Producto.ID_Producto,  Producto.Descripcion, DetalleVenta.PrecioUnitario, DetalleVenta.Cantidad, DetalleVenta.Total, DetalleVenta.ID_DetalleVenta, Stock.ID_Existencia FROM Stock INNER JOIN DetalleVenta ON Stock.ID_Existencia = DetalleVenta.ID_Existencia INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta INNER JOIN Producto ON Producto.ID_Producto = Stock.ID_Producto  WHERE (Venta.ID_Venta = @ID_Venta) AND (Producto.Estado = 1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="ID_Venta" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <asp:Label ID="Label3" runat="server" Text="" CssClass="label label-success" Font-Size="Large"></asp:Label>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Button ID="Button2" runat="server" Text="Button" style="display:none" />


    <cc1:ModalPopupExtender ID="Button2_ModalPopupExtender" runat="server"  Enabled="True" TargetControlID="Button2" PopupControlID="Panel1" BackgroundCssClass="fondo">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="Panel1" runat="server">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Devolucion del producto</h5>
                <button class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span class="aria-hidden"> &times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label>Indique la cantidad de producto para devolver</label> <br />
               <div class="form-group">
                   <label>Codigo</label>
                   <asp:Label ID="Label1" runat="server" CssClass="form-control"></asp:Label>
               </div>
                <div class="form-group">
                   <label>Producto</label>
                    <asp:Label ID="Label2" runat="server" CssClass="form-control"></asp:Label>
               </div>
                <div class="form-group">
                   <label>Cantidad de producto a devolver</label>
                   <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" BorderColor="Red"></asp:TextBox>
               </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button3" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button3_Click"/>
                <button class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </asp:Panel>


</section>
</asp:Content>
