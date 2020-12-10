<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarFoto.aspx.cs" Inherits="UI.EditarFoto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <label>ID producto</label>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <asp:Image ID="Image1" runat="server" Width="500" />
        <br />
        <label>Seleccionar imagen para cambiar</label>
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server"/>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Editar foto" OnClick="Button1_Click" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT ID_Producto, Imagen FROM Producto WHERE (ID_Producto = @IDproducto)" UpdateCommand="EditarFoto" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="IDproducto"></asp:Parameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Imagen"></asp:Parameter>
                <asp:Parameter Name="IDproducto"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
