<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autorizacion.aspx.cs" Inherits="UI.Autorizacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <script type="text/javascript">
        function resize() {
            resizeTo(400, 200);
        }
    </script>

</head>
<body onload="resize();">
    <form id="form1" runat="server">
    <div class="form group">
        <h3>Ingrese su credencial.</h3><br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="BtnAceptar_Click" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT COUNT(Empleado.ID_Empleado) AS Total, Empleado.Nombre + '  ' + Empleado.Apellidos AS Nom FROM Usuario INNER JOIN Rol ON Usuario.ID_Rol = Rol.ID_Rol INNER JOIN Empleado ON Usuario.ID_Usuario = Empleado.ID_Usuario INNER JOIN Tienda ON Empleado.ID_Tienda = Tienda.ID_Tienda WHERE (Usuario.[User] = @User ) AND (Usuario.PassWord = @PassWord) AND (Tienda.ID_Tienda = @IdTienda) AND (Rol.Rol = N'Administrador') GROUP BY Empleado.Nombre, Empleado.Apellidos">
            <SelectParameters>
                <asp:Parameter Name="User" />
                <asp:Parameter Name="PassWord" />
                <asp:SessionParameter Name="IdTienda" SessionField="IdTienda" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
