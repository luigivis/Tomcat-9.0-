<%-- 
    Document   : login
    Created on : 02-05-2019, 12:13:39 PM
    Author     : luigivis
--%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- saved from url=(0043)https://semantic-ui.com/examples/login.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Standard Meta -->

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <!-- Site Properties -->
        <title>Entra-SIG</title>

        <script src='style/js/jquery-3.3.1.js' type="text/javascript"></script>
        <script  src="style/js/botones_function.js" type="text/javascript"></script>
        <script src="style/js/semantic.js" type="text/javascript"></script>
        <script src="style/js/semantic.min.js"></script>
        <script src="style/datatable/dataTables.semanticui.min.js"
        type="text/javascript"></script>
        <script src="style/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="style/datatable/jquery.dataTables.min.js"
        type="text/javascript"></script>

        <script src="style/datatable/dataTables.semanticui.min.js"
        type="text/javascript"></script>

        <link rel='stylesheet prefetch' href='style/css/components/icon.min.css'>
        <link rel='stylesheet prefetch' href='style/css/semantic.css'>
        <link rel='stylesheet prefetch' href='style/css/dataTables.semanticui.min.css'>
        <link rel="shortcut icon" href="style/image/comusol_logo.jpg">

    </head>
    <style type="text/css">
        body {
            background-image: url("style/images/fondo.jpg");
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
        <% HttpSession login = request.getSession();
            login.setAttribute("nombre_empleado", null);
            login.setAttribute("id_usuarios", null);
        %>


        <div class="ui middle aligned center aligned grid">
            <div class="column">
                <h2 class="ui teal image header">
                    <div class="content">
                        Sistema de informacion geograficos
                    </div>
                </h2>

                <form class="ui large form" method="POST" action="login">
                    <div class="ui stacked segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="username" placeholder="Usuario">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="password" placeholder="Password">
                            </div>
                        </div>

                        <div class="field">
                            <div class="ui left icon input">
                                <i class="map marker icon"></i>
                                <input type="text" name="Location" readonly="" id="demo"></input>
                                <script>
                                    var x = document.getElementById("demo");

                                    function getLocation() {
                                        if (navigator.geolocation) {
                                            navigator.geolocation.getCurrentPosition(showPosition);
                                        } else {
                                            x.innerHTML = "Geolocation is not supported by this browser.";
                                        }
                                    }

                                    function showPosition(position) {
                                        document.getElementById("demo").value = position.coords.latitude + ", " + position.coords.longitude;
                                    }
                                </script>
                            </div>
                        </div> 
                    </div>

                    <button onclick="getLocation()" class="ui fluid large teal submit button"> 
                        Entrar
                    </button>
                </form>
                <br>

                <button onclick="getLocation()" class="ui fluid large teal submit button"> 
                    Obtener Ubicacion
                </button>

                <div class="ui message">
                    No tienes una cuenta? <a href="#">Registrate</a>
                </div>

                <c:if test="${not empty error}">
                    ${error}
                </c:if> 


            </div>
        </div>




    </body></html>