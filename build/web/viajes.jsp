<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.viajeAdmin"%>
<%@page import="modelo.Bus"%>
<%@page import="modelo.Destino"%>
<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || !"admin".equals(sesion.getAttribute("rol"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<viajeAdmin> lista = (List<viajeAdmin>) request.getAttribute("lista");
    List<Bus> buses = (List<Bus>) request.getAttribute("buses");
    List<Destino> destinos = (List<Destino>) request.getAttribute("destinos");
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
                            <h2 class="text-white fw-bold">Gestión de Viajes</h2>
                        </div>
                    </div>

                    <div class="page-inner mt--5">
                        <div class="card">
                            <div class="card-header d-flex align-items-center">
                                <h4 class="card-title">Lista de Viajes</h4>
                                <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addViajeModal">
                                    <i class="fa fa-plus"></i> Nuevo Viaje
                                </button>
                            </div>

                            <div class="card-body">
                                <!-- Modal Agregar Viaje -->
                                <div class="modal fade" id="addViajeModal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <form action="svlViaje" method="post">
                                            <input type="hidden" name="action" value="agregar">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Nuevo Viaje</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p class="small">Complete los campos para registrar un nuevo viaje</p>

                                                    <div class="form-group">
                                                        <label>Bus</label>
                                                        <select name="idBus" class="form-control" required>
                                                            <option value="">Seleccione...</option>
                                                            <% if (buses != null) {
                                                                    for (Bus b : buses) {%>
                                                            <option value="<%= b.getId()%>"><%= b.getEmpresa()%> - <%= b.getPlaca()%> - <%= b.getTipo()%></option>
                                                            <% }
                                                                } %>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Origen</label>
                                                        <select name="origen" class="form-control" required>
                                                            <option value="">Seleccione...</option>
                                                            <% if (destinos != null) {
                                                                    for (Destino d : destinos) {%>
                                                            <option value="<%= d.getId()%>"><%= d.getCiudad()%></option>
                                                            <% }
                                                                } %>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Destino</label>
                                                        <select name="destino" class="form-control" required>
                                                            <option value="">Seleccione...</option>
                                                            <% if (destinos != null) {
                                                                    for (Destino d : destinos) {%>
                                                            <option value="<%= d.getId()%>"><%= d.getCiudad()%></option>
                                                            <% }
                                                                } %>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Fecha de salida</label>
                                                        <input type="date" name="fechaSalida" class="form-control" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Hora de salida</label>
                                                        <input type="time" name="horaSalida" class="form-control" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Precio</label>
                                                        <input type="number" step="0.01" name="precio" class="form-control" required>
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

                                <!-- Tabla de Viajes -->
                                <div class="table-responsive">
                                    <table id="tabla-viajes" class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Bus</th>
                                                <th>Empresa</th>
                                                <th>Origen</th>
                                                <th>Destino</th>
                                                <th>Fecha</th>
                                                <th>Hora</th>
                                                <th>Precio</th>
                                                <th class="text-center">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% if (lista != null) {
                                                    for (viajeAdmin v : lista) {%>
                                            <tr>
                                                <td><%= v.getId()%></td>
                                                <td><%= v.getPlacaBus()%></td>
                                                <td><%= v.getEmpresaBus()%></td>
                                                <td><%= v.getCiudadOrigen()%></td>
                                                <td><%= v.getCiudadDestino()%></td>
                                                <td><%= v.getFechaSalida()%></td>
                                                <td><%= v.getHoraSalida()%></td>
                                                <td>S/ <%= String.format(java.util.Locale.US, "%.2f", v.getPrecio())%></td>
                                                <td style="width:140px;">
                                                    <div class="form-button-action">
                                                        <!-- Editar -->
                                                        <button type="button" class="btn btn-link btn-primary btn-lg"
                                                                data-toggle="modal" data-target="#editViajeModal<%= v.getId()%>">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <!-- Eliminar -->
                                                        <a href="svlViaje?action=eliminar&id=<%= v.getId()%>"
                                                           onclick="return confirm('¿Eliminar viaje?');"
                                                           class="btn btn-link btn-danger" title="Eliminar">
                                                            <i class="fa fa-times"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- Modal Editar Viaje -->
                                        <div class="modal fade" id="editViajeModal<%= v.getId()%>" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <form action="svlViaje" method="post">
                                                    <input type="hidden" name="action" value="actualizar">
                                                    <input type="hidden" name="id" value="<%= v.getId()%>">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Editar Viaje</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label>Bus</label>
                                                                <select name="idBus" class="form-control" required>
                                                                    <% if (buses != null) {
                                                                            for (Bus b : buses) {%>
                                                                    <option value="<%= b.getId()%>"
                                                                            <%= (b.getId() == v.getIdBus()) ? "selected" : ""%>>
                                                                        <%= b.getPlaca()%> - <%= b.getTipo()%>
                                                                    </option>
                                                                    <% }
                                                                        } %>
                                                                </select>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Origen</label>
                                                                <select name="origen" class="form-control" required>
                                                                    <% if (destinos != null) {
                                                                            for (Destino d : destinos) {%>
                                                                    <option value="<%= d.getId()%>"
                                                                            <%= (d.getId() == v.getOrigen()) ? "selected" : ""%>>
                                                                        <%= d.getCiudad()%>
                                                                    </option>
                                                                    <% }
                                                                        } %>
                                                                </select>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Destino</label>
                                                                <select name="destino" class="form-control" required>
                                                                    <% if (destinos != null) {
                                                                            for (Destino d : destinos) {%>
                                                                    <option value="<%= d.getId()%>"
                                                                            <%= (d.getId() == v.getDestino()) ? "selected" : ""%>>
                                                                        <%= d.getCiudad()%>
                                                                    </option>
                                                                    <% }
                                                                        }%>
                                                                </select>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Fecha de salida</label>
                                                                <input type="date" name="fechaSalida" class="form-control"
                                                                       value="<%= v.getFechaSalida()%>" required>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Hora de salida</label>
                                                                <%
                                                                    String horaStr = v.getHoraSalida() == null ? "" : v.getHoraSalida().toString();
                                                                    // Mostrar HH:mm para el input type="time"
                                                                    if (horaStr.length() >= 5) {
                                                                        horaStr = horaStr.substring(0, 5);
                                                                    }
                                                                %>
                                                                <input type="time" name="horaSalida" class="form-control"
                                                                       value="<%= horaStr%>" required>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Precio</label>
                                                                <input type="number" step="0.01" name="precio" class="form-control"
                                                                       value="<%= String.format(java.util.Locale.US, "%.2f", v.getPrecio())%>" required>
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
                                                                   $('#tabla-viajes').DataTable({
                                                                       pageLength: 5
                                                                   });
                                                               });
        </script>
    </body>
</html>
