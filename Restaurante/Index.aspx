<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Restaurante.Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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


    <script src="../media/js/site.js"></script>
    <link rel="stylesheet" href="../media/css/site.css" />
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="container">
                    <div id="jumppal">
                        <ul id="location" class="list-group">
                        </ul>
                        <br />


                        <ul id="newClient" class="list-group">
                            <li class="list-group-item active">
                                <h1 class="display-5 text-center">Registrar Factura</h1>
                                </></li>
                            <li class="list-group-item">


                                <div class="row">
                                    <div class="col input-group mb-3">

                                        <div class="input-group-prepend adon">

                                            <span class="input-group-text " id="labelIdcliente">Identficación del Cliente *</span>
                                        </div>

                                        <asp:TextBox ID="txtCliente" AutoPostBack="true" class="form-control"
                                            placeholder="Escriba aquí la cedula de cliente " 
                                          aria-describedby="labelIdcliente" data-toggle="tooltip" runat="server" OnTextChanged="txtCliente_TextChanged">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1txtCliente" ControlToValidate="txtCliente"
                                           CssClass="alert-danger" Display="Dynamic" runat="server" ErrorMessage="Cliente requerido"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtCliente_FilteredTextBoxExtender" runat="server" BehaviorID="txtCliente_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtCliente"></ajaxToolkit:FilteredTextBoxExtender>

                                    </div>
                                    <div class="col input-group mb-3">
                                        <div class="input-group-prepend adon">
                                            <span class="input-group-text " id="lbl">Nombre del Cliente*</span>
                                        </div>


                                        <asp:TextBox ID="txtNombreCliente" aria-required="true" aria-invalid="true" class="form-control"
                                            enable="False" ReadOnly="True" MaxLength="50"
                                            aria-label="Default" aria-describedby="labelIdcliente" data-toggle="tooltip" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">


                                    <div class="col input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="labelIdMesero">Identificación del Mesero *</span>
                                        </div>

                                        <asp:TextBox ID="txtMesero" MaxLength="50" class="form-control" AutoPostBack="true" OnTextChanged="txtMesero_TextChanged"
                                            placeholder="Escriba aquí la identificación del mesero" data-toggle="tooltip" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtMesero" ControlToValidate="txtMesero" runat="server"  CssClass="alert-danger"
                                            ErrorMessage="Escriba aquí la identificación del mesero" Display="Dynamic" ToolTip="Escriba aquí la identificación del mesero"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1txtMesero" TargetControlID="txtMesero" FilterType="Numbers" runat="server" />
                                    </div>



                                    <div class="col input-group mb-3">
                                        <div class="input-group-prepend adon">
                                            <span class="input-group-text " id="lblMesero">Nombre del Mesero*</span>
                                        </div>


                                        <asp:TextBox ID="txtNombreMesero" aria-required="true" aria-invalid="true" class="form-control"
                                            enable="False" ReadOnly="True" MaxLength="50"
                                            aria-label="Default" aria-describedby="lblMesero" data-toggle="tooltip" runat="server"></asp:TextBox>
                                    </div>



                                </div>


                                <div class="row">
                                    <div class="col input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text " id="lblPlato">Plato *</span>
                                        </div>


                                        <asp:DropDownList ID="dropPlato" class="form-control" aria-label="Default" aria-describedby="lblPlato" data-toggle="tooltip" runat="server"></asp:DropDownList>
                                    </div>


                                    <div class="col input-group mb-3">
                                        <div class="input-group-prepend adon">
                                            <span class="input-group-text " id="lblCantidad">Cantidad *</span>
                                        </div>

                                        <asp:TextBox ID="txtCantidad" aria-required="true" aria-invalid="true" class="form-control"
                                            MaxLength="50"
                                            aria-label="Default" aria-describedby="lblCantidad" data-toggle="tooltip" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator CssClass="alert-danger" ID="RequiredFieldValidator1txtCantidad" Display="Dynamic"
                                        ControlToValidate="txtCantidad" runat="server" ErrorMessage="Cantidad requerida"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1txtCantidad" TargetControlID="txtCantidad" FilterType="Numbers" runat="server" />

                                    <div class="col input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="lblMesa">Mesa *</span>
                                        </div>
                                        <asp:DropDownList ID="dropMesa" class="form-control"  aria-label="Default" aria-describedby="lblMesa" data-toggle="tooltip" runat="server"></asp:DropDownList>

                                    </div>
                                    <div class="col input-group mb-3">
                                        <br>
                                   
                                        <asp:Button ID="btnAdd" OnClick="Button1_Click" runat="server" class="btn btn-primary"
                                        Text="Añadir a la factura" />
                                           <asp:Button ID="btnBorrar" OnClick="btnBorrar_Click" runat="server" CausesValidation="false" class="btn btn-danger"
                                        Text="Reiniciar Compra" />
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col input-group mb-3">
                                        <%--<asp:GridView ID="GridView1" class="table table-dark" runat="server"></asp:GridView>--%>
                                   
                                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-striped"  GridLines="None" AllowSorting="True" AllowPaging="True" >
                                        <Columns>                                            
                                            <asp:BoundField DataField="idPlato" HeaderText="idPlato" SortExpression="idPlato" />
                                            <asp:BoundField DataField="Plato" HeaderText="Plato" SortExpression="Plato" />
                                            <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                        </Columns>
                                        <EmptyDataTemplate>No existen registros.</EmptyDataTemplate>
                                        <PagerStyle CssClass="bs-pagination" />
                                    </asp:GridView>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    </div>

                                </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <br>
                            
      <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" CausesValidation="false" class="btn btn-success"
                                        Text="Cerrar compra!" />
                        </div>

                    </div>

                    </li>

                </ul>
                </div>






                </div>  
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</body>
</html>
