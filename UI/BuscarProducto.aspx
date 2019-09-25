<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="BuscarProducto.aspx.cs" Inherits="UI.BuscarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
      
    </section>
    <section class="content"> 
 <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
     <span class="input-group-btn">  <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-default" /></span>
          </div>
        <div class="lista table">
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-bordered datatable" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                    <asp:BoundField DataField="Producto" HeaderText="Producto" SortExpression="Producto" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="PrecioUnitario" HeaderText="PrecioUnitario" SortExpression="PrecioUnitario" />
                    <asp:BoundField DataField="PrecioVenta" HeaderText="PrecioVenta" SortExpression="PrecioVenta" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                    <asp:CheckBoxField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    <asp:ButtonField  Text="Editar" HeaderText="Opcion 1" />
                    <asp:ButtonField runat="server" Text="Borrar" HeaderText="Opciob 2" />

                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=ERASMOMARRO3CD9;Initial Catalog=BDautorepuesto;Persist Security Info=True;User ID=sa;Password=database" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Codigo], [Producto], [Descripcion], [PrecioUnitario], [PrecioVenta], [Marca], [Imagen], [Estado] FROM [Producto]"></asp:SqlDataSource>
        </div>
    </section>
     
</asp:Content>
