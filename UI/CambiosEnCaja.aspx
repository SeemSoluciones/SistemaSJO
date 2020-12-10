<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CambiosEnCaja.aspx.cs" Inherits="UI.CambiosEnCaja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
           <div class="box box-info">
            <div class="box-header">
              <i class="fa fa-envelope"></i>

              <h3 class="box-title">Ingreso monetario a la caja</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <div class="box-body">
            <div class="form-group">
                <label>Monto inicial</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Fecha de hoy</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
                <div class="form-group">
                    <label>Caja de la cual se agrega</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select2-dropdown form-control" DataSourceID="SqlDataSource1" DataTextField="Caja" DataValueField="ID_Caja"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Caja, Caja FROM Caja WHERE (ID_Tienda = @ID_Tienda)">
                        <SelectParameters>
                            <asp:Parameter Name="ID_Tienda" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Mensaje" CssClass="label label-success"></asp:Label>
                </div>
            </div>
            <div class="box-footer clearfix">
                <asp:Button ID="Button1" runat="server"  Text="Aceptar" CssClass="btn btn-success pull-right" Width="200" OnClick="Button1_Click" />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" InsertCommand="INSERT INTO CajaEntrada(MontoInicial, Fecha, ID_Caja) VALUES (@MontoInicial, @Fecha, @ID_Caja)" SelectCommand="SELECT CajaEntrada.ID_CEntrada, CajaEntrada.MontoInicial, CajaEntrada.Fecha, Caja.Caja FROM CajaEntrada INNER JOIN Caja ON CajaEntrada.ID_Caja = Caja.ID_Caja WHERE (CajaEntrada.Fecha &gt;= DATEADD(day, - 30, GETDATE()))">
                    <InsertParameters>
                        <asp:Parameter Name="MontoInicial" />
                        <asp:Parameter Name="Fecha" />
                        <asp:Parameter Name="ID_Caja" />
                    </InsertParameters>
                </asp:SqlDataSource>
             </div>
          </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" DataKeyNames="ID_CEntrada" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID_CEntrada" HeaderText="ID_CEntrada" InsertVisible="False" ReadOnly="True" SortExpression="ID_CEntrada" />
                        <asp:BoundField DataField="MontoInicial" HeaderText="MontoInicial" SortExpression="MontoInicial" DataFormatString="{0:0.00}" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>
        </div>

       <%-- ###########################################3--%>

         <div class="col-md-6">
          <div class="box box-info">
            <div class="box-header">
              <i class="fa fa-envelope"></i>

              <h3 class="box-title">Retiros monetarios</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <div class="box-body">
             <div class="form-group">
                    <label>Monto a retirar</label>
                 <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Fecha de hoy</label>
                     <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Motivo de retiro</label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="select2-dropdown form-control" DataSourceID="SqlDataSource5" DataTextField="Concepto" DataValueField="ID_Conceptos"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Conceptos], [Concepto] FROM [Conceptos]"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <label>Caja de la cual se retira</label>
                     <asp:DropDownList ID="DropDownList2" runat="server" CssClass="select2-dropdown form-control" DataSourceID="SqlDataSource2" DataTextField="Caja" DataValueField="ID_Caja"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Caja, Caja FROM Caja WHERE (ID_Tienda = @ID_Tienda)">
                         <SelectParameters>
                             <asp:Parameter Name="ID_Tienda" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <label>No. Factura/ Recibo</label>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Mensaje" CssClass="label label-warning"></asp:Label>
                </div>
            </div>
            <div class="box-footer clearfix">
             <asp:Button ID="Button2" runat="server"  Text="Aceptar" CssClass="btn btn-warning pull-right" Width="200" OnClick="Button2_Click" />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" InsertCommand="INSERT INTO CajaSalidas(MontoSalida, ID_Concepto, Fecha, ID_Caja, Informacion) VALUES (@MontoSalida, @ID_Concepto, @Fecha, @ID_Caja, @Informacion)" SelectCommand="SELECT CajaSalidas.ID_CSalida, CajaSalidas.MontoSalida, CajaSalidas.Fecha, Conceptos.Concepto, CajaSalidas.Informacion ,Caja.Caja FROM CajaSalidas INNER JOIN Conceptos ON CajaSalidas.ID_Concepto = Conceptos.ID_Conceptos INNER JOIN Caja ON CajaSalidas.ID_Caja = Caja.ID_Caja WHERE (CajaSalidas.Fecha &gt;= DATEADD(day, - 30, GETDATE()))">
                    <InsertParameters>
                        <asp:Parameter Name="MontoSalida" />
                        <asp:Parameter Name="ID_Concepto" />
                        <asp:Parameter Name="Fecha" />
                        <asp:Parameter Name="ID_Caja" />
                        <asp:Parameter Name="Informacion" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
          </div>
             <div>
                 <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" DataKeyNames="ID_CSalida" DataSourceID="SqlDataSource4" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                     <AlternatingRowStyle BackColor="PaleGoldenrod" />
                     <Columns>
                         <asp:BoundField DataField="ID_CSalida" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_CSalida" />
                         <asp:BoundField DataField="MontoSalida" HeaderText="MontoSalida" SortExpression="MontoSalida"  DataFormatString="{0:0.00}"/>
                         <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha"/>
                         <asp:BoundField DataField="Concepto" HeaderText="Concepto" SortExpression="Concepto" />
                         <asp:BoundField DataField="Informacion" HeaderText="Informacion" SortExpression="Informacion" />
                         <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja" />
                     </Columns>
                     <FooterStyle BackColor="Tan" />
                     <HeaderStyle BackColor="Tan" Font-Bold="True" />
                     <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                     <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                     <SortedAscendingCellStyle BackColor="#FAFAE7" />
                     <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                     <SortedDescendingCellStyle BackColor="#E1DB9C" />
                     <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                 </asp:GridView>
             </div>
        </div>
    </div>
</asp:Content>
