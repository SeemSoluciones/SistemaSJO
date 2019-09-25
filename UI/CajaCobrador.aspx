<%@ Page Title="" Language="C#" MasterPageFile="~/Cobrador.Master" AutoEventWireup="true" CodeBehind="CajaCobrador.aspx.cs" Inherits="UI.CajaCobrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <h3>Ventana para realizar el cobro.</h3>
        

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-responsive" DataKeyNames="ID_Venta" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_Venta" HeaderText="ID Venta" InsertVisible="False" ReadOnly="True" SortExpression="ID_Venta" />
            <asp:BoundField DataField="NoFac_Pref" HeaderText="No Factura" SortExpression="NoFac_Pref" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" DataFormatString="{0:0.00}" />
            <asp:BoundField DataField="Descuento" HeaderText="Descuento" SortExpression="Descuento" DataFormatString="{0:0.00}" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}"/>
            <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Cobrar" OnClientClick='return confirm("Esta seguro de cobrar esta venta?");'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Venta.ID_Venta, Venta.NoFac_Pref, Venta.Fecha, Venta.Subtotal, Venta.Descuento, Venta.Total, Caja.Caja FROM Estados INNER JOIN Venta ON Estados.ID_Venta = Venta.ID_Venta INNER JOIN Tienda ON Estados.ID_Tienda = Tienda.ID_Tienda INNER JOIN Caja ON Tienda.ID_Tienda = Caja.ID_Tienda INNER JOIN Bitacora ON Venta.ID_Venta = Bitacora.ID_Venta AND Caja.ID_Caja = Bitacora.ID_Caja WHERE (Tienda.ID_Tienda = @IDtienda) AND (Estados.EstadoCajero = 1)" DeleteCommand="UPDATE Estados SET EstadoCajero = 0 WHERE (ID_Venta = @ID_Venta)">
        <DeleteParameters>
            <asp:Parameter Name="ID_Venta" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="IDtienda" SessionField="IDtienda" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>
