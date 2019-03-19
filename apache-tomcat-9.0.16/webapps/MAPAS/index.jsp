<%-- 
    Document   : index
    Created on : Feb 8, 2019, 11:00:09 PM
    Author     : Semantic UI
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbc.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
//Verificar login
    String acceso = "";
    try {
        HttpSession login = request.getSession();
        acceso = login.getAttribute("id_usuarios").toString();
        if (acceso == null) {
            response.sendRedirect("login.jsp");
        }
    } catch (java.lang.NullPointerException e) {
        response.sendRedirect("login.jsp");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src='style/js/jquery-3.3.1.js' type="text/javascript"></script>
        <script  src="style/js/botones_function.js" type="text/javascript"></script>
        <script src="style/js/semantic.js" type="text/javascript"></script>
        <script src="style/js/semantic.min.js"></script>
        <script src="style/js/materialize.min.js"></script>
        <script src="style/js/materialize.js"></script>
        <script src="style/datatable/dataTables.semanticui.min.js"
        type="text/javascript"></script>
        <script src="style/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="style/datatable/jquery.dataTables.min.js"
        type="text/javascript"></script>

        <script src="style/datatable/dataTables.semanticui.min.js"
        type="text/javascript"></script>

        <link rel='stylesheet prefetch' href='style/css/components/icon.min.css'>
        <link rel='stylesheet prefetch' href='style/css/semantic.css'>
        <link rel='stylesheet prefetch' href='style/css/materialize.css'>
        <link rel='stylesheet prefetch' href='style/css/materialize.min.css'>
        <link rel='stylesheet prefetch' href='style/css/dataTables.semanticui.min.css'>
        <link rel="shortcut icon" href="style/image/comusol_logo.jpg">

    </head>
    <style type="text/css">
        body {
            background-image: url("style/images/fondo azul oscuro.jpg");
        }
        body > .grid {
            height: 100%;
        }
        .image {
            margin-top: -100px;
        }
        .column {
            max-width: 450px;
        }
    </style>
    <body>

        <div class="ui middle aligned center aligned grid">
            <div class="column">
                <h2 class="ui teal-text image header">
                    <div class="content">
                        Sistema de informacion geograficos ${username}
                    </div>
                </h2>
                <div class="ui large form">
                    <a class="btn-floating red pulse"><i class="material-icons">+</i></a>
                    <%                         Connection con = DbConnection.getConnection();
                        Statement sta = null;
                        ResultSet rs = null;
                        try {

                            sta = con.createStatement();
                            //OBTIENE EL LLAMADO
                            rs = sta.executeQuery("select nameUbicaciones, coordenadasUbicaciones, detalleUbicaciones, eventosUbicaciones from Ubicaciones where codigoUsuarios =" + acceso);
                            while (rs.next()) {
                    %>


                    <table class="ui definition table">
                        <tbody>
                            <tr>
                                <td class="two wide column">Nombre</td>
                                <td><%= rs.getString(1)%></td>
                            </tr>
                            <tr>
                                <td>Coordenadas</td>
                                <td><%= rs.getString(2)%></td>
                            </tr>
                            <tr>
                                <td>Detalles</td>
                                <td><%= rs.getString(3)%></td>
                            </tr>
                            <tr>
                                <td>Eventos</td>
                                <td><%= rs.getString(4)%></td>
                            </tr>
                        </tbody>                      
                    </table>
                    <a href="routes.jsp?coordenadas=<%=rs.getString(2)%>">
                        <button class="ui primary button">
                            IR
                        </button>
                    </a>
                    <button class="ui button">
                        MODIFICAR
                    </button>
                    <%
                            }
                            sta.close();
                            rs.close();
                            con.close();
                        } catch (SQLException e) {

                        }

                    %>

                </div>
                
            </div>
</html>
