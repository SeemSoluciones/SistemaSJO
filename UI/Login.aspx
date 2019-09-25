<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Login1" %>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Login - Login </title>

  <link rel="stylesheet" href="Login/css/reset.css">

    <link rel="stylesheet" href="Login/css/style.css" media="screen" type="text/css" />

</head>

<body>
    <form id="form1" runat="server">
  <div class="wrap">
		<div class="avatar">
      <img src="Login/imagenes/SJ.jpg">
		</div>
		
<asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario"  required="Usuario"></asp:TextBox><br />
		
		
<asp:TextBox ID="TextBox1" runat="server" placeholder="Contraseña" TextMode="Password" required="password"></asp:TextBox><br />
		
	
    
          <asp:Button ID="Button1" runat="server" Text="Acceder" width="100%" OnClick="Button1_Click" />
     
   
      
	</div>
        <script src="Login/js/index.js"></script>
</form>
</body>

</html>
