<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Creditos.aspx.cs" Inherits="UI.Creditos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <section class="content">
        <div class="jumbotron">
             <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button1_Click" />
                                </span>
                            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="" style="display:none"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="" style="display:none"></asp:Label>
            </div>
            <p></p>
<div class="table">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="ID_Credito">
        <Columns>
            <asp:BoundField DataField="NIT" HeaderText="NIT" SortExpression="NIT" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
            <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" />
            <asp:BoundField DataField="SaldoPendiente" HeaderText="Pendiene" SortExpression="SaldoPendiente" />
            <asp:BoundField DataField="FechaCredito" HeaderText="FechaCredito" SortExpression="FechaCredito" />
            <asp:BoundField DataField="FechaPago" HeaderText="Dia pago" SortExpression="FechaPago" />
            <asp:BoundField DataField="TotalCompra" HeaderText="TotalCompra" SortExpression="TotalCompra" />
            <asp:BoundField DataField="ID_Credito" HeaderText="Credito" SortExpression="ID_Credito" />
            <asp:CommandField SelectText="Abonar" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Cliente.NIT, Cliente.Nombre, Cliente.Apellidos, Credito.Monto, Credito.SaldoPendiente, Credito.FechaCredito, Credito.FechaCredito + InfoCreditos.DiasMax AS FechaPago, Venta.Total AS TotalCompra, Credito.ID_Credito FROM Cliente INNER JOIN Credito ON Cliente.ID_Cliente = Credito.ID_Cliente INNER JOIN Venta ON Credito.ID_Venta = Venta.ID_Venta INNER JOIN InfoCreditos ON Cliente.ID_Cliente = InfoCreditos.ID_Cliente WHERE (Credito.Estado = 1)"></asp:SqlDataSource>
</div>
</div>
    </section>
     <section class="content">
        <div class="jumbotron">
 		<div class="container">
			
             <div class="row">
                 <div class="col-md-6">
                     <div class="form-group">
                         <label> Nit </label>
                         <asp:Label ID="Label2" runat="server" Text="" CssClass="form-control"></asp:Label>
                     </div>
                      <div class="form-group">
                         <label> Nombre </label>
                         <asp:Label ID="Label3" runat="server" Text="" CssClass="form-control"></asp:Label>
                     </div>
                      <div class="form-group">
                         <label> Saldo Pendiente </label>
                         <asp:Label ID="Label4" runat="server" Text="" CssClass="form-control"></asp:Label>
                     </div>
                      
                 </div>
                  <div class="col-md-6">
                      <div class="form-group">
                         <label> Fecha crédito </label>
                         <asp:Label ID="Label5" runat="server" Text="" CssClass="form-control"></asp:Label>
                     </div>
                    
                       <div class="form-group">
                         <label> Fecha abono </label>
                         <asp:Label ID="Label6" runat="server" Text="" CssClass="form-control"></asp:Label>
                     </div>
                       <div class="form-group">
                         <label> Dinero a abonar </label>
                           <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                     </div>
                 </div>
                 <asp:Button ID="Button2" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="Button2_Click" />
             </div>
	</div>
</div>
    </section>

</asp:Content>
