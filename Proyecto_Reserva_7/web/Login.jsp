<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sistema de Reserva</title>


        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet">

        <link href="js/toastr.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="css/styleLogin.css" rel="stylesheet" type="text/css"/>
        <script src="js\jquery-3.6.0.min.js" ></script>       
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="js/toastr.min.js" type="text/javascript"></script>

        <style>
            /*    .popup form .contenedor-inputs input {
                    width: 100%;
                    margin-bottom: 20px;
                   
                    border: 1px solid #BBBBBB;
            */
        </style>

    </head>

    <body>
        <section class="login-block">
            <div class="container">
                <form action="servlet1" method="POST">
                    <input type="hidden" name="op" value="login" />
                    <div class="row">
                        <div class="col-md-4 login-sec">
                            <center>
                                <img src="img/logo-msi.png" alt="" width="150" height="70"/>
                            </center>
                            <h2 class="text-center">Sistema de Reservas</h2>
                            </br>
                            <form class="login-form">
                                <div class="form-group">
                                    <!-- <label for="exampleInputEmail1" class="text-uppercase">Correo</label>-->
                                    <input name="txtCorreo" type="text" placeholder="Correo" class="form-control txtCorreo" onblur="ValidarCorreo(this.value);">
                                </div>
                                <div class="form-group">
                                    <!-- <label for="exampleInputPassword1" class="text-uppercase">Contraseña</label>-->
                                    <input name="txtPassword" type="password" placeholder="Contraseña" class="form-control txtPassword">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-login float-right LoginValidate" value="Submit">Ingresar</button>
                                </div>
                                <div class="form-group">
                                    <label class="form-check-label"> 
                                        <a id="btn-abrir-popup" class="btn-abrir-popup" style="cursor: pointer;
                                           color: #007bff" onclick="$('#modalRegistrar').modal('show')" ><font style="vertical-align: inherit;">¿No te has registrado? Click Aquí</font></font></a>
                                        </br>
                                        <a id="btn-abrir-popup2" class="btn-abrir-popup" style="cursor: pointer;
                                           color: #007bff" onclick="$('#modalRecuperarCuenta').modal('show')"><font style="vertical-align: inherit;">¿Se te olvidó tu contraseña? Click Aquí</font></font></a>
                                    </label>

                                </div>
                            </form>
                        </div>
                        <div class="col-md-8 banner-sec">
                        </div>
                    </div>

                </form>

                <div id="modalRegistrar" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header login-tittle">              
                                <h2 class="modal-title" style="text-align: center; color: #00a65a;">Registrar Usuario</h2>         
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="box-body">

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <select name="txtTipoDocumento"  class="form-control txtTipoDocumento">
                                                <option value="-1">- Seleccione Tipo Documento - </option>
                                                <%
                                                    Connection con = null;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        String cadena = "jdbc:mysql://localhost/bd_complejo_deportivo?user=root&password";
                                                        con = DriverManager.getConnection(cadena);

                                                        Statement sta = con.createStatement();
                                                        ResultSet rs = sta.executeQuery("SELECT * FROM dep_tipodocumento");

                                                        while (rs.next()) {
                                                %>
                                                <option value="<%= rs.getString(1)%>"><%= rs.getString(2)%></option>
                                                <%
                                                        }
                                                    } catch (Exception e) {
                                                        System.out.println("Error: " + e);
                                                    }
                                                %>
                                            </select> 
                                        </div>

                                        <div class="form-group col-md-6">
                                            <input type="text" name="txtNumeroDocumento"  placeholder="Número Documento" class="form-control txtNumeroDocumento">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <input type="text" name="txtNombres" placeholder="Nombres" class="form-control txtNombres">                                          
                                        </div>
                                        <div class="form-group col-md-4">
                                            <input type="text" name="txtApellidoPaterno" placeholder="Apellido Paterno" class="form-control txtApellidoPaterno">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <input type="text" name="txtApellidoMaterno" placeholder="Apellido Materno" class="form-control txtApellidoMaterno">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <input type="email" name="txtCorreo"  placeholder="Correo" class="form-control txtCorreoRegistrar" onblur="ValidarCorreoRegistrar(this.value);">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <input type="text" name="txtCelular" placeholder="Celular" class="form-control txtCelular">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <input type="password" name="txtPassword" placeholder="Contraseña" class="form-control txtPasswordRegistrar">
                                        </div>
                                    </div>
                                    <div class="row">  
                                        <div class="form-group col-md-4">
                                            <input type="submit" class="btn  btn-primary RegistrarUsuario" value="Registrar">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="modalRecuperarCuenta" class="modal fade bd-example-modal-md" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog modal-md" role="document">
                        <div class="modal-content">
                            <div class="modal-header login-tittle">              
                                <h2 class="modal-title" style="text-align: center; color: #00a65a;">Recuperar Cuenta</h2>         
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="box-body">

                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <select name="indentificacion"class="form-control indentificacion">
                                                <option value="-1">- Seleccione Tipo Documento -</option>
                                                <option value="DNI">DNI</option>
                                                <option value="CE">Carnet Extranjeria</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <input type="text" placeholder="Número Documento" name="txtNumDocumentoRecuperarCuenta" class="form-control txtNumDocumentoRecuperarCuenta">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <input type="email" placeholder="Correo" name="txtCorreoRecuperarCuenta" class="form-control txtCorreoRecuperarCuenta" onblur="ValidarCorreoRegistrar(this.value);">
                                        </div>
                                    </div>
                                    <div class="row">  
                                        <div class="form-group col-md-4">
                                            <input type="submit" class="btn btn-primary RecuperarCuenta" value="Enviar Solicitud">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




        </section>
        <script type="text/javascript" >

            $(document).ready(function ()
            {
                valnum();
                valletr();
                $('.txtCelular').attr('maxlength', '9');
                $('.txtNombres, .txtApellidoPaterno, .txtApellidoMaterno').attr('maxlength', '50');
                $('.txtCorreoRegistrar').attr('maxlength', '70');

            });

            toastr.clear();
            function ValidarCorreo(value) {
                ClearToastr();
                if (!ValidarFormatoEmail(value))
                {
                    toastr.error('El correo ' + value + ', no tiene el formato correcto');
                    $('.txtCorreo').val('');
                    return false;
                }
            }

            function ValidarCorreoRegistrar(value) {
                ClearToastr();
                if (!ValidarFormatoEmail(value))
                {
                    toastr.error('El correo ' + value + ', no tiene el formato correcto');
                    //  $('.txtCorreoRegistrar').val('');
                    return false;
                }
            }
            function ValidarFormatoEmail(Email)
            {
                var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                if (filter.test(Email))
                {
                    return true;
                } else
                {
                    return false;
                }
            }

            $('.LoginValidate').on('click', function () {
                ClearToastr();
                if ($('.txtCorreo').val() === '') {
                    toastr.error('Digite su correo');
                    return false;
                }
                if ($('.txtPassword').val() === '') {
                    toastr.error('Digite su contraseña');
                    return false;
                }
            });

            $('.RegistrarUsuario').on('click', function () {
                ClearToastr();

                if ($('.txtTipoDocumento').val() === '-1') {
                    toastr.error('Seleccione tipo de documento');
                    return false;
                }

                if ($('.txtNumeroDocumento').val() === '') {
                    toastr.error('Digite su N° de documento');
                    return false;
                }

                if ($('.txtNombres').val() === '') {
                    toastr.error('Digite su Nombre');
                    return false;
                }
                if ($('.txtApellidoPaterno').val() === '') {
                    toastr.error('Digite su Apellido Paterno');
                    return false;
                }

                if ($('.txtCorreoRegistrar').val() === '') {
                    toastr.error('Digite su Correo');
                    return false;
                }
                if (!ValidarFormatoEmail($('.txtCorreoRegistrar').val()))
                {
                    toastr.error('El correo ' + $('.txtCorreoRegistrar').val() + ', no tiene el formato correcto');
                    return false;
                }

                if ($('.txtCelular').val() === '') {
                    toastr.error('Digite su N° de celular');
                    return false;
                } else if ($('.txtCelular').val().length < 9) {
                    toastr.error('N° de celular debe tener 9 digitos');
                    return false;
                }

                if ($('.txtPasswordRegistrar').val() === '') {
                    toastr.error('Digite su contraseña');
                    return false;
                } else if ($('.txtPasswordRegistrar').val().length < 5) {
                    toastr.error('No es una contraseña segura');
                    return false;
                }
            });

            $('.RecuperarCuenta').on('click', function () {
                ClearToastr();

                if ($('.indentificacion').val() === '-1') {
                    toastr.error('Seleccione tipo de documento');
                    return false;
                }

                if ($('.txtNumDocumentoRecuperarCuenta').val() === '') {
                    toastr.error('Digite su N° de documento');
                    return false;
                }
                if ($('.txtCorreoRecuperarCuenta').val() === '') {
                    toastr.error('Digite su Correo');
                    return false;
                }
                if (!ValidarFormatoEmail($('.txtCorreoRecuperarCuenta').val()))
                {
                    toastr.error('El correo ' + $('.txtCorreoRecuperarCuenta').val() + ', no tiene el formato correcto');
                    return false;
                }
            });


            $('.txtNumeroDocumento, .txtNumDocumentoRecuperarCuenta').attr('disabled', true);
            $('.txtTipoDocumento').change(function ()
            {
                $('.txtNumeroDocumento').val('');
                valnum();
                $('.txtNumeroDocumento').attr('disabled', false);
                switch (this.value) {
                    case 'CE':
                    case 'PS':
                        $('.txtNumeroDocumento').attr('maxlength', '12');
                        $('.txtNumeroDocumento').off('keypress');
                        break;
                    case 'DNI':
                        $('.txtNumeroDocumento').attr('maxlength', '8');
                        break;
                    case '-1':
                        $('.txtNumeroDocumento').attr('disabled', true);
                        break;
                }
            });

            $('.indentificacion').change(function ()
            {
                $('.txtNumDocumentoRecuperarCuenta').val('');
                valnum();
                $('.txtNumDocumentoRecuperarCuenta').attr('disabled', false);
                switch (this.value) {
                    case 'CE':
                    case 'PS':
                        $('.txtNumDocumentoRecuperarCuenta').attr('maxlength', '12');
                        $('.txtNumDocumentoRecuperarCuenta').off('keypress');
                        break;
                    case 'DNI':
                        $('.txtNumDocumentoRecuperarCuenta').attr('maxlength', '8');
                        break;
                    case '-1':
                        $('.txtNumDocumentoRecuperarCuenta').attr('disabled', true);
                        break;
                }
            });



            function valnum()
            {
                $('.txtNumeroDocumento, .txtCelular, .txtNumDocumentoRecuperarCuenta ').bind('keypress', function (event)
                {
                    var regex = new RegExp("^[0-9]+$");
                    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                    if (!regex.test(key))
                    {
                        event.preventDefault();
                        return false;
                    }
                });
            }

            function valletr() {
                $('.txtNombres, .txtApellidoPaterno, .txtApellidoMaterno').bind('keypress', function (event)
                {
                    var regex = new RegExp("^[a-zA-Z ]+$");
                    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                    if (!regex.test(key))
                    {
                        event.preventDefault();
                        return false;
                    }
                });
            }


            function ClearToastr() {

                toastr.clear();
            }


        </script>

    </body>

</html>
