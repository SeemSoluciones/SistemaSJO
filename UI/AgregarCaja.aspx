<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AgregarCaja.aspx.cs" Inherits="UI.AgregarCaja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="content-header">
       <h2>Conceptos para retiros</h2>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label>Nuevo concepto</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-success" Width="200px" OnClick="Button1_Click" />
        </div>
        <div class="col-md-4">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" DataKeyNames="ID_Conceptos" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="ID_Conceptos" HeaderText="ID_Conceptos" InsertVisible="False" ReadOnly="True" SortExpression="ID_Conceptos" />
                    <asp:BoundField DataField="Concepto" HeaderText="Concepto" SortExpression="Concepto" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDautorepuestoConnectionString %>" InsertCommand="INSERT INTO Conceptos(Concepto) VALUES (@Concepto)" SelectCommand="SELECT ID_Conceptos, Concepto FROM Conceptos" UpdateCommand="UPDATE Conceptos SET Concepto = @Concepto WHERE (ID_Conceptos = @ID_Conceptos)">
                <InsertParameters>
                    <asp:Parameter Name="Concepto" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Concepto" />
                    <asp:Parameter Name="ID_Conceptos" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        <div class="col-md-4">

        </div>
    </div>

</asp:Content>
