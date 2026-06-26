<%@ page import="java.util.List" %>
<%@ page import="modelo.Viaje" %>
<%@ include file="header/header.jsp" %>
<%
    if (sesion == null || sesion.getAttribute("pasajero") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    //Me quede en esta pagina, no se si continuar o pedir que me agregue datos :c
%>

<div class="container mt-5 mb-5">
    <h2 class="text-center mb-4">Viajes Disponibles</h2>

    <%
        List<Viaje> listaViajes = (List<Viaje>) request.getAttribute("listaViajes");
        if (listaViajes != null && !listaViajes.isEmpty()) {
    %>

    <div class="row">
        <% for (Viaje v : listaViajes) {%>
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card shadow-sm border-0 h-100">
                <img src="img/buses/<%= v.getImagenBus()%>" 
                     class="card-img-top" 
                     alt="Imagen del bus" 
                     style="height: 180px; object-fit: cover;">

                <div class="card-body">
                    <h5 class="card-title text-primary"><%= v.getOrigen()%> ? <%= v.getDestino()%></h5>
                    <p class="card-text mb-1"><i class="bi bi-calendar-event"></i> <strong>Fecha:</strong> <%= v.getFechaSalida()%></p>
                    <p class="card-text mb-1"><i class="bi bi-clock"></i> <strong>Hora:</strong> <%= v.getHoraSalida()%></p>
                    <p class="card-text mb-1"><i class="bi bi-bus-front"></i> <strong>Bus:</strong> <%= v.getTipoBus()%></p>
                    <p class="card-text mb-1"><i class="bi bi-building"></i> <strong>Empresa:</strong> <%= v.getEmpresa()%></p>
                    <h5 class="text-success mt-2">S/ <%= v.getPrecio()%></h5>
                    <a href="reservar.jsp?idViaje=<%= v.getIdViaje() %>" class="btn btn-primary w-100 mt-3">Reservar</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <% } else { %>
    <div class="alert alert-warning text-center">
        No se encontraron viajes disponibles para tu búsqueda.
    </div>
    <% }%>
</div>

<%@ include file="footer/footer.jsp" %>
