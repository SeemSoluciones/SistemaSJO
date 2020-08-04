<%@ Page Title="" Language="C#" MasterPageFile="~/Digitador.Master" AutoEventWireup="true" CodeBehind="CompraD.aspx.cs" Inherits="UI.CompraD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <div class="content-head">

  </div>
    <div class="content">
          <div class="row">
        <div class="col-md-4">
            <div class="form-group">
            <label>No factura/preforma</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>  
        </div>
         <div class="col-md-4">
                 <label>Proveedor</label>
                 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Proveedor" DataValueField="ID_Proveedor"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Proveedor, Proveedor FROM Proveedor WHERE (Estado = 1)"></asp:SqlDataSource>
        </div>
         <div class="col-md-4">
              <div class="form-group">
            <label>Fecha</label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>  
        </div>
    </div>
        <!------------------------------- -->
          <div class="row">
              <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        Buscar producto
                         <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        </div>
                    </div>
                    <div class="box-body">
                      
                            <div class="row">
                                <div class="col-sm-2">
                                  <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="Marca" DataValueField="ID_Marca" AutoPostBack="True"></asp:DropDownList> 
                                  <asp:CheckBox ID="CheckBox3" runat="server" />Por marca
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY Marca ASC"></asp:SqlDataSource>
                                </div>
                                <div class="col-sm-2">
                                    <asp:DropDownList ID="DropDownList5" CssClass="form-control"  runat="server" DataSourceID="SqlDataSource6" DataTextField="Modelo" DataValueField="ID_Modelo" AutoPostBack="True"></asp:DropDownList>
                                    <asp:CheckBox ID="CheckBox4" runat="server" />Por modelo/linea
                                    <asp:SqlDataSource ID="SqlDataSource6"  runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Modelo, Modelo FROM Modelo WHERE (ID_Marca = @idMarca) ORDER BY Modelo Asc">
                                     <SelectParameters>
                                     <asp:ControlParameter ControlID="DropDownList2" Name="idMarca" PropertyName="SelectedValue" />
                                     </SelectParameters>
                                     </asp:SqlDataSource>
                                </div>
                                <div class="col-sm-2">
                                     <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Rubro" DataValueField="ID_Rubro" AutoPostBack="True" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Rubro, Rubro FROM Rubro WHERE (ID_Modelo = @idModelo) ORDER BY Rubro">
                                     <SelectParameters>
                                      <asp:ControlParameter ControlID="DropDownList5" Name="idModelo" PropertyName="SelectedValue" />
                                      </SelectParameters>
                                      </asp:SqlDataSource>
                                </div>
                                <div class="col-sm-1">
                                     <asp:DropDownList CssClass="form-control select2" ID="DropDownList7" runat="server" DataSourceID="SqlDataSource8" DataTextField="Anio" DataValueField="ID_Anio" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:CheckBox ID="CheckBox2" runat="server" /> Por año.
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Anio], [Anio] FROM [Anio] ORDER BY Anio ASC "></asp:SqlDataSource>
     
                                </div>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="TextBox20" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-2">
                                    <asp:Button ID="Button9" CssClass="btn btn-default form-control" runat="server" Text="Buscar" OnClick="Button9_Click" />
                                </div>
                            </div>
                        <div class="table table-responsive">
                        <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                                <asp:BoundField DataField="Codigo2" HeaderText="Equivalencia" SortExpression="Codigo2" />
                                <asp:BoundField DataField="Producto" HeaderText="Producto" SortExpression="Producto" />
                                <asp:BoundField DataField="MarcaP" HeaderText="MarProd" SortExpression="MarcaP" />
                                <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                                <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                                <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                                <asp:BoundField DataField="Anio" HeaderText="Anio" SortExpression="Anio" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                                <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                                <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio U" SortExpression="PrecioUnitario" DataFormatString="{0:0.00}" />
                                <asp:BoundField DataField="PrecioVenta" HeaderText="Precio V" SortExpression="PrecioVenta" DataFormatString="{0:0.00}" />
                                <asp:BoundField DataField="ID_Existencia" HeaderText="ID Stock" SortExpression="ID_Existencia" />
                                <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                            </div>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                    </div>
                </div>
                 
            </div>
        </div>
         <div class="row">
             <div class="col-sm-2">
            <div class="form-group">
            <label>Codigo</label>
            <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
            </div>  
         </div>
         <div class="col-sm-4">
            <div class="form-group">
            <label>Producto</label>
            <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
            </div>  
        </div>
         <div class="col-sm-2">
             <div class="form-group">
            <label>Precio U</label>
            <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server"></asp:TextBox>
            </div> 
        </div>
         <div class="col-sm-2">
             <div class="form-group">
            <label>Cantidad</label>
            <asp:TextBox ID="TextBox11" CssClass="form-control" runat="server"></asp:TextBox>
            </div> 
        </div>
              <div class="col-sm-2">
             <div class="form-group">
            <label>Aceptar</label>
                 <asp:Button ID="Button2" runat="server"  CssClass="form-control btn-success" Text="Agregar" OnClick="Button2_Click" />
            </div> 
        </div>
        </div>
        <div class="table table-responsive">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
        </div>
        

        <div class="row">
         <div class="col-md-6">
        </div>
         <div class="col-md-3">
            <div class="form-group">
            <label class="pull-right">Total</label>
            </div>  
        </div>
         <div class="col-md-3">
             <div class="form-group">
                 <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" Font-Bold="True" Enabled="False" OnTextChanged="TextBox12_TextChanged"></asp:TextBox>
        </div>
          </div>
        </div>


        

        <asp:Button ID="Button3" runat="server" CssClass="btn btn-success pull-right" Text="Guardar" OnClick="Button3_Click" />
 <asp:Button ID="Button4" runat="server" CssClass="btn btn-warning pull-right" Text="Cancelar" OnClick="Button4_Click" />

    </div>

    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>

</asp:Content>
