<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedor.Master" AutoEventWireup="true" CodeBehind="RegistroV.aspx.cs" Inherits="UI.RegistroV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Usuario" runat="server" id="usuario"/>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" runat="server" id="contra1"/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Retype password" runat="server" id="contra2"/>
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
            </div>
        <!-- /.col -->
        <div class="col-xs-4">
            <asp:Button ID="Button1" runat="server" Text="Modificar" CssClass="btn btn-primary btn-block btn-flat" OnClick="Button1_Click1" />
        </div>
        <!-- /.col -->
      </div>
</asp:Content>
