<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Restaurante.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <!--bootstrap-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

        <!--validations-->
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css">


    <script src="../media/js/site.js"></script>
    <link rel="stylesheet" href="../media/css/site.css">
</head>
<body>

     <nav id="navbar" class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <a id="navbar" class="navbar-brand" href="#">Mapa del sitio</a>
        <ul class="nav nav-pills">
             <li class="nav-item "> 
                 <a class="nav-link" href="#newClient">Registrar Factura</a> 
             </li> 
            <li class="nav-item">
                <a class="nav-link" href="#location">Indicadores: Meseros</a>
            </li>
		<li class="nav-item"> 
                <a class="nav-link" href="#location">Indicadores: Clientes</a> 
            </li>
 <li class="nav-item"> 
                <a class="nav-link" href="#location">Indicadores: Productos</a> 
            </li>

        </ul>
    </nav>

    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Button" />
        </div>
    </form>
</body>
</html>
