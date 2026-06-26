<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Bus"%>
<%@page import="modelo.Empresa"%>

<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || !"admin".equals(sesion.getAttribute("rol"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    List<Bus> lista = (List<Bus>) request.getAttribute("lista");
    List<Empresa> empresas = (List<Empresa>) request.getAttribute("empresas");

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
                            <h2 class="text-white fw-bold">Gestión de Buses</h2>
                        </div>
                    </div>

                    <div class="page-inner mt--5">
                        <div class="card">
                            <div class="card-header d-flex align-items-center">
                                <h4 class="card-title">Lista de Buses</h4>
                                <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addBusModal">
                                    <i class="fa fa-plus"></i> Nuevo Bus
                                </button>
                            </div>
                            <div class="card-body">

                                <!-- Modal Agregar Bus -->
                                <div class="modal fade" id="addBusModal" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <form action="svlBus" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="agregar">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Nuevo Bus</h5>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>Empresa</label>
                                                        <select name="idEmpresa" class="form-control" required>
                                                            <option value="">Seleccione...</option>
                                                            <% for (Empresa e : empresas) {%>
                                                            <option value="<%= e.getId_empresa()%>"><%= e.getNombre()%></option>
                                                            <% } %>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Placa</label>
                                                        <input type="text" name="placa" class="form-control" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Tipo</label>
                                                        <input type="text" name="tipo" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Capacidad</label>
                                                        <input type="number" name="capacidad" class="form-control" min="1">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Imagen</label>
                                                        <input type="file" name="imagen" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Agregar</button>
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <!-- Tabla de buses -->
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Empresa</th>
                                                <th>Placa</th>
                                                <th>Tipo</th>
                                                <th>Capacidad</th>
                                                <th>Imagen</th>
                                                <th class="text-center">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% if (lista != null) {
                                                    for (Bus b : lista) {%>
                                            <tr>
                                                <td><%= b.getId()%></td>
                                                <td><%= b.getEmpresa()%></td>
                                                <td><%= b.getPlaca()%></td>
                                                <td><%= b.getTipo()%></td>
                                                <td><%= b.getCapacidad()%></td>
                                                <td><img src="img/buses/<%= b.getImagen()%>" width="80" class="rounded shadow-sm"></td>
                                                <td>
                                                    <div class="form-button-action">
                                                        <!-- Botón Editar -->
                                                        <button type="button" class="btn btn-link btn-primary btn-lg"
                                                                data-toggle="modal" data-target="#editBusModal<%= b.getId()%>">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <!-- Botón Eliminar -->
                                                        <a href="svlBus?action=eliminar&id=<%= b.getId()%>"
                                                           onclick="return confirm('¿Eliminar bus?');"
                                                           class="btn btn-link btn-danger">
                                                            <i class="fa fa-times"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- Modal Editar Bus -->
                                        <div class="modal fade" id="editBusModal<%= b.getId()%>" tabindex="-1" role="dialog">
                                            <div class="modal-dialog" role="document">
                                                <form action="svlBus" method="post" enctype="multipart/form-data">
                                                    <input type="hidden" name="action" value="actualizar">
                                                    <input type="hidden" name="id" value="<%= b.getId()%>">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Editar Bus</h5>
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label>Empresa</label>
                                                                <select name="idEmpresa" class="form-control" required>
                                                                    <% for (Empresa e : empresas) {%>
                                                                    <option value="<%= e.getId_empresa()%>"
                                                                            <%= (e.getId_empresa() == b.getIdEmpresa()) ? "selected" : ""%>>
                                                                        <%= e.getNombre()%>
                                                                    </option>
                                                                    <% }%>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Placa</label>
                                                                <input type="text" name="placa" class="form-control" value="<%= b.getPlaca()%>" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Tipo</label>
                                                                <input type="text" name="tipo" class="form-control" value="<%= b.getTipo()%>">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Capacidad</label>
                                                                <input type="number" name="capacidad" class="form-control" value="<%= b.getCapacidad()%>" min="1">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Imagen</label>
                                                                <input type="file" name="imagen" class="form-control">
                                                                <small>Imagen actual: <%= b.getImagen()%></small>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Guardar cambios</button>
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <% }
                                            }%>
                                        </tbody>
                                    </table>
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
                                                                   $('.table').DataTable({"pageLength": 5});
                                                               });
        </script>
    </body>
</html>
