<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="UI.Empleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="content-header">
        <h1 align="center" >Empleados</h1>
    </section>
    <section class="content">
              <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button2_Click" />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#fm-modal-grid"><i class="fa fa-plus">Nuevo</i></button>               
                </span>
              </div>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Empleado" DataSourceID="ListaEmpleado" CssClass="table table-responsive" AllowPaging="True" >
                  <Columns>                    
                      <asp:BoundField DataField="ID_Empleado" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Empleado" />
                      <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                      <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                      <asp:BoundField DataField="DPI" HeaderText="DPI" SortExpression="DPI" />
                      <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                      <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                      <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda" />
                      <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
                      
                      <asp:TemplateField ShowHeader="False">
                          <EditItemTemplate>
                              <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                              &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                            </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField>
                          <ItemTemplate>
                              <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"></asp:LinkButton>
                          </ItemTemplate>
                      </asp:TemplateField>
                         </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="ListaEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Empleado.ID_Empleado, Empleado.Nombre, Empleado.Apellidos, Empleado.DPI, Empleado.Telefono, Tienda.Tienda, Rol.Rol, Empleado.Direccion FROM Empleado INNER JOIN Tienda ON Empleado.ID_Tienda = Tienda.ID_Tienda INNER JOIN Usuario ON Empleado.ID_Usuario = Usuario.ID_Usuario INNER JOIN Rol ON Usuario.ID_Rol = Rol.ID_Rol WHERE (Empleado.Estado = 1)" UpdateCommand="UPDATE Empleado SET Nombre = @Nombre, Apellidos = @Apellidos, DPI = @DPI, Telefono = @Telefono, Direccion = @Direccion WHERE (ID_Empleado = @ID_Empleado)" DeleteCommand="EliminarEmpleado" DeleteCommandType="StoredProcedure">
                  <DeleteParameters>
                      <asp:Parameter Name="ID_Empleado" Type="Int32" />
                  </DeleteParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="Nombre" Type="String" />
                      <asp:Parameter Name="Apellidos" Type="String" />
                      <asp:Parameter Name="DPI" Type="Int64" />
                      <asp:Parameter Name="Telefono" Type="Int32" />
                      <asp:Parameter Name="Direccion" Type="String" />
                      <asp:Parameter Name="ID_Empleado" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>

       
                        
         <div class="modal fade" id="fm-modal-grid" tabindex="-1" role="dialog" aria-labelledby="fm-modal-grid" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Datos empleado</h5>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
                    </div>

                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                             <div class="form-group">
                            <label>DPI</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="dpi" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Nombres</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="nombre" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Apellidos</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="apellido" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Telefono</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="telefono" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                              </div>
                           <div class="col-12 col-sm-6">
                                    
                             <div class="form-group">
                            <label>Direccion</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="direccion" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                               <div class="form-group">
                                   <label>Rol</label>
                                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Rol" DataValueField="ID_Rol" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Rol], [Rol] FROM [Rol]"></asp:SqlDataSource>
                               </div>
                               <div class="form-group">
                                   <label>Tienda</label>
                                     <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Tienda" DataValueField="ID_Tienda" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Tienda], [Tienda] FROM [Tienda]"></asp:SqlDataSource>
       
                                  </div>
                               <div class="form-group">
                                   <label>Usuario</label>
                                   <asp:TextBox ID="user" runat="server" CssClass="form-control"></asp:TextBox>
                               </div>
                               <div class="form-group">
                                   <label>Contrasena</label>
                                   <asp:TextBox ID="contra" runat="server" CssClass="form-control"></asp:TextBox>
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
             </div>


    </section>
</asp:Content>
