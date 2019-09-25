<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TipoDePrecio.aspx.cs" Inherits="UI.TipoDePrecio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section class="content-header">
        <h1>Tipo de precios</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Tipo de precio</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ></asp:TextBox>
                        </div>
                    </div>

                </div>
                 <table align="center">
                <tr>
                    <td> 
                        <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" />
                    </td>
                    <td> 
                        <asp:Button ID="Button2" runat="server" Text="Cancelar" CssClass="btn btn-danger" width="200"/>
                    
                    </td>
                </tr>
            </table>
            </div>
           
        </div>
    </section>
</asp:Content>
