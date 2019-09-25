<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AgreCajas.aspx.cs" Inherits="UI.AgreCajas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="content-header">
       <h2>Cajas</h2>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label>Caja</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label> </label>
                 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control select2-container" DataSourceID="SqlDataSource2" DataTextField="Tienda" DataValueField="ID_Tienda"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" SelectCommand="SELECT [ID_Tienda], [Tienda] FROM [Tienda]"></asp:SqlDataSource>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-success" Width="200px" OnClick="Button1_Click" />

        </div>
        <div class="col-md-4">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" DataKeyNames="ID_Caja" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="ID_Caja" HeaderText="ID_Caja" InsertVisible="False" ReadOnly="True" SortExpression="ID_Caja" />
                    <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja" />
                    <asp:BoundField DataField="Tienda" HeaderText="Tienda" SortExpression="Tienda" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" InsertCommand="INSERT INTO Caja(Caja, ID_Tienda) VALUES (@Caja, @ID_Tienda)" SelectCommand="SELECT Caja.ID_Caja, Caja.Caja, Tienda.Tienda FROM Caja INNER JOIN Tienda ON Caja.ID_Tienda = Tienda.ID_Tienda WHERE (Tienda.Estado = 1)" UpdateCommand="UPDATE Caja SET Caja = @Caja WHERE (ID_Caja = @ID_Caja)">
                <InsertParameters>
                    <asp:Parameter Name="Caja" />
                    <asp:Parameter Name="ID_Tienda" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Caja" />
                    <asp:Parameter Name="ID_Caja" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        <div class="col-md-4">

        </div>
    </div>
</asp:Content>
