<%@ page import="java.util.*" %>
<%@ page import="modelo.*" %>
<%@ include file="header/header.jsp" %>
<%
    if (sesion == null || sesion.getAttribute("pasajero") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    PasajeDAO pdao = new PasajeDAO();
    List<Pasaje> reservas = pdao.listarReservasPorPasajero(pasajero.getId_pasajero());


%>

<div class="container mt-5">
    <%        String mensaje = (String) request.getAttribute("mensaje");
        if (mensaje != null && !mensaje.isEmpty()) {
    %>
    <div class="alert alert-info alert-dismissible fade show text-center" role="alert">
        <%= mensaje%>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <% } %>
    <h2 class="text-center text-primary mb-4">Mis Reservas</h2>

    <% if (reservas.isEmpty()) { %>
    <div class="alert alert-info text-center">Aún no tienes reservas.</div>
    <% } else { %>
    <table class="table table-striped table-hover text-center">
        <thead class="thead-dark">
            <tr>
                <th>Origen</th>
                <th>Destino</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Asiento</th>
                <th>Precio</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% for (Pasaje p : reservas) {%>
            <tr>
                <td><%= p.getOrigen()%></td>
                <td><%= p.getDestino()%></td>
                <td><%= p.getFechaSalida()%></td>
                <td><%= p.getHoraSalida()%></td>
                <td><%= p.getAsiento()%></td>
                <td>S/ <%= p.getPrecio()%></td>
                <td>
                    <% if (p.getEstado().equals("pagado")) { %>
                    <span class="badge badge-success">Pagado</span>
                    <% } else { %>
                    <span class="badge badge-warning">Reservado</span>
                    <% } %>
                </td>
                <td>
                    <% if (p.getEstado().equals("reservado")) {%>
                    <button class="btn btn-success btn-sm"
                            data-toggle="modal"
                            data-target="#modalPago"
                            data-id="<%= p.getIdPasaje()%>"
                            data-precio="<%= p.getPrecio()%>">
                        Pagar
                    </button>
                    <a href="svlCancelar?idPasaje=<%= p.getIdPasaje()%>" class="btn btn-danger btn-sm">Cancelar</a>
                    <% } else { %>
                    <span>-</span>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% }%>
</div>

<!-- MODAL DE PAGO        -->

<div class="modal fade" id="modalPago" tabindex="-1" role="dialog" aria-labelledby="modalPagoLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="svlPagar" method="post">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title" id="modalPagoLabel">Realizar Pago</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" id="idPasajePago" name="idPasaje">

                    <div class="form-group">
                        <label for="metodo">Método de Pago</label>
                        <select class="form-control" id="metodo" name="metodo" required>
                            <option value="">Seleccione un método</option>
                            <option value="tarjeta">Tarjeta</option>
                            <option value="yape">Yape</option>
                            <option value="efectivo">Efectivo</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Monto a pagar</label>
                        <input type="text" class="form-control" id="montoPago" name="monto" readonly>
                    </div>

                    <div id="extraCampos"></div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Confirmar Pago</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

<script>
    // Cuando el modal se abre, llenamos los campos ocultos correctamente
    $('#modalPago').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió el modal
        var idPasaje = button.data('id');
        var precio = button.data('precio');

        console.log("Abriendo modal - ID:", idPasaje, "Precio:", precio);

        var modal = $(this);
        modal.find('#idPasajePago').val(idPasaje); // ? Campo hidden
        modal.find('#montoPago').val(precio); // ? Campo visible
    });

    // Mostrar campos adicionales según método de pago
    $('#metodo').on('change', function () {
        var metodo = $(this).val();
        var extra = $('#extraCampos');
        extra.empty();

        if (metodo === 'tarjeta') {
            extra.append(`
              <div class="form-group">
                <label>Número de Tarjeta</label>
                <input type="text" name="numTarjeta" class="form-control" placeholder="XXXX-XXXX-XXXX-XXXX" required>
              </div>
              <div class="form-group">
                <label>CVV</label>
                <input type="text" name="cvv" class="form-control" maxlength="3" required>
              </div>
          `);
        } else if (metodo === 'yape') {
            extra.append(`
              <div class="form-group text-center">
                <p>Escanea el código QR para completar el pago:</p>
                <img src="img/yape_qr.jpeg" alt="QR Yape" style="width:150px;">
              </div>
          `);
        } else if (metodo === 'efectivo') {
            extra.append(`<p class="text-center text-muted">Podrás pagar al momento de abordar en ventanilla.</p>`);
        }
    });

    // Depuración antes de enviar el formulario
    $('form[action="svlPagar"]').on('submit', function (e) {
        console.log("Formulario enviado");
        console.log("ID PASAJE:", $('#idPasajePago').val());
        console.log("MONTO:", $('#montoPago').val());
    });
</script>


<script>
    // Ocultar mensaje después de 5 segundos
    setTimeout(() => {
        $('.alert').alert('close');
    }, 5000);
</script>

<%@ include file="footer/footer.jsp" %>