<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TipoDePago.aspx.cs" Inherits="UI.TipoDePago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <section class="content-header">
        <h1>Tipo de pagos</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Tipo de pago</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ></asp:TextBox>
                        </div>
                    </div>

               
                <div class="box-footer">
          
                
                        <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-primary pull-right" Width="200" OnClick="Button1_Click" />
                  
            </div> 

                </div>
            <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Tipo de pago</label>
                        </div>
                        <div class="form-group">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="table table-responsive" AutoGenerateColumns="False" DataKeyNames="ID_TPago" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="ID_TPago" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_TPago" />
                                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" DeleteCommand="EliminarTipoDePago" DeleteCommandType="StoredProcedure" SelectCommand="SELECT ID_TPago, Tipo FROM TipoPago
WHERE Estado = 1" UpdateCommand="EditarTipoDePago" UpdateCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_Tpago" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ID_Tpago" Type="Int32" />
                                    <asp:Parameter Name="Tipo" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
       
    </section>
</asp:Content>
