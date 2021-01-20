<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DevolucionEntrega.aspx.cs" Inherits="UI.DevolucionEntrega" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" CssClass="table table-responsive table-hover" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID_DevPro" DataSourceID="SqlDataSource1">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

        <Columns>
            <asp:TemplateField HeaderText="ID Dev" InsertVisible="False" SortExpression="ID_DevPro">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ID_DevPro") %>' ID="Label1"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ID_DevPro") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Factura" SortExpression="Factura">
              <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Factura") %>' ID="TextBox8"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Factura") %>' ID="Label8"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Motivo" SortExpression="Motivo">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Motivo") %>' ID="TextBox2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Motivo") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cantidad" SortExpression="Cantidad">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Cantidad") %>' ID="TextBox3"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Cantidad") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Producto" SortExpression="Producto">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Producto") %>' ID="Label2"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Producto") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Proveedor" SortExpression="Proveedor">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Proveedor") %>' ID="TextBox4"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Proveedor") %>' ID="Label6"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" SortExpression="ID_Existencia">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("ID_Existencia") %>' ID="TextBox5"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ID_Existencia") %>' ID="Label7"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="ID2" SortExpression="ID_Compra">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("ID_Compra") %>' ID="TextBox10"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ID_Compra") %>' ID="Label10"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Recibir">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="Recibir" CommandName="Select" CausesValidation="False" ID="LinkButton1" OnClick="OnClick_LinkButton1" OnClientClick="return confirm('Ah recibido el producto para su ingresar al stock');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cancelar">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="Cancelar" CommandName="Select" CausesValidation="false" ID="LinkButton2" OnClick="OnClick_LinkButton2" OnClientClick="return confirm('Desea descontar el producto de la factura?');"></asp:LinkButton>
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
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT DevPro2.ID_DevPro, DevPro2.Factura, DevPro2.Motivo, DevPro2.Cantidad, Producto.Descripcion + '   ~ ' + MarcaProd.MarcaP AS Producto, Proveedor.Proveedor, Stock.ID_Existencia, DevPro2.ID_Compra FROM DevPro2 INNER JOIN Proveedor ON DevPro2.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN Stock ON DevPro2.ID_Existencia = Stock.ID_Existencia INNER JOIN Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd WHERE (DevPro2.Estado = 0)" UpdateCommand="UPDATE DevPro2 SET Estado = 1 WHERE (ID_DevPro = @ID_DevPro)">
        <UpdateParameters>
            <asp:Parameter Name="ID_DevPro"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' InsertCommand="INSERT INTO DetalleCompra (Cantidad, PrecioUnitario, Total, ID_Producto, ID_Compra) 
Values                                  (@Cantidad, @Precio, @Total, @ID_Existencia, @ID_Compra)"
        SelectCommand="SELECT Cantidad, PrecioUnitario FROM Stock WHERE (ID_Existencia = @ID_Existencia)" UpdateCommand="UPDATE DevPro2 SET Estado = 1 WHERE (ID_DevPro = @ID_DevPro)
UPDATE Stock SET Cantidad = Cantidad + @Cantidad WHERE ID_Existencia = @ID_Existencia">
        <InsertParameters>
            <asp:Parameter Name="Cantidad" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Precio"></asp:Parameter>
            <asp:Parameter Name="Total"></asp:Parameter>
            <asp:Parameter Name="ID_Existencia" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID_Compra"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="ID_Existencia"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID_DevPro"></asp:Parameter>
            <asp:Parameter Name="Cantidad"></asp:Parameter>
            <asp:Parameter Name="ID_Existencia"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
