<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);
    modelo.Pasajero pasajero = null;
    if (sesion != null) {
        pasajero = (modelo.Pasajero) sesion.getAttribute("pasajero");
    }
    
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>AndeBus</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="../img/favicon.ico" rel="icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            /* Efecto hover para las tarjetas */
            .shadow-sm {
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }
            .shadow-sm:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            }

        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    </head>

    <body>

        <!-- Topbar Start -->
        <div class="container-fluid bg-light pt-3 d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a href="mailto:henryjosebecerraiman530@gmail.com"><p><i class="fa fa-envelope mr-2"></i>henryjosebecerraiman530@gmail.com</p></a>
                            <p class="text-body px-3">|</p>
                            <p><i class="fa fa-phone-alt mr-2"></i>+51 951 833 077</p>
                        </div>
                    </div>
                    <div class="col-lg-6 text-center text-lg-right">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-primary px-3" target="_blank" href="https://www.facebook.com/">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-primary px-3" target="_blank" href="https://x.com/">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-primary px-3" target="_blank" href="https://pe.linkedin.com/">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-primary px-3" target="_blank" href="https://www.instagram.com/">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a class="text-primary pl-3" target="_blank" href="https://www.youtube.com/">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navegacion -->
        <div class="container-fluid position-relative nav-bar p-0">
            <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
                <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                    <a href="" class="navbar-brand">
                        <h1 class="m-0 text-primary"><span class="text-dark">ANDE</span>BUS</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                        <div class="navbar-nav ml-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link active">Inicio</a>
                            <a href="nosotros.jsp" class="nav-item nav-link">Nosotros</a>
                            <a href="servicios.jsp" class="nav-item nav-link">Servicios</a>
                            <a href="contactanos.jsp" class="nav-item nav-link">Contactanos</a>

                        </div>
                        <!-- Botón de Acceso -->
                        <div class="ml-lg-3">
                            <% if (pasajero != null) {%>
                            <div class="dropdown d-inline">
                                <button class="btn btn-primary dropdown-toggle rounded-pill px-4 py-2" type="button" id="menuUsuario" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="bi bi-person-circle"></i> <%= pasajero.getNombre()%>
                                </button>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="menuUsuario">
                                    <!-- comment <a class="dropdown-item" href=""><i class="bi bi-person"></i> Mi perfil</a>-->

                                    <a class="dropdown-item" href="misReservas.jsp">Mis reservas</a>

                                    <a class="dropdown-item" href="<%= request.getContextPath()%>/svlLogout"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a>
                                </div>
                            </div>
                            <% } else { %>
                            <a href="login.jsp" class="btn btn-primary px-4 py-2 rounded-pill">
                                <i class="bi bi-box-arrow-in-right"></i> Acceder
                            </a>
                            <% }%>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navegacion fin -->