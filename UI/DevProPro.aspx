
<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DevProPro.aspx.cs" Inherits="UI.DevProPro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="content-head">

  </div>
    <div class="content">
    

        <asp:GridView ID="GridView3" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="ID Dev" InsertVisible="False" SortExpression="ID_DevProPro">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ID_DevProPro") %>' ID="Label1"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("ID_DevProPro") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Factura" SortExpression="Factura">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Factura") %>' ID="TextBox1"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Factura") %>' ID="Label2"></asp:Label>
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
                <asp:TemplateField HeaderText="P / V" SortExpression="PrecioVenta">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("PrecioVenta") %>' ID="TextBox4"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("PrecioVenta") %>' ID="Label5"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripcion" SortExpression="Descripcion">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Descripcion") %>' ID="Label2"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Descripcion") %>' ID="Label6"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Proveedor" SortExpression="Proveedor">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Proveedor") %>' ID="TextBox5"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Proveedor") %>' ID="Label7"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IDStock" InsertVisible="False" SortExpression="ID_Existencia">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ID_Existencia") %>' ID="Label3"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("ID_Existencia") %>' ID="Label8"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IDProveedor" InsertVisible="False" SortExpression="ID_Proveedor">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ID_Proveedor") %>' ID="Label4"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("ID_Proveedor") %>' ID="Label9"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IDCompra" InsertVisible="False" SortExpression="ID_Compra">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ID_Compra") %>' ID="Label5"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("ID_Compra") %>' ID="Label10"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Cambio">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="Cambio" CommandName="Select" CausesValidation="False" ID="LinkButton1" OnClick="OnClick_LinkButton1" OnClientClick="return confirm('Desea realizar la entrega del producto al provedor, para su posterior cambio de la misma');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Comprar">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="Comprar" CommandName="Select" CausesValidation="false" ID="LinkButton2" OnClick="OnClick_LinkButton2" OnClientClick="return confirm('Desea realizar la re-comprar con el mismo precio que esta en el stock');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Devolucion">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="Devolucion" CommandName="Select" CausesValidation="false" ID="LinkButton3" OnClick="OnClick_LinkButton3" OnClientClick="return confirm('Desea realizar la entrega del producto sin realizar un registo, solamente eliminar de la lista? Aplica si hay devolucion del DINERO');"></asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>"
            SelectCommand="SELECT DevProPro.ID_DevProPro, DevProPro.Factura, DevProPro.Motivo, DevProPro.Cantidad, Producto.Descripcion + ' ~ ' + MarcaProd.MarcaP AS Descripcion, Proveedor.Proveedor, Stock.ID_Existencia, Proveedor.ID_Proveedor, DevProPro.PrecioVenta, Compra.ID_Compra FROM DevProPro INNER JOIN Proveedor ON DevProPro.ID_Proveedor = Proveedor.ID_Proveedor INNER JOIN Stock ON DevProPro.ID_Existencia = Stock.ID_Existencia INNER JOIN Producto ON Producto.ID_Producto = Stock.ID_Producto INNER JOIN MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd INNER JOIN Compra ON DevProPro.ID_Compra = Compra.ID_Compra WHERE (DevProPro.Estado = 1)" UpdateCommand="EliminarProPro" UpdateCommandType="StoredProcedure" 
            InsertCommand=" INSERT INTO DevPro2 (ID_Existencia, ID_Proveedor, Motivo, Estado, Cantidad, Factura, ID_Compra)
                     Values(@ID_Existencia, @ID_Proveedor, @Motivo, 0, @Cantidad, @Factura, @ID_Compra)">
            <InsertParameters>
                <asp:Parameter Name="ID_Existencia"></asp:Parameter>
                <asp:Parameter Name="ID_Proveedor"></asp:Parameter>
                <asp:Parameter Name="Motivo"></asp:Parameter>
                <asp:Parameter Name="Cantidad"></asp:Parameter>
                <asp:Parameter Name="Factura"></asp:Parameter>
                <asp:Parameter Name="ID_Compra"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
            <asp:Parameter Name="ID_DevProPro" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Cantidad" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="idStock" Type="Int32"></asp:Parameter>
            </UpdateParameters>

    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' InsertCommand="INSERT INTO DetalleCompra (Cantidad, PrecioUnitario, Total, ID_Producto, ID_Compra) 
Values                                  (@Cantidad, @Precio, @Total, @ID_Existencia, @ID_Compra)"
            SelectCommand="SELECT Cantidad, PrecioUnitario FROM Stock WHERE (ID_Existencia = @ID_Existencia)" UpdateCommand=" UPDATE dbo.DevProPro SET Estado = 0 WHERE (ID_DevProPro = @ID_DevProPro)
">
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
                <asp:Parameter Name="ID_DevProPro"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
</asp:Content>

