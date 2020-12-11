<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedor.Master" AutoEventWireup="true" CodeBehind="DevolucionEntregaV.aspx.cs" Inherits="UI.DevolucionEntregaV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" CssClass="table table-responsive table-hover" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID_DevPro" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

        <Columns>
            <asp:BoundField DataField="ID_DevPro" HeaderText="ID Dev" ReadOnly="True" InsertVisible="False" SortExpression="ID_DevPro"></asp:BoundField>
            <asp:BoundField DataField="Factura" HeaderText="Factura" SortExpression="Factura"></asp:BoundField>
            <asp:BoundField DataField="Motivo" HeaderText="Motivo" SortExpression="Motivo"></asp:BoundField>
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad"></asp:BoundField>
            <asp:BoundField DataField="Producto" HeaderText="Producto" ReadOnly="True" SortExpression="Producto"></asp:BoundField>
            <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor"></asp:BoundField>
             <asp:BoundField DataField="ID_Existencia" HeaderText="ID" SortExpression="ID_Existencia"></asp:BoundField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Seleccionar" CommandName="Select" CausesValidation="False" ID="LinkButton1" OnClientClick="return confirm('Ah recibido el producto para su ingreso al stock');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <EditRowStyle BackColor="#2461BF"></EditRowStyle>

        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

        <RowStyle BackColor="#EFF3FB"></RowStyle>

        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT DevPro2.ID_DevPro, DevPro2.Factura, DevPro2.Motivo, DevPro2.Cantidad, Producto.Descripcion + '   ~ ' + MarcaProd.MarcaP AS Producto, Proveedor.Proveedor, Stock.ID_Existencia FROM DevPro2 INNER JOIN Proveedor ON DevPro2.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN Stock ON DevPro2.ID_Existencia = Stock.ID_Existencia AND Proveedor.ID_Proveedor = Stock.ID_Proveedor INNER JOIN Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd WHERE (DevPro2.Estado = 0)" UpdateCommand="UPDATE DevPro2 SET Estado = 1 WHERE (ID_DevPro = @ID_DevPro)
UPDATE Stock SET Cantidad = Cantidad + @Cantidad WHERE ID_Existencia = @ID_Existencia">
        <UpdateParameters>
            <asp:Parameter Name="ID_DevPro"></asp:Parameter>
            <asp:Parameter Name="Cantidad"></asp:Parameter>
            <asp:Parameter Name="ID_Existencia"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
