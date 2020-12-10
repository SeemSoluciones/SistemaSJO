<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="UI.Categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1 align="center">Categorias de los productos</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Cilindraje / Serie motor</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>  
                        <div class="form-group">
                            <label>Linea / Modelo</label>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Modelo" DataValueField="ID_Modelo"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Modelo.ID_Modelo, Modelo.Modelo + ' ' + Marca.Marca AS Modelo FROM Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca"></asp:SqlDataSource>
                        </div>  
                        *Nota: Si va eliminar este seguro que no esta en uso.          
                    </div>
                    <div class="box-footer">
                      <asp:Button ID="Button1" runat="server" Text="Aceptar"  CssClass="btn btn-primary" Width="150" OnClick="Button1_Click" />    
                         <asp:Button ID="Button9" runat="server" Text="Buscar"  CssClass="btn btn-default" Width="150" OnClick="Button9_Click" />          
                    </div>

                    
                    <asp:GridView ID="GridView1" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Rubro" DataSourceID="SqlDataSource3" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton runat="server" Text="Actualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Eliminar"  OnClientClick='return confirm("Desea eliminar el cilindraje / linea motor?");'  CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="ID_Rubro" HeaderText="ID_Rubro" InsertVisible="False" ReadOnly="True" SortExpression="ID_Rubro" />
                            <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                            <asp:BoundField DataField="ID_Modelo" HeaderText="ID_Modelo" SortExpression="ID_Modelo" />
                            <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" ReadOnly="true" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Rubro.ID_Rubro, Rubro.Rubro, Rubro.ID_Modelo, Modelo.Modelo FROM Rubro INNER JOIN Modelo ON Rubro.ID_Modelo = Modelo.ID_Modelo ORDER BY Rubro.Rubro" UpdateCommand="EditarRubro" UpdateCommandType="StoredProcedure" DeleteCommand="DELETE FROM Rubro WHERE (ID_Rubro = @ID_Rubro)">
                        <DeleteParameters>
                            <asp:Parameter Name="ID_Rubro" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Rubro" Type="String" />
                            <asp:Parameter Name="ID_Modelo" Type="Int32" />
                            <asp:Parameter Name="ID_Rubro" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT COUNT(*) AS Total FROM Rubro WHERE (Rubro LIKE '%' + @Rubro + '%') AND (ID_Modelo = @ID_Modelo)">
                        <SelectParameters>
                            <asp:Parameter Name="Rubro"></asp:Parameter>
                            <asp:Parameter Name="ID_Modelo"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                
                 <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Marca productos</label>
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">

                            <asp:Button ID="Button3" CssClass="btn btn-primary"  Width="150" runat="server" Text="Aceptar" OnClick="Button3_Click1" />
                            <asp:Button ID="Button10" CssClass="btn btn-default"  Width="150" runat="server" Text="Buscar" OnClick="Button10_Click1" />
                        </div>
                        <div class="table">
                            <asp:GridView ID="GridView4" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_MaraProd" DataSourceID="SqlDataSource6" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton runat="server" Text="Actualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" CausesValidation="False" ID="LinkButton2"  OnClientClick='return confirm("Desea eliminar la marca del producto?");'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="ID_MaraProd" HeaderText="ID_MaraProd" InsertVisible="False" ReadOnly="True" SortExpression="ID_MaraProd" />
                                    <asp:BoundField DataField="MarcaP" HeaderText="Marca" SortExpression="MarcaP" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_MaraProd], [MarcaP] FROM [MarcaProd]" UpdateCommand="EditarMarcaProd" UpdateCommandType="StoredProcedure" DeleteCommand="DELETE FROM MarcaProd WHERE (ID_MaraProd = @ID_MaraProd)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_MaraProd" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ID_MaraProd" Type="Int32" />
                                    <asp:Parameter Name="MarcaP" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>   
                <div class="box box-primary">
                    <div class="box-body">
                       <div class="form-group">
                           <label>Categoria</label>
                           <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
                        <asp:Button ID="Button7" CssClass="btn btn-primary" runat="server"  Width="200"  Text="Aceptar" OnClick="Button7_Click" />
                        <div class="table">
                            <asp:GridView ID="GridView7" CssClass="table table-responsive"  runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Categoria" DataSourceID="SqlDataSource9" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"  OnClientClick='return confirm("Desea eliminar la categoria?");'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID_Categoria" HeaderText="ID_Categoria" ReadOnly="True" InsertVisible="False" SortExpression="ID_Categoria"></asp:BoundField>
                                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' InsertCommand="INSERT INTO Categoria(Categoria, Estado) VALUES (@Categoria, 1)" SelectCommand="SELECT ID_Categoria, Categoria FROM Categoria WHERE (Estado = 1)" UpdateCommand="UPDATE Categoria SET Categoria = @Categoria WHERE (ID_Categoria = @ID_Categoria)" DeleteCommand="DELETE FROM Categoria WHERE ID_Categoria = @ID_Categoria">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_Categoria" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Categoria"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Categoria"></asp:Parameter>
                                    <asp:Parameter Name="ID_Categoria"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>  
        </div>
             <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Linea/Modelo</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>   
                        <div class="form-group">
                            <label>Marca</label>
                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Marca" DataValueField="ID_Marca"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca]"></asp:SqlDataSource>
                        </div> 
                        *Nota: Si va eliminar, este seguro de eliminar el cilindraje/Serie seleccionado antes.
                    </div>
               
                 <div class="box-footer">
                    <asp:Button ID="Button2" runat="server" Text="Aceptar"  CssClass="btn btn-primary" Width="150" OnClick="Button2_Click" />
                     <asp:Button ID="Button11" runat="server" Text="Buscar"  CssClass="btn btn-default" Width="150" OnClick="Button11_Click" />          
                   </div> 

                    <asp:GridView ID="GridView2" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Modelo" DataSourceID="SqlDataSource4" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton runat="server" Text="Actualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" CausesValidation="False" ID="LinkButton2"  OnClientClick='return confirm("Desea eliminar el modelo?");'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="ID_Modelo" HeaderText="ID_Modelo" ReadOnly="True" InsertVisible="False" SortExpression="ID_Modelo"></asp:BoundField>

                            <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                            <asp:BoundField DataField="ID_Marca" HeaderText="ID_Marca" SortExpression="ID_Marca" />
                            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca"  ReadOnly="true"/>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT Modelo.ID_Modelo, Modelo.Modelo, Modelo.ID_Marca, Marca.Marca FROM Modelo INNER JOIN Marca ON Modelo.ID_Marca = Marca.ID_Marca" UpdateCommand="EditarModelo" UpdateCommandType="StoredProcedure" DeleteCommand="DELETE FROM Modelo WHERE (ID_Modelo = @ID_Modelo)">
                        <DeleteParameters>
                            <asp:Parameter Name="ID_Modelo"></asp:Parameter>
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Modelo" Type="String" />
                            <asp:Parameter Name="ID_Marca" Type="Int32" />
                            <asp:Parameter Name="ID_Modelo" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' SelectCommand="SELECT COUNT(*) AS Total FROM Modelo WHERE (Modelo = @Modelo) AND (ID_Marca = @ID_Marca)">
                        <SelectParameters>
                            <asp:Parameter Name="Modelo"></asp:Parameter>
                            <asp:Parameter Name="ID_Marca"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                 <div class="box box-primary">
                     <div class="box-body">
                         <div class="form-group">
                            <label>Medidas</label>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>  
                     </div>
                     <div class="box-footer">
                         <asp:Button runat="server" ID="Button6" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button6_Click" />
                         <asp:GridView ID="GridView5" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Medida" DataSourceID="SqlDataSource7">
                             <Columns>
                                 <asp:TemplateField ShowHeader="False">
                                     <EditItemTemplate>
                                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                         &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                         &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"  OnClientClick='return confirm("Desea eliminar la medida?");'></asp:LinkButton>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:BoundField DataField="ID_Medida" HeaderText="ID_Medida" InsertVisible="False" ReadOnly="True" SortExpression="ID_Medida" />
                                 <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
                             </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Medida], [Medida] FROM [Medida]" UpdateCommand="EditarMedida" UpdateCommandType="StoredProcedure" DeleteCommand="DELETE FROM Medida WHERE ID_Medida = @ID_Medida">
                             <DeleteParameters>
                                 <asp:Parameter Name="ID_Medida" />
                             </DeleteParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="ID_Medida" Type="Int32" />
                                 <asp:Parameter Name="medida" Type="String" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
                     </div>
                 </div>
                 <div class="box box-primary">
                     <div class="box-body">
                         <div class="form-group">
                             <label>Subcateoria</label>
                             <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                         </div>
                         <div class="form-group">
                             <label>Categoria</label>
                             <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control select2-selection" DataSourceID="SqlDataSource9" DataTextField="Categoria" DataValueField="ID_Categoria"></asp:DropDownList>
                         </div>
                         <asp:Button ID="Button8" runat="server" CssClass="btn btn-primary" Width="200px" Text="Aceptar" OnClick="Button8_Click" />
                         <div class="table">
                             <asp:GridView ID="GridView8" CssClass="table table-responsive" runat="server" DataSourceID="SqlDataSource10" AutoGenerateColumns="False" DataKeyNames="ID_SubCategoria" AllowPaging="True">
                                 <Columns>
                                     <asp:TemplateField ShowHeader="False">
                                         <EditItemTemplate>
                                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"  OnClientClick='return confirm("Desea eliminar la subcategoria?");'></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="ID_SubCategoria" HeaderText="ID_SubCategoria" ReadOnly="True" InsertVisible="False" SortExpression="ID_SubCategoria"></asp:BoundField>
                                     <asp:BoundField DataField="SubCategoria" HeaderText="SubCategoria" SortExpression="SubCategoria"></asp:BoundField>
                                     <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria"></asp:BoundField>
                                 </Columns>
                             </asp:GridView>
                             <asp:SqlDataSource runat="server" ID="SqlDataSource10" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' InsertCommand="INSERT INTO SubCategoria(SubCategoria, Estado, ID_Categoria) VALUES (@SubCategoria, 1, @ID_Categoria)" SelectCommand="SELECT SubCategoria.ID_SubCategoria, SubCategoria.SubCategoria, Categoria.Categoria FROM Categoria INNER JOIN SubCategoria ON Categoria.ID_Categoria = SubCategoria.ID_Categoria WHERE (Categoria.Estado = 1)" UpdateCommand="UPDATE SubCategoria SET SubCategoria = @SubCategoria WHERE (ID_SubCategoria = @ID_SubCategoria)" DeleteCommand="DELETE FROM SubCategoria WHERE ID_SubCategoria = @ID_SubCategoria">
                                 <DeleteParameters>
                                     <asp:Parameter Name="ID_SubCategoria" />
                                 </DeleteParameters>
                                 <InsertParameters>
                                     <asp:Parameter Name="SubCategoria"></asp:Parameter>
                                     <asp:Parameter Name="ID_Categoria"></asp:Parameter>
                                 </InsertParameters>
                                 <UpdateParameters>
                                     <asp:Parameter Name="SubCategoria"></asp:Parameter>
                                     <asp:Parameter Name="ID_SubCategoria"></asp:Parameter>
                                 </UpdateParameters>
                             </asp:SqlDataSource>
                         </div>
                     </div>
                 </div>
            </div> 
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Marca</label>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>              
                    </div>
                
                 <div class ="box-footer">
                     <asp:Button ID="Button5" runat="server" Text="Aceptar"  CssClass="btn btn-primary" Width="200" OnClick="Button3_Click" />       
                 </div>

                    <asp:GridView ID="GridView3" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Marca" DataSourceID="SqlDataSource5" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"  OnClientClick='return confirm("Desea eliminar la marca?");'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID_Marca" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Marca" />
                            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY [Marca]" UpdateCommand="EditarMarca" UpdateCommandType="StoredProcedure" DeleteCommand="DELETE FROM Marca WHERE ID_Marca = @ID_Marca">
                        <DeleteParameters>
                            <asp:Parameter Name="ID_Marca"></asp:Parameter>
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Marca" Type="String" />
                            <asp:Parameter Name="ID_Marca" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Año</label>
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                        </div> 
                    </div>
                    <div class="box-footer">
                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" Width="200px"  Text="Aceptar" OnClick="Button4_Click" />
                       </div>
                    <asp:GridView ID="GridView6" CssClass="table table-responsive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID_Anio" DataSourceID="SqlDataSource8">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"  OnClientClick='return confirm("Desea eliminar el año?");'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID_Anio" HeaderText="ID_Anio" InsertVisible="False" ReadOnly="True" SortExpression="ID_Anio" />
                            <asp:BoundField DataField="Anio" HeaderText="Anio" SortExpression="Anio" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" InsertCommand="INSERT INTO Anio(Anio) VALUES (@Anio)" SelectCommand="SELECT ID_Anio, Anio FROM Anio ORDER BY Anio" UpdateCommand="UPDATE Anio SET Anio = @Anio WHERE (ID_Anio = @ID_Anio)" DeleteCommand="DELETE FROM Anio WHERE ID_Anio = @ID_Anio">
                        <DeleteParameters>
                            <asp:Parameter Name="ID_Anio" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Anio" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Anio" />
                            <asp:Parameter Name="ID_Anio" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
                 </div>
           
        
                  
    </section>
</asp:Content>