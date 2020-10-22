<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="UI.Categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            min-height: .01%;
            overflow-x: auto;
            overflow-y: hidden;
            -ms-overflow-style: -ms-autohiding-scrollbar;
            overflow: auto;
            border: 1px solid #ddd;
            margin-bottom: 15px;
        }
    </style>
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
                    </div>
                    <div class="box-footer">
                      <asp:Button ID="Button1" runat="server" Text="Aceptar"  CssClass="btn btn-primary" Width="200" OnClick="Button1_Click" />            
                    </div>

                    
                    <asp:GridView ID="GridView1" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Rubro" DataSourceID="SqlDataSource3" AllowPaging="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ID_Rubro" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Rubro" />
                            <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                            <asp:BoundField DataField="ID_Modelo" HeaderText="ID_Modelo" SortExpression="ID_Modelo" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Rubro], [Rubro], [ID_Modelo] FROM [Rubro] ORDER BY [Rubro]" UpdateCommand="EditarRubro" UpdateCommandType="StoredProcedure">
                        <UpdateParameters>
                            <asp:Parameter Name="Rubro" Type="String" />
                            <asp:Parameter Name="ID_Modelo" Type="Int32" />
                            <asp:Parameter Name="ID_Rubro" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                
                 <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Marca productos</label>
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="Button3" CssClass="btn btn-primary"  Width="200" runat="server" Text="Aceptar" OnClick="Button3_Click1" />
                        </div>
                        <div class="table">
                            <asp:GridView ID="GridView4" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_MaraProd" DataSourceID="SqlDataSource6" AllowPaging="True">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:BoundField DataField="ID_MaraProd" HeaderText="ID_MaraProd" InsertVisible="False" ReadOnly="True" SortExpression="ID_MaraProd" />
                                    <asp:BoundField DataField="MarcaP" HeaderText="Marca" SortExpression="MarcaP" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_MaraProd], [MarcaP] FROM [MarcaProd]" UpdateCommand="EditarMarcaProd" UpdateCommandType="StoredProcedure">
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
                            <asp:GridView ID="GridView7" CssClass="table table-responsive"  runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Categoria" DataSourceID="SqlDataSource9">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:BoundField DataField="ID_Categoria" HeaderText="ID_Categoria" ReadOnly="True" InsertVisible="False" SortExpression="ID_Categoria"></asp:BoundField>
                                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' InsertCommand="INSERT INTO Categoria(Categoria, Estado) VALUES (@Categoria, 1)" SelectCommand="SELECT ID_Categoria, Categoria FROM Categoria WHERE (Estado = 1)" UpdateCommand="UPDATE Categoria SET Categoria = @Categoria WHERE (ID_Categoria = @ID_Categoria)">
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
                    </div>
               
                 <div class="box-footer">
                    <asp:Button ID="Button2" runat="server" Text="Aceptar"  CssClass="btn btn-primary" Width="200" OnClick="Button2_Click" />          
                   </div> 

                    <asp:GridView ID="GridView2" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Modelo" DataSourceID="SqlDataSource4" AllowPaging="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ID_Modelo" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Modelo" />
                            <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                            <asp:BoundField DataField="ID_Marca" HeaderText="ID_Marca" SortExpression="ID_Marca" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Modelo], [Modelo], [ID_Marca] FROM [Modelo]" UpdateCommand="EditarModelo" UpdateCommandType="StoredProcedure">
                        <UpdateParameters>
                            <asp:Parameter Name="Modelo" Type="String" />
                            <asp:Parameter Name="ID_Marca" Type="Int32" />
                            <asp:Parameter Name="ID_Modelo" Type="Int32" />
                        </UpdateParameters>
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
                                 <asp:CommandField ShowEditButton="True" />
                                 <asp:BoundField DataField="ID_Medida" HeaderText="ID_Medida" InsertVisible="False" ReadOnly="True" SortExpression="ID_Medida" />
                                 <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
                             </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Medida], [Medida] FROM [Medida]" UpdateCommand="EditarMedida" UpdateCommandType="StoredProcedure">
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
                             <asp:GridView ID="GridView8" CssClass="table table-responsive" runat="server" DataSourceID="SqlDataSource10" AutoGenerateColumns="False" DataKeyNames="ID_SubCategoria">
                                 <Columns>
                                     <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                     <asp:BoundField DataField="ID_SubCategoria" HeaderText="ID_SubCategoria" ReadOnly="True" InsertVisible="False" SortExpression="ID_SubCategoria"></asp:BoundField>
                                     <asp:BoundField DataField="SubCategoria" HeaderText="SubCategoria" SortExpression="SubCategoria"></asp:BoundField>
                                     <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria"></asp:BoundField>
                                 </Columns>
                             </asp:GridView>
                             <asp:SqlDataSource runat="server" ID="SqlDataSource10" ConnectionString='<%$ ConnectionStrings:BDautorepuestoConnectionString %>' InsertCommand="INSERT INTO SubCategoria(SubCategoria, Estado, ID_Categoria) VALUES (@SubCategoria, 1, @ID_Categoria)" SelectCommand="SELECT SubCategoria.ID_SubCategoria, SubCategoria.SubCategoria, Categoria.Categoria FROM Categoria INNER JOIN SubCategoria ON Categoria.ID_Categoria = SubCategoria.ID_Categoria WHERE (Categoria.Estado = 1)" UpdateCommand="UPDATE SubCategoria SET SubCategoria = @SubCategoria WHERE (ID_SubCategoria = @ID_SubCategoria)">
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
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ID_Marca" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Marca" />
                            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Marca], [Marca] FROM [Marca] ORDER BY [Marca]" UpdateCommand="EditarMarca" UpdateCommandType="StoredProcedure">
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
                           <asp:Button ID="Button4" runat="server" Text="Aceptar"  CssClass="btn btn-primary" Width="200" OnClick="Button4_Click"/>
                    </div>
                    <asp:GridView ID="GridView6" CssClass="table table-responsive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID_Anio" DataSourceID="SqlDataSource8">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ID_Anio" HeaderText="ID_Anio" InsertVisible="False" ReadOnly="True" SortExpression="ID_Anio" />
                            <asp:BoundField DataField="Anio" HeaderText="Anio" SortExpression="Anio" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" InsertCommand="INSERT INTO Anio(Anio) VALUES (@Anio)" SelectCommand="SELECT ID_Anio, Anio FROM Anio ORDER BY Anio" UpdateCommand="UPDATE Anio SET Anio = @Anio WHERE (ID_Anio = @ID_Anio)">
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