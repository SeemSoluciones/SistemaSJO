<%@ Page Title="" Language="C#" MasterPageFile="~/Bodegero.Master" AutoEventWireup="true" CodeBehind="ProveedoresB.aspx.cs" Inherits="UI.ProveedoresB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
      <section class="content-header">
        <h1 align="center" >Proveedores</h1>        
        </section>
    
    <section class="content">
    <div class="box box-primary">
        <div class="box-header">
            <div class="box-tools">
                
               </div>
        </div>
        <div class="box-body">
            <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button1_Click" />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#fm-modal-grid"><i class="fa fa-plus">Nuevo</i></button>               
                </span>
              </div>
            <div class="table">
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CssClass="table table-responsive" DataKeyNames="ID_Proveedor" DataSourceID="SqlDataSource1">
                 <Columns>
                     
                     <asp:BoundField DataField="ID_Proveedor" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Proveedor" />
                     <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                     <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor" />
                     <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                     <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                     <asp:BoundField DataField="NIT" HeaderText="NIT" SortExpression="NIT" />
                     <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                     <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                     <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                 </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT ID_Proveedor, Codigo, Proveedor, Direccion, Telefono, NIT, Nombre, Celular, Correo FROM Proveedor WHERE (Estado = 1)" UpdateCommand="EditarProveedor" UpdateCommandType="StoredProcedure" DeleteCommand="EliminarProveedor" DeleteCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_Proveedor" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID_Proveedor" Type="Int32" />
                        <asp:Parameter Name="Codigo" Type="String" />
                        <asp:Parameter Name="Proveedor" Type="String" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Telefono" Type="Int32" />
                        <asp:Parameter Name="nit" Type="Int32" />
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Celular" Type="Int32" />
                        <asp:Parameter Name="Correo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        </div>
           
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
                                    <div>
                                        <label>Codigo</label>
                                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                     <div class="form-group">
                            <label>NIT</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Empresa</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                        </div> 
                                    <div class="form-group">
                            <label >Direccion</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                   
                        <div class="form-group">
                            <label>Telefono</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox5" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                                    <div class="form-group">
                            <label>Nombre</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox7" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                                    <div class="form-group">
                            <label>celular</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox8" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                                    <div class="form-group">
                            <label>Correo proveedor</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox9" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="Button3" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button3_Click" />
								<button class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>

