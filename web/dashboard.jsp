<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.EmpresaDAO"%>
<%@page import="modelo.BusDAO"%>
<%@page import="modelo.DestinoDAO"%>
<%@page import="modelo.viajeAdminDAO"%>

<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || !"admin".equals(sesion.getAttribute("rol"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalEmpresas = (Integer) request.getAttribute("totalEmpresas");
    int totalBuses = (Integer) request.getAttribute("totalBuses");
    int totalDestinos = (Integer) request.getAttribute("totalDestinos");
    int totalViajes = (Integer) request.getAttribute("totalViajes");

    Map<String, Integer> viajesPorMes = (Map<String, Integer>) request.getAttribute("viajesPorMes");
    Map<String, Integer> viajesPorEmpresa = (Map<String, Integer>) request.getAttribute("viajesPorEmpresa");

    String mesesLabels = "";
    String mesesData = "";
    for (Map.Entry<String, Integer> entry : viajesPorMes.entrySet()) {
        mesesLabels += "\"" + entry.getKey() + "\",";
        mesesData += entry.getValue() + ",";
    }

    String empresasLabels = "";
    String empresasData = "";
    for (Map.Entry<String, Integer> entry : viajesPorEmpresa.entrySet()) {
        empresasLabels += "\"" + entry.getKey() + "\",";
        empresasData += entry.getValue() + ",";
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Panel de administrador</title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
        <link rel="icon" href="assets/img/icon.ico" type="image/x-icon"/>

        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {"families": ["Lato:300,400,700,900"]},
                custom: {"families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['assets/css/fonts.min.css']},
                active: function () {
                    sessionStorage.fonts = true;
                }
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/atlantis.min.css">

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css">
        <link rel="stylesheet" href="lib/tempusdominus/css/tempusdominus-bootstrap-4.css" type="text/css"/>
        <link rel="stylesheet" href="lib/tempusdominus/css/tempusdominus-bootstrap-4.css" type="text/css">
        <style>
            .sidebar-wrapper{
                height: 633.2px;
                margin-bottom: 0px;
                margin-right: 0px;
                max-height: none;
                background-color: #222222;
            }

        </style>

    </head>
    <body>
        <div class="wrapper">
            <div class="main-header">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="blue">

                    <a href="index.html" class="logo">
                        <img src="assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
                    </a>
                    <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon">
                            <i class="icon-menu"></i>
                        </span>
                    </button>
                    <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="icon-menu"></i>
                        </button>
                    </div>
                </div>
                <!-- End Logo Header -->

                <!-- Navbar Header -->
                <nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">
                    <div class="container-fluid">
                        <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                            <li class="nav-item dropdown hidden-caret">
                                <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
                                    <div class="avatar-sm">
                                        <img src="assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
                                    </div>
                                </a>
                                <!--<ul class="dropdown-menu dropdown-user animated fadeIn">
                                    <div class="dropdown-user-scroll scrollbar-outer">
                                        <li>
                                            <div class="user-box">
                                                <div class="avatar-lg"><img src="assets/img/profile.jpg" alt="image profile" class="avatar-img rounded"></div>
                                                <div class="u-text">
                                                    <h4>Hizrian</h4>
                                                    <p class="text-muted">hello@example.com</p><a href="profile.html" class="btn btn-xs btn-secondary btn-sm">View Profile</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">My Profile</a>
                                            <a class="dropdown-item" href="#">My Balance</a>
                                            <a class="dropdown-item" href="#">Inbox</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Account Setting</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Logout</a>
                                        </li>
                                    </div>
                                </ul>-->
                            </li>
                        </ul>
                    </div>
                </nav>
                <!-- End Navbar -->
            </div>
            <!-- Sidebar -->
            <div class="sidebar sidebar-style-2">			
                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <div class="user">
                            <div class="avatar-sm float-left mr-2">
                                <img src="assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
                            </div>
                            <div class="info">
                                <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
                                    <span>
                                        Henry
                                        <span class="user-level">Administrador</span>
                                        <span class="caret"></span>
                                    </span>
                                </a>
                                <!--<div class="clearfix"></div>

                                <div class="collapse in" id="collapseExample">
                                    <ul class="nav">
                                        <li>
                                            <a href="#profile">
                                                <span class="link-collapse">Mi perfil</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#edit">
                                                <span class="link-collapse">Editar perfil</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#settings">
                                                <span class="link-collapse">Configuración</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>-->
                            </div>
                        </div>
                        <ul class="nav nav-primary">
                            <li class="nav-item active">
                                <a data-toggle="" href="http://localhost:8080/Sistema_agencia/svlDashboard" class="collapsed" aria-expanded="false">
                                    <i class="fas fa-home"></i>
                                    <p>Dashboard</p>
                                </a>
                            </li>
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Administrar</h4>
                            </li>
                            <!--<li class="nav-item">
                                <a data-toggle="" href="usuarios.jsp">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Usuarios</p>

                                </a>
                            </li>-->
                            <li class="nav-item">
                                <a data-toggle="" href="empresas.jsp">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Empresas</p>

                                </a>
                            </li>
                            <li class="nav-item">
                                <a data-toggle="" href="destinos.jsp">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Destinos</p>

                                </a>
                            </li>
                            <li class="nav-item ">
                                <a data-toggle="" href="http://localhost:8080/Sistema_agencia/svlBus?action=listar">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Buses</p>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a data-toggle="" href="http://localhost:8080/Sistema_agencia/svlViaje?action=listar">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Viajes</p>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a data-toggle="" href="http://localhost:8080/Sistema_agencia/svlReporteVentas">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Reporte</p>
                                </a>
                            </li>


                            <li class="mx-4 mt-2">
                                <a href="svlLogout" class="btn btn-primary btn-block"><span class="btn-label mr-2"></span>Cerrar Sesión</a> 
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="content">
                    <div class="panel-header bg-primary-gradient">
                        <div class="page-inner py-5">
                            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                <div>
                                    <h2 class="text-white pb-2 fw-bold">Panel principal</h2>

                                </div>
                                <div class="ml-md-auto py-2 py-md-0">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row row-card-no-pd mt--2">
                            <!-- Empresas -->
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body ">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="icon-big text-center">
                                                    <i class="fas fa-building text-warning"></i>
                                                </div>
                                            </div>
                                            <div class="col-7 col-stats">
                                                <div class="numbers">
                                                    <p class="card-category">Empresas</p>
                                                    <h4 class="card-title"><%= totalEmpresas%></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Destinos -->
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body ">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="icon-big text-center">
                                                    <i class="fas fa-map-marker-alt text-success"></i>
                                                </div>
                                            </div>
                                            <div class="col-7 col-stats">
                                                <div class="numbers">
                                                    <p class="card-category">Destinos</p>
                                                    <h4 class="card-title"><%= totalDestinos%></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Buses -->
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="icon-big text-center">
                                                    <i class="fas fa-bus text-danger"></i>
                                                </div>
                                            </div>
                                            <div class="col-7 col-stats">
                                                <div class="numbers">
                                                    <p class="card-category">Buses</p>
                                                    <h4 class="card-title"><%= totalBuses%></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Viajes -->
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="icon-big text-center">
                                                    <i class="fas fa-ticket-alt text-primary"></i>
                                                </div>
                                            </div>
                                            <div class="col-7 col-stats">
                                                <div class="numbers">
                                                    <p class="card-category">Viajes</p>
                                                    <h4 class="card-title"><%= totalViajes%></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Gráficos -->
                        <div class="row mt--2">
                            <div class="col-md-6">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">Viajes por mes</div>
                                        <canvas id="viajesPorMes"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">Viajes por empresa</div>
                                        <canvas id="viajesPorEmpresa"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="">
                                        Inicio
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        Nosotros
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        Empresa
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="copyright ml-auto">
                            2025, Venta de pasajes AndeBus
                        </div>				
                    </div>
                </footer>
            </div>

        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery.3.2.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery UI -->
        <script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
        <script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>

        <!-- jQuery Sparkline -->
        <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

        <!-- Chart Circle -->
        <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>

        <!-- Bootstrap Notify -->
        <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

        <!-- jQuery Vector Maps -->
        <script src="assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
        <script src="assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

        <!-- Sweet Alert -->
        <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

        <!-- Atlantis JS -->
        <script src="assets/js/atlantis.min.js"></script>

        <!-- Atlantis DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo.js"></script>
        <script src="assets/js/demo.js"></script>
        <script>
            Circles.create({
                id: 'circles-1',
                radius: 45,
                value: 60,
                maxValue: 100,
                width: 7,
                text: 5,
                colors: ['#f1f1f1', '#FF9E27'],
                duration: 400,
                wrpClass: 'circles-wrp',
                textClass: 'circles-text',
                styleWrapper: true,
                styleText: true
            })

            Circles.create({
                id: 'circles-2',
                radius: 45,
                value: 70,
                maxValue: 100,
                width: 7,
                text: 36,
                colors: ['#f1f1f1', '#2BB930'],
                duration: 400,
                wrpClass: 'circles-wrp',
                textClass: 'circles-text',
                styleWrapper: true,
                styleText: true
            })

            Circles.create({
                id: 'circles-3',
                radius: 45,
                value: 40,
                maxValue: 100,
                width: 7,
                text: 12,
                colors: ['#f1f1f1', '#F25961'],
                duration: 400,
                wrpClass: 'circles-wrp',
                textClass: 'circles-text',
                styleWrapper: true,
                styleText: true
            })

            var totalIncomeChart = document.getElementById('totalIncomeChart').getContext('2d');

            var mytotalIncomeChart = new Chart(totalIncomeChart, {
                type: 'bar',
                data: {
                    labels: ["S", "M", "T", "W", "T", "F", "S", "S", "M", "T"],
                    datasets: [{
                            label: "Total Income",
                            backgroundColor: '#ff9e27',
                            borderColor: 'rgb(23, 125, 255)',
                            data: [6, 4, 9, 5, 4, 6, 4, 3, 8, 10],
                        }],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        display: false,
                    },
                    scales: {
                        yAxes: [{
                                ticks: {
                                    display: false //this will remove only the label
                                },
                                gridLines: {
                                    drawBorder: false,
                                    display: false
                                }
                            }],
                        xAxes: [{
                                gridLines: {
                                    drawBorder: false,
                                    display: false
                                }
                            }]
                    },
                }
            });

            $('#lineChart').sparkline([105, 103, 123, 100, 95, 105, 115], {
                type: 'line',
                height: '70',
                width: '100%',
                lineWidth: '2',
                lineColor: '#ffa534',
                fillColor: 'rgba(255, 165, 52, .14)'
            });


        </script>
        <script>
            // Gráfico viajes por mes
            var ctx1 = document.getElementById('viajesPorMes').getContext('2d');
            new Chart(ctx1, {
                type: 'bar',
                data: {
                    labels: [<%= mesesLabels%>],
                    datasets: [{
                            label: "Viajes",
                            backgroundColor: '#2BB930',
                            data: [<%= mesesData%>]
                        }]
                }
            });

            // Gráfico viajes por empresa
            var ctx2 = document.getElementById('viajesPorEmpresa').getContext('2d');
            new Chart(ctx2, {
                type: 'pie',
                data: {
                    labels: [<%= empresasLabels%>],
                    datasets: [{
                            backgroundColor: ['#FF9E27', '#2BB930', '#F25961', '#1D62F0', '#8A2BE2'],
                            data: [<%= empresasData%>]
                        }]
                }
            });
        </script>
    </body>
</html>
