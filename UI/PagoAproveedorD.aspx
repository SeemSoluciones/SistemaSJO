<%@ Page Title="" Language="C#" MasterPageFile="~/Digitador.Master" AutoEventWireup="true" CodeBehind="PagoAproveedorD.aspx.cs" Inherits="UI.PagoAproveedorD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1>Listado de compra pendiente de pago a proveedor (Creditos)</h1>
    <div class="jumbotron">
        <div class="row col-sm-6">
            <div class="form-group">
                <label>Proveedor: </label><asp:Label ID="Label1" runat="server" Text=""></asp:Label>             
            </div>
             <div class="form-group">
            <label>Fecha: </label><asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            </div>
            <div class="form-group">
            <label>Factura: </label><asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </div>
             <div class="form-group">
               <label>Total factura: </label><asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </div>
              <div class="form-group">
            <label>Total a pagar: </label><asp:Label ID="Label7" runat="server" Text=""></asp:Label>
            </div>
              <div class="form-group">
               <label>ID Compra:  </label><asp:Label ID="Label6" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label>Proveedor</label>
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource4" DataTextField="Proveedor" DataValueField="ID_Proveedor" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="0">Seleccionar ...</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT DISTINCT Proveedor.ID_Proveedor, Proveedor.Proveedor FROM Proveedor INNER JOIN Compra ON Proveedor.ID_Proveedor = Compra.ID_Proveedor INNER JOIN PagoPreveedor ON Compra.ID_Compra = PagoPreveedor.ID_Compra WHERE (PagoPreveedor.Estado = 0)"></asp:SqlDataSource>
            </div>
            <asp:GridView CssClass="table table-responsive" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Compra" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowDataBound="GridView2_RowDataBound">
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true"  OnCheckedChanged="checkbox1changed" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Ver / Lista" CommandName="Select" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="ID_Compra" HeaderText="ID_Compra" ReadOnly="True" InsertVisible="False" SortExpression="ID_Compra"></asp:BoundField>
                    <asp:BoundField DataField="NoFacPro" HeaderText="NoFacPro" SortExpression="NoFacPro"></asp:BoundField>
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}"></asp:BoundField>
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha"></asp:BoundField>
                    <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor"></asp:BoundField>
                    <asp:BoundField HeaderText="Libre" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57"></EditRowStyle>

                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="#E3EAEB"></RowStyle>

                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT Compra.ID_Compra, Compra.NoFacPro, Compra.Total, Compra.Fecha, Proveedor.Proveedor FROM PagoPreveedor INNER JOIN Compra ON PagoPreveedor.ID_Compra = Compra.ID_Compra INNER JOIN Proveedor ON Compra.ID_Proveedor = Proveedor.ID_Proveedor WHERE (PagoPreveedor.Estado = 0)
AND (Proveedor.ID_Proveedor) = @ID_Proveedor  ORDER BY Compra.Fecha ASC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" DefaultValue="0" Name="ID_Proveedor"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <label>Total: </label> <asp:Label CssClass="label label-success" ID="Label8" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
    <div class="table table-responsive">
        <asp:GridView CssClass="table table-hover" ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID_CompraDetalle" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

            <Columns>
                <asp:BoundField DataField="ID_CompraDetalle" HeaderText="ID_CompraDetalle" ReadOnly="True" InsertVisible="False" SortExpression="ID_CompraDetalle"></asp:BoundField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad"></asp:BoundField>
                <asp:BoundField DataField="PrecioUnitario" HeaderText="PrecioUnitario" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}"></asp:BoundField>
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:0.00}"></asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion"></asp:BoundField>
                <asp:BoundField DataField="MarcaP" HeaderText="MarcaP" SortExpression="MarcaP" />
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
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT DetalleCompra.ID_CompraDetalle, DetalleCompra.Cantidad, DetalleCompra.PrecioUnitario, DetalleCompra.Total, Producto.Descripcion, MarcaProd.MarcaP FROM PagoPreveedor INNER JOIN Compra ON PagoPreveedor.ID_Compra = Compra.ID_Compra INNER JOIN DetalleCompra ON Compra.ID_Compra = DetalleCompra.ID_Compra INNER JOIN Stock ON DetalleCompra.ID_Producto = Stock.ID_Existencia INNER JOIN Producto ON Stock.ID_Producto = Producto.ID_Producto INNER JOIN MarcaProd ON Stock.ID_MaraProd = MarcaProd.ID_MaraProd WHERE (PagoPreveedor.Estado = 0) AND (Compra.ID_Compra = @ID_Compra)" UpdateCommand="UPDATE PagoPreveedor SET Estado = 1, Cheque = @Cheque, NoRecibo = @NoRecibo WHERE (ID_Compra = @ID_Compra)">
            <SelectParameters>
                <asp:Parameter Name="ID_Compra" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Cheque" />
                <asp:Parameter Name="NoRecibo" />
                <asp:Parameter Name="ID_Compra"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div >
        <br />
<asp:Label ID="Label5" runat="server" Text="" CssClass="label label-danger" Visible="false"></asp:Label>
      <div class="row">
          <div class="col-lg-1">
              <asp:Label ID="Label9" runat="server" Text="NO cheque y recibo" Visible="false"></asp:Label>
          </div>
          <div class="col-lg-2">
             
              <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
          </div>
              <div class="col-lg-2">
                  <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
          </div>
              
          <div class="col-sm-4">
              <asp:Button ID="Button2" CssClass=" form-control btn-warning" runat="server" Text="Pagar varias facturas" Enabled="false" OnClientClick="return confirm('Desea realizar el pago de varias facturas que han sido seleccionadas');" OnClick="Button2_Click" />
          </div>
           <div class="col-sm-3">
                     <asp:Button ID="Button1" CssClass="form-control btn-success" runat="server" Text="Pagar una factura" Enabled="false" OnClientClick="return confirm('Desea realizar el pago al proveedor, solamente de una factura');" OnClick="Button1_Click" />
          </div>
      </div>
       <div class="jumbotron">
           <h2>Total a pagar: </h2>
           <asp:Label ID="Label10" CssClass="lable h1" runat="server" Text="0.0"></asp:Label>
       </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT COUNT(ID_DevProPro) AS TOTAL FROM DevProPro WHERE (Estado = 1) AND (ID_Compra = @ID_Compra)">
        <SelectParameters>
            <asp:Parameter Name="ID_Compra"></asp:Parameter>

        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
