<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="UI.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
      <section class="content-header">
        <h1 align="center" >Cliente</h1>
    </section>
    <section class="content">
      <div class="box box-primary">
          <div class="box-body">
              <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button2_Click" />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#fm-modal-grid"><i class="fa fa-plus">Nuevo</i></button>               
                </span>
              </div>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Cliente" DataSourceID="ListaClientes" CssClass="table table-responsive" AllowPaging="True" AllowSorting="True">
                  <Columns>
                     
                      <asp:BoundField DataField="ID_Cliente" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Cliente" />
                      <asp:BoundField DataField="NIT" HeaderText="NIT" SortExpression="NIT" />
                      <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                      <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                      <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                      <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                  </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="ListaClientes" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Cliente, NIT, Nombre, Apellidos, Direccion, Telefono FROM Cliente WHERE (Estado = 1)" UpdateCommand="EditarCliente" UpdateCommandType="StoredProcedure" DeleteCommand="EliminarCliente" DeleteCommandType="StoredProcedure">
                  <DeleteParameters>
                      <asp:Parameter Name="ID_Cliente" Type="Int32" />
                  </DeleteParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="NIT" />
                      <asp:Parameter Name="Nombre" Type="String" />
                      <asp:Parameter Name="Apellidos" Type="String" />
                      <asp:Parameter Name="Direccion" Type="String" />
                      <asp:Parameter Name="Telefono" Type="Int32" />
                      <asp:Parameter Name="ID_Cliente" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>

          </div>
      </div>

         <div class="modal fade" id="fm-modal-grid" tabindex="-1" role="dialog" aria-labelledby="fm-modal-grid" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">DATOS</h5>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
                    </div>

                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                             <div class="form-group">
                            <label>NIT</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Nombres</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Apellidos</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                              </div>
                           <div class="col-12 col-sm-6">
                                    
                             <div class="form-group">
                            <label>Direccion</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtEdad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Telefono</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button1_Click" />
								<button class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                
            </div>
        </div>
             </div>


    </section>
</asp:Content>
