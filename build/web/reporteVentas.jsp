<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>

<%
    //Verificamos la sesion, si no hay sesion que redirija al login
    HttpSession sesion = request.getSession(false);
    if (sesion == null || !"admin".equals(sesion.getAttribute("rol"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
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
            <%@ include file="includes/header.jsp" %>
            <%@ include file="includes/sidebar.jsp" %>


            <div class="main-panel">
                <div class="content">
                    <div class="panel-header bg-primary-gradient">
                        <div class="page-inner py-5">
                            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                <div>
                                    <h2 class="text-white pb-2 fw-bold">Gestionar reportes</h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-inner mt--5">
                        <!-- Aqui va todo el contenido -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="d-flex align-items-center">
                                            <h4 class="card-title">Reporte de ventas al mes por empresas</h4>
                                            
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <!-- Modal -->
                                        <!-- Modal Añadir (reemplaza tu #addRowModal content con este form) -->
                                        

                                        <div class="table-responsive">
                                            <table id="add-row" class="display table table-striped table-hover" >
                                                <thead>
                                                    <tr>
                                                        <th>Empresa</th>
                                                        <th>Mes</th>
                                                        <th>Total vendido</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Empresa</th>
                                                        <th>Mes</th>
                                                        <th>Total vendido</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%
                                                        Map<String, Map<Integer, Double>> reporte = (Map<String, Map<Integer, Double>>) request.getAttribute("reporte");
                                                        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
                                                        for (Map.Entry<String, Map<Integer, Double>> empresaEntry : reporte.entrySet()) {
                                                            String empresa = empresaEntry.getKey();
                                                            Map<Integer, Double> ventasMes = empresaEntry.getValue();
                                                            double totalEmpresa = 0;
                                                            for (Map.Entry<Integer, Double> mesEntry : ventasMes.entrySet()) {
                                                                int mes = mesEntry.getKey();
                                                                double totalMes = mesEntry.getValue();
                                                                totalEmpresa += totalMes;
                                                    %>
                                                    <tr>
                                                        <td><%= empresa%></td>
                                                        <td><%= meses[mes - 1]%></td>
                                                        <td>S/ <%= String.format(java.util.Locale.US, "%.2f", totalMes)%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                    <tr>
                                                        <td colspan="2"><strong>Total <%= empresa%></strong></td>
                                                        <td><strong>S/ <%= String.format(java.util.Locale.US, "%.2f", totalEmpresa)%></strong></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@ include file="includes/footer.jsp" %>
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

        <script >
            $(document).ready(function () {
                // Add Row
                $('#add-row').DataTable({
                    "pageLength": 5,
                });

                var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

                $('#addRowButton').click(function () {
                    $('#add-row').dataTable().fnAddData([
                        $("#addName").val(),
                        $("#addPosition").val(),
                        $("#addOffice").val(),
                        action
                    ]);
                    $('#addRowModal').modal('hide');
                });
            });
        </script>

    </body>
</html>
