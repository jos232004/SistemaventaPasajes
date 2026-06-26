<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="modelo.*" %>

<%@ include file="header/header.jsp" %>
<%
    if (sesion == null || sesion.getAttribute("pasajero") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    //Me quede en esta pagina, no se si continuar o pedir que me agregue datos :c
%>
<%
    int idViaje = Integer.parseInt(request.getParameter("idViaje"));
    ViajeDAO vdao = new ViajeDAO();
    Viaje viaje = vdao.obtenerViajePorId(idViaje);
%>


<style>
    .bus-container {
        display: grid;
        grid-template-columns: repeat(4, 60px);
        gap: 15px;
        justify-content: center;
        padding: 20px;
    }
    .asiento {
        width: 60px;
        height: 60px;
        border-radius: 10px;
        text-align: center;
        line-height: 60px;
        font-weight: bold;
        cursor: pointer;
        background-color: #e0e0e0;
        transition: 0.2s;
    }
    .asiento:hover {
        background-color: #b5e48c;
    }
    .asiento.ocupado {
        background-color: #e63946;
        color: white;
        cursor: not-allowed;
    }
    .asiento.seleccionado {
        background-color: #40916c;
        color: white;
    }
</style>


<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">Reserva tu asiento</h2>
    <div class="text-center mb-4">
        <h5><%= viaje.getOrigen()%> ? <%= viaje.getDestino()%></h5>
        <p><strong>Fecha:</strong> <%= viaje.getFechaSalida()%> | <strong>Hora:</strong> <%= viaje.getHoraSalida()%> | <strong>Precio:</strong> S/ <%= viaje.getPrecio()%></p>
    </div>

    <div class="bus-container" id="asientos">
        <%
            // Ejemplo: supongamos que el bus tiene 40 asientos
            PasajeDAO pdao = new PasajeDAO();
            List<Integer> ocupados = pdao.obtenerAsientosOcupados(idViaje);

            for (int i = 1; i <= viaje.getCapacidadBus(); i++) {
                boolean esOcupado = ocupados.contains(i);
        %>
        <div class="asiento <%= esOcupado ? "ocupado" : ""%>" data-num="<%= i%>">
            <%= i%>
        </div>
        <% }%>
    </div>

    <div class="text-center mt-4">
        <form id="formReserva" action="svlReservar" method="post">
            <input type="hidden" name="idViaje" value="<%= idViaje%>">
            <input type="hidden" name="asiento" id="asientoSeleccionado">
            <button type="submit" class="btn btn-success px-4 py-2">Confirmar Reserva</button>
        </form>
    </div>
</div>

<script>
    const asientos = document.querySelectorAll('.asiento:not(.ocupado)');
    const inputAsiento = document.getElementById('asientoSeleccionado');

    asientos.forEach(a => {
        a.addEventListener('click', () => {
            asientos.forEach(b => b.classList.remove('seleccionado'));
            a.classList.add('seleccionado');
            inputAsiento.value = a.dataset.num;
        });
    });

    document.getElementById('formReserva').addEventListener('submit', e => {
        if (!inputAsiento.value) {
            e.preventDefault();
            alert('Por favor selecciona un asiento.');
        }
    });
</script>

<%@ include file="footer/footer.jsp" %>
