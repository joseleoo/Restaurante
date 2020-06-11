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
    <script src="http://malsup.github.io/jquery.blockUI.js" type="text/javascript"></script>

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
                <a class="nav-link" href="#Meseros">Indicadores: Meseros</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#Clientes">Indicadores: Clientes</a>
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

            <div class="row">
                <div class="col input-group mb-3">
                    Fecha de inicio<asp:TextBox ID="txtFechaInicio" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtFechaInicio" runat="server" ErrorMessage="Fecha requerida" CssClass="alert-danger" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <ajaxToolkit:CalendarExtender ID="txtFechaInicio_CalendarExtender" runat="server" TargetControlID="txtFechaInicio" DaysModeTitleFormat="dd, MMMM, yyyy" />


                    Fecha final<asp:TextBox ID="txtFechaFinal" CssClass="form-control" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtFechaFinal_CalendarExtender" runat="server" BehaviorID="txtFechaFinal_CalendarExtender" TargetControlID="txtFechaFinal" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="alert-danger" ControlToValidate="txtFechaFinal" runat="server" ErrorMessage="Fecha requerida" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="container">
                    <div id="jumppal">
                        <ul id="" class="list-group">
                        </ul>
                        <br />

                        <ul id="Meseros" class="list-group">
                            <li class="list-group-item active">
                                <h1 class="display-10 text-center">Meseros con mas ventas</h1>
                            </li>
                            <li class="list-group-item">
                                <asp:GridView ID="GridView1" runat="server">
                                    <EmptyDataTemplate>No existen registros.</EmptyDataTemplate>
                                </asp:GridView>



                            </li>

                        </ul>

                        <ul id="Clientes" class="list-group">
                            <li class="list-group-item active">
                                <h1 class="display-10 text-center">Clientes con mas compras</h1>
                            </li>
                            <li class="list-group-item">
                                <div class="row">
                                    Consumo $
                                </div>
                                <div class="row">
                                    <asp:TextBox ID="txtCantidad" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3txtCantidad" runat="server" ControlToValidate="txtCantidad"
                                        Display="Dynamic" ErrorMessage="Consumo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <asp:GridView ID="GridView2" runat="server">
                                    <EmptyDataTemplate>No existen registros.</EmptyDataTemplate>
                                </asp:GridView>



                            </li>

                        </ul>
                          <ul id="Productos" class="list-group">
                            <li class="list-group-item active">
                                <h1 class="display-10 text-center">Productos más solicitados</h1>
                            </li>
                            <li class="list-group-item">                             
                            <span id="maxPro" runat="server"></spa>
                                <asp:GridView ID="GridView3" runat="server">
                                    <EmptyDataTemplate>No existen registros.</EmptyDataTemplate>
                                </asp:GridView>
</span>


                            </li>

                        </ul>

                        <div class="row">
                            <asp:Button ID="btnIndicadores" CssClass="btn-dark" OnClick="btnIndicadores_Click" runat="server" Text="Calcular indicadores" />

                        </div>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
