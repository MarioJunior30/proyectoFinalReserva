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
        <link rel="shortcut icon" href="img/alexcgdesign.png" type="image/x-icon">
        <link rel="stylesheet" href="css/estilos.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href='css\component-chosen.css'>
        <link type="text/css" rel="stylesheet" href='css\component-chosen.min.css'>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600|Open+Sans" rel="stylesheet"> 
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
        <script scr="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <p class="h1">Busqueda por Nombre:</p>
        <%
            Connection con = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String cadena = "jdbc:mysql://localhost/bd_complejo_deportivo?user=root&password";
                con = DriverManager.getConnection(cadena);

                Statement sta = con.createStatement();

        %>

        <div class="container buscar">
            <form class="formbuscar">
                <input class="form-control" type="text" name="txtBuscar">
                <input class="btn btn" type="submit" value="Buscar">

            </form>
            <%                String textobuscar = request.getParameter("txtBuscar");
                if (textobuscar != null) {
                    ResultSet rs = sta.executeQuery("select * from listar_reserva where NOMBRE like" + "'%" + textobuscar + "%'");
             %>
        </div>

        <div>                    
            <table class="table"  id="tablaDatos">
                <thead class="table table-dark">
                    <tr>
                        <th scope="col">N° Documento</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Lugar de Reserva</th>
                        <th scope="col">Zona Gimnasio</th>
                        <th scope="col">Fecha Reserva</th>
                        <th scope="col">Hora Reserva</th>
                    </tr>
                </thead>
                <tbody id="tbodys">
                    <%  while (rs.next()) {
                    %>
                    <tr>
                        <td class="text-center"><%= rs.getInt(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td class="text-center"><%= rs.getString(3)%></td>
                        <td class="text-center"><%= rs.getString(4)%></td>
                        <td class="text-center"><%= rs.getString(5)%></td>
                        <td class="text-center"><%= rs.getString(6)%></td>
                    </tr>
                    <%}%>
                    <%

                            } else {
                                System.err.print("Error");
                            }
                        } catch (Exception e) {
                            System.out.println("Error: " + e);
                        }
                    %>
                </tbody>
            </table>
        </div>        

    </body>
</html>
