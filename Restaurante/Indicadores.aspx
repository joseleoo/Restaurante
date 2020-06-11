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
    <script type="text/javascript" src="../Scripts/jquery.blockUI.js"></script>
    <script type="text/javascript" src="../Scripts/General.js"></script>
  
  
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


        </ul>
    </nav>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
           

           
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div class="container">
                        <div id="jumppal">
                            <ul id="" class="list-group">
                            </ul>
                            <br />
                             <div class="row">
                <div class="col input-group mb-3">
                    Fecha de inicio<asp:TextBox ID="txtFechaInicio" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtFechaInicio" runat="server" ErrorMessage="Fecha requerida" CssClass="alert-danger" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <ajaxToolkit:CalendarExtender ID="txtFechaInicio_CalendarExtender" runat="server" TargetControlID="txtFechaInicio" DaysModeTitleFormat="MM/dd/yyyy" Format="MM/dd/yyyy" TodaysDateFormat="MM/dd/yyyy" />
                     <asp:RegularExpressionValidator CssClass="alert-danger" ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ControlToValidate="txtFechaInicio" ErrorMessage="pon una fecha valida" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                

                    Fecha final<asp:TextBox ID="txtFechaFinal" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator  CssClass="alert-danger" ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtFechaFinal" ErrorMessage="pon una fecha valida" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    <ajaxToolkit:CalendarExtender ID="txtFechaFinal_CalendarExtender" runat="server" BehaviorID="txtFechaFinal_CalendarExtender" TargetControlID="txtFechaFinal" DaysModeTitleFormat="MM/dd/yyyy" Format="MM/dd/yyyy" TodaysDateFormat="MM/dd/yyyy" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="alert-danger" ControlToValidate="txtFechaFinal" runat="server" ErrorMessage="Fecha requerida" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
                            <ul id="Meseros" class="list-group">
                                <li class="list-group-item active">
                                    <h1 class="display-10 text-center">Meseros con mas ventas</h1>
                                </li>
                                <li class="list-group-item">
                                    <asp:GridView ID="GridView1"  CssClass="table table-dark table-hover table-striped"  runat="server">
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
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtCantidad_FilteredTextBoxExtender" runat="server" BehaviorID="txtCantidad_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtCantidad" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3txtCantidad" runat="server" ControlToValidate="txtCantidad"
                                            Display="Dynamic" ErrorMessage="Consumo requerido" CssClass="alert-danger" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:GridView ID="GridView2" CssClass="table table-dark table-hover table-striped"  runat="server">
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
                                <asp:GridView ID="GridView3"  CssClass="table table-dark table-hover table-striped"  runat="server">
                                    <EmptyDataTemplate>No existen registros.</EmptyDataTemplate>
                                </asp:GridView>
                                    </span>
    <div class="row">
        <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert-danger" DisplayMode="SingleParagraph" runat="server" />
                                <asp:Button ID="btnIndicadores" CssClass="btn btn-dark" OnClick="btnIndicadores_Click" runat="server" Text="Calcular indicadores" />

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
