<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    String Correo = "";
    HttpSession sessionOk = request.getSession();

    if (sessionOk.getAttribute("Correo") == null) {
%>
<jsp:forward page="Login.jsp">
    <jsp:param name="code" value="errorSession" />
</jsp:forward>
<%
    } else {
        Correo = (String) sessionOk.getAttribute("Correo");
    }
%>
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

        <script src="js\jquery-3.6.0.min.js" ></script>       
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="js/toastr.min.js" type="text/javascript"></script>
    </head>
    <style>
        .perfil{
            width: 100%;
            padding: 50px 0;
        }
        .section-title {
            padding-bottom: 30px;
        }
        .section-title h2 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
            padding-bottom: 20px;
            position: relative;
            color: #173b6c;
        }
        .section-title h2::after {
            content: "";
            position: absolute;
            display: block;
            width: 50px;
            height: 3px;
            background: #149ddd;
            bottom: 0;
            left: 0;
        }

    </style>
    <body>
        <div class="perfil">
            <div class="container">
                <form action="svPerfil" method="POST">

                    <div class="section-title">
                        <h2>Actualizar Datos</h2>
                    </div>

                    <div class="row ">
                        <div class="col-lg-4 aos-init aos-animate" data-aos="fade-right">
                            <img src="assets/img/imgGym2.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="col-lg-8 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left">
                            <%
                                Connection con = null;

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    String cadena = "jdbc:mysql://localhost/bd_complejo_deportivo?user=root&password";
                                    con = DriverManager.getConnection(cadena);

                                    Statement sta = con.createStatement();
                                    ResultSet rs = sta.executeQuery("SELECT * FROM dep_usuario WHERE TXTCORREO = '" + Correo + "'");

                                    while (rs.next()) {
                            %>
                            <div class="row" data-aos="fade-in">
                                <div class="form-group col-md-6">
                                    <label for="txtTipoDocumento">TIPO DE DOCUMENTO</label>
                                    <input type="text" name="txtTipoDocumento" value="<%= rs.getString(2)%>" class="form-control txtTipoDocumento" >                             
                                </div>       
                                <div class="form-group col-md-6">
                                    <label for="txtNumDocumento">N° DE DOCUMENTO</label>
                                    <input type="text" name="txtNumDocumento" value="<%= rs.getString(3)%>" class="form-control txtNumDocumento"> 
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="txtNombres">NOMBRE(S)</label>
                                    <input type="text" name="txtNombres" value="<%= rs.getString(4)%>" class="form-control txtNombres"> 
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="txtApellidoPaterno">APE. PATERNO</label>
                                    <input type="text" name="txtApellidoPaterno" value="<%= rs.getString(5)%>" class="form-control txtApellidoPaterno">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="txtApellidoMaterno">APE. MATERNO</label>
                                    <input type="text" name="txtApellidoMaterno" value="<%= rs.getString(6)%>" class="form-control txtApellidoMaterno">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="txtCorreo">CORREO</label>
                                    <input type="email" name="txtCorreoRegistrar"  value="<%= rs.getString(7)%>" class="form-control txtCorreoRegistrar" onblur="ValidarCorreoRegistrar(this.value);">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txtCelular">CELULAR</label>
                                    <input type="text" name="txtCelular" value="<%= rs.getString(8)%>" class="form-control txtCelular">
                                </div>                            
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="txtPassword">CONTRASEÑA</label>
                                    <input type="password" name="txtPassword" placeholder="Contraseña" class="form-control txtPasswordRegistrar">
                                </div>
                            </div>

                            <%
                                    }
                                } catch (Exception e) {
                                    System.out.println("Error: " + e);
                                }
                            %>

                            <div class="row">  
                                <div class="form-group col-md-4">
                                    <input type="submit" class="btn  btn-primary ActualizarUsuario" value="Actualizar">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" >

            $(document).ready(function ()
            {
                $('.txtTipoDocumento, .txtNombres, .txtApellidoPaterno, .txtApellidoMaterno, .txtTipoDocumento, .txtNumDocumento').attr('disabled', true);

                $('.txtCelular').attr('maxlength', '9');
                $('.txtCorreoRegistrar').attr('maxlength', '70');
                $('.txtCelular').bind('keypress', function (event)
                {
                    var regex = new RegExp("^[0-9]+$");
                    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                    if (!regex.test(key))
                    {
                        event.preventDefault();
                        return false;
                    }
                });
            });

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

            function ClearToastr() {
                toastr.clear();
            }

            $('.ActualizarUsuario').on('click', function () {
                ClearToastr();
                debugger;
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

            });

        </script>
    </body>
</html>
