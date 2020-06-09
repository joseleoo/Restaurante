<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Indicadores.aspx.cs" Inherits="Restaurante.Indicadores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registrar Compra</title>
    <!--bootstrap-->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <!--validations-->
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css" />


    <script src="Content/media/js/site.js"></script>
    <link rel="stylesheet" href="Content/media/css/site.css" />
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
    <nav id="navbar" class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <a id="navbar" class="navbar-brand" href="#">Mapa del sitio</a>
        <ul class="nav nav-pills">
            <li class="nav-item ">
                <a class="nav-link" href="Index.aspx">Registrar Factura</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Indicadores.aspx">Indicadores: Meseros</a>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div class="alert alert-success" id="saveSucces" role="alert">
                EN CONSTRUCCION
            </div>


            Fecha de inicio<asp:TextBox ID="txtFechaInicio" CssClass="form-control" runat="server"></asp:TextBox>

            <ajaxToolkit:CalendarExtender ID="txtFechaInicio_CalendarExtender" runat="server" TargetControlID="txtFechaInicio" />

            Fecha final<asp:TextBox ID="txtFechaFinal" CssClass="form-control" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="txtFechaFinal_CalendarExtender" runat="server" BehaviorID="txtFechaFinal_CalendarExtender" TargetControlID="txtFechaFinal" />



            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div class="container">
                        <div id="jumppal">
                            <ul id="location" class="list-group">
                            </ul>
                            <br />


                            <ul id="newClient" class="list-group">
                                <li class="list-group-item active">
                                    <h1 class="display-5 text-center">Meseros con mas ventas</h1>
                                    </li>
                                <li class="list-group-item">
                                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>

                                    <div class="row">

                                    </div>
                                </li>

                            </ul>
                        </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
