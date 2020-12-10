<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="UI.Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Foto</h1>
    <div>
        <asp:GridView CssClass="table table-responsive-lg table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="ID_Producto" HeaderText="ID Producto" ReadOnly="True" InsertVisible="False" SortExpression="ID_Producto"></asp:BoundField>
                <asp:BoundField DataField="Producto" HeaderText="Producto" SortExpression="Producto"></asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion"></asp:BoundField>
                <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" ReadOnly="True"></asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999"></EditRowStyle>

            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

            <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT Producto.ID_Producto, Producto.Producto, Producto.Descripcion, Producto.Imagen, SubCategoria.SubCategoria + ', ' + Categoria.Categoria AS Categoria FROM Producto INNER JOIN SubCategoria ON Producto.ID_SubCategoria = SubCategoria.ID_SubCategoria INNER JOIN Categoria ON SubCategoria.ID_Categoria = Categoria.ID_Categoria WHERE (Producto.Estado = 1) AND (Producto.ID_Producto = @IDproducto)">
            <SelectParameters>
                <asp:Parameter Name="IDproducto"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
        <div>
            <asp:Image ID="Image1" runat="server" Width="500" />
        </div>
    </form>
</body>
</html>
