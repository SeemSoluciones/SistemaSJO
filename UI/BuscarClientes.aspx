<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscarClientes.aspx.cs" Inherits="UI.BuscarClientes" %>
<!DOCTYPE html>
<head runat="server">
	
	<style>
		body {
			padding-top: 54px;
			/*padding-bottom: 54px;*/
		}

		.nav a {
			color: #fff;
			padding: 15px;
			display: inline-block;
		}

		.nav a:hover {
			background: #000;
		}
	</style>
</head>
<body>
	<header>
		<nav class="nav fixed-top bg-primary d-flex justify-content-center">
			<a href="#" class="nav-link">Inicio</a>
			<a href="#" class="nav-link">Salir</a>
		</nav>
	</header>

	<div class="container">
		<div class="row mt-3" style="margin-bottom: 1000px;">
			<div class="col">
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
			</div>
		</div>

		<div class="row mt-3" style="margin-bottom: 1000px;">
			<div class="col">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
				quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
				consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
				cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
				proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			</div>
		</div>
	</div>
	
</body>