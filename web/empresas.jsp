<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.EmpresaDAO"%>

<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || !"admin".equals(sesion.getAttribute("rol"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    EmpresaDAO dao = new EmpresaDAO();
    List<Empresa> lista = dao.listar();
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
            <%@ include file="includes/header.jsp" %>
            <%@ include file="includes/sidebar.jsp" %>


            <div class="main-panel">
                <div class="content">
                    <div class="panel-header bg-primary-gradient">
                        <div class="page-inner py-5">
                            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                <div>
                                    <h2 class="text-white pb-2 fw-bold">Gestión de empresas</h2>
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
                                            <h4 class="card-title">Lista de Empresas</h4>
                                            <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                                <i class="fa fa-plus"></i>
                                                Add Row
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <!-- Modal -->
                                        <!-- Modal Añadir (reemplaza tu #addRowModal content con este form) -->
                                        <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <form action="svlEmpresa" method="post">
                                                    <div class="modal-content">
                                                        <div class="modal-header no-bd">
                                                            <h5 class="modal-title"><span class="fw-mediumbold">Nueva Empresa</span></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <p class="small">Complete los campos para crear una nueva empresa</p>

                                                            <div class="form-group">
                                                                <label>Nombre</label>
                                                                <input name="nombre" type="text" class="form-control" required>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>RUC</label>
                                                                <input name="ruc" type="text" class="form-control" required>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Teléfono</label>
                                                                <input name="telefono" type="text" class="form-control">
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Correo</label>
                                                                <input name="correo" type="email" class="form-control">
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Dirección</label>
                                                                <input name="direccion" type="text" class="form-control">
                                                            </div>
                                                        </div>

                                                        <div class="modal-footer no-bd">
                                                            <button type="submit" class="btn btn-primary">Agregar</button>
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        <div class="table-responsive">
                                            <table id="add-row" class="display table table-striped table-hover" >
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>RUC</th>
                                                        <th>Teléfono</th>
                                                        <th>Correo</th>
                                                        <th>Dirección</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>RUC</th>
                                                        <th>Teléfono</th>
                                                        <th>Correo</th>
                                                        <th>Dirección</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%
                                                        for (Empresa e : lista) {
                                                    %>
                                                    <tr>
                                                        <td><%= e.getId_empresa()%></td>
                                                        <td><%= e.getNombre()%></td>
                                                        <td><%= e.getRuc()%></td>
                                                        <td><%= e.getTelefono()%></td>
                                                        <td><%= e.getCorreo()%></td>
                                                        <td><%= e.getDireccion()%></td>
                                                        <td style="width:140px;">
                                                            <div class="form-button-action">
                                                                <!-- Editar: abrimos un modal específico por fila con campos pre-llenados -->
                                                                <button type="button" data-toggle="modal" data-target="#editModal<%= e.getId_empresa()%>" class="btn btn-link btn-primary btn-lg" title="Editar">
                                                                    <i class="fa fa-edit"></i>
                                                                </button>

                                                                <!-- Eliminar -->
                                                                <a href="svlEmpresa?accion=eliminar&id=<%= e.getId_empresa()%>" onclick="return confirm('¿Eliminar empresa?');" class="btn btn-link btn-danger" title="Eliminar">
                                                                    <i class="fa fa-times"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <!-- Modal Editar para esta empresa -->
                                                <div class="modal fade" id="editModal<%= e.getId_empresa()%>" tabindex="-1" role="dialog" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <form action="svlEmpresa" method="post">
                                                            <div class="modal-content">
                                                                <div class="modal-header no-bd">
                                                                    <h5 class="modal-title"><span class="fw-mediumbold">Editar Empresa</span></h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>

                                                                <div class="modal-body">
                                                                    <input type="hidden" name="id" value="<%= e.getId_empresa()%>">

                                                                    <div class="form-group">
                                                                        <label>Nombre</label>
                                                                        <input type="text" name="nombre" class="form-control" value="<%= e.getNombre()%>" required>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label>RUC</label>
                                                                        <input type="text" name="ruc" class="form-control" value="<%= e.getRuc()%>" required>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label>Teléfono</label>
                                                                        <input type="text" name="telefono" class="form-control" value="<%= e.getTelefono()%>">
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label>Correo</label>
                                                                        <input type="email" name="correo" class="form-control" value="<%= e.getCorreo()%>">
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label>Dirección</label>
                                                                        <input type="text" name="direccion" class="form-control" value="<%= e.getDireccion()%>">
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer no-bd">
                                                                    <button type="submit" class="btn btn-primary">Guardar cambios</button>
                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <%
                                                    } // for
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
