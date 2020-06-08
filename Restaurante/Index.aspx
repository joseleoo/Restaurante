<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Restaurante.Index" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <!--bootstrap-->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

        <!--validations-->
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css"/>


    <script src="../media/js/site.js"></script>
    <link rel="stylesheet" href="../media/css/site.css"/>
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
     <div class="container">
            <div id="jumppal">
                         <ul id="location" class="list-group">
  
                </ul>
                <br />
                 
                
                <ul id="newClient" class="list-group">
                    <li class="list-group-item active"> <h1 class="display-5 text-center">Registrar Factura</h1></></li>
                    <li class="list-group-item">


                        <div class="row">
                            <div class="col input-group mb-3">

                                <div class="input-group-prepend adon">
                                    <span class="input-group-text " id="labelIdcliente">Cliente *</span>
                                </div>

                  
                                <asp:TextBox ID="txtCliente" aria-required="true" aria-invalid="true" class="form-control"
                                   placeholder="Escriba aquí la identificación de cliente"
                                       aria-label="Default" aria-describedby="labelIdcliente" data-toggle="tooltip" required="true" runat="server"></asp:TextBox>

                                <ajaxToolkit:FilteredTextBoxExtender ID="txtCliente_FilteredTextBoxExtender" runat="server" BehaviorID="txtCliente_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtCliente">
                                </ajaxToolkit:FilteredTextBoxExtender>

                            </div>
                            <div class="col input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="labelIdMesero">Mesero *</span>
                                </div>

                                <asp:TextBox ID="TextBox1"  maxlength="15" class="form-control" 
                                       placeholder="Escriba aquí la identificación del mesero" data-toggle="tooltip" requiredrunat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="labelncomercial">Plato *</span>

                                </div>
                                <input type="text" maxlength="250" class="form-control" id="ncomercial" name="ncomercial"
                                       placeholder="Escriba aquí el nombre comercial" required>
                            </div>
							<div class="col input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Cantidad *</span>
                                </div>
                                <input type="text" maxlength="15" class="form-control" id="nif" name="nif"
                                       placeholder="Escriba aquí la identificación del mesero" data-toggle="tooltip" required>

                            </div>
							<div class="col input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Nro Mesa *</span>
                                </div>
                                <input type="text" maxlength="15" class="form-control" id="nif" name="nif"
                                       placeholder="Escriba aquí la identificación del mesero" data-toggle="tooltip" required>

                            </div >
							     <div class="col input-group mb-3">
                                <br>
                                <button type="submit" data-toggle="tooltip" id="save" class="btn btn-primary">Añadir a la factura</button>

                            </div>
                        </div>
						    
                        </div>
                   
                        <div class="row">
                            <div class="col">
                                <br>
                                <button type="submit" data-toggle="tooltip" id="save" class="btn btn-success">Guardar</button>

                            </div>
                            <!-- <div class="col"> -->
                                <!-- <br> -->
                                <!-- <button type="button" data-toggle="tooltip" class="btn btn-dark">Cerrar</button> -->
                            <!-- </div> -->
                        </div>

                    </li>

                </ul>
                </div>
       


            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Button" />


     </div>
    </form>
</body>
</html>
