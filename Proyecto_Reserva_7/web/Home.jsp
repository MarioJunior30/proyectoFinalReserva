<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    String nombres = "";
    String ApePaterno = "";
    HttpSession sessionOk = request.getSession();

    if (sessionOk.getAttribute("nombres") == null) {
%>
<jsp:forward page="Login.jsp">
    <jsp:param name="code" value="errorSession" />
</jsp:forward>
<%
    } else {
        nombres = (String) sessionOk.getAttribute("nombres");
        ApePaterno = (String) sessionOk.getAttribute("ApePaterno");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sistema de Reserva</title>
        <link href="img/logo-msi.png" rel="icon">
        <link href="img/logo-msi.png" rel="apple-touch-icon">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <link href="assets/css/style.css" rel="stylesheet">
        <style>
            iframe{
                width: 100%; 
                height: 700px; 
                overflow: hidden;
            }
        </style>
        <script>
            function loadOption(option) {
                document.getElementById('frame').src = option;
            }
        </script>
        
    </head>


    <body>

        <i class="bi bi-list mobile-nav-toggle d-xl-none"></i>


        <header id="header">
            <div class="d-flex flex-column">

                <div class="profile">
                    <img src="assets/img/imgGym1.jpg" alt="" class="img-fluid rounded-circle">
                    <h1 class="text-light"> <li><%= nombres%> <%= ApePaterno%></li></h1>               
                </div>

                <nav id="navbar" class="nav-menu navbar">
                    <ul>
                        <li><a href="#" onclick="loadOption('Reserva.jsp')" class ="nav-link scrollto"><i class="bx bx-home"></i> <span>Reserva</span></a></li>
                        <li><a href="#" onclick="loadOption('Perfil.jsp')" class="nav-link scrollto"><i class="bx bx-user"></i> <span>Perfil</span></a></li>                                           
                        <li><a href="CerrarSession.jsp" class="nav-link scrollto"><i class="bx bx-file-blank"></i> <span>Cerrar Sesión</span></a></li>li     
                    </ul>
                </nav>
            </div>
        </header>     

        <main id="main">
            <div class="content-wrapper">
                <iframe id="frame" frameborder="0"></iframe>
            </div>

        </main>
        <footer id="footer">
   
        </footer>

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <script src="assets/vendor/purecounter/purecounter.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/typed.js/typed.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="main.js"></script>|
    </body>


</html>
