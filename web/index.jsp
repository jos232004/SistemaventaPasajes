<%@ page import="java.util.List" %>
<%@ page import="modelo.DestinoDAO" %>

<%@ include file="header/header.jsp" %>
<%
    // Cargar los destinos (por si vienes directo al index)
    DestinoDAO dao = new DestinoDAO();
    List<String> listaDestinos = dao.listarCiudades();
%>

<!-- Portada -->
<div class="container-fluid p-0">
    <div id="header-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="w-100" src="img/portada.jpg" alt="Image">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 900px;">
                        <h4 class="text-white text-uppercase mb-md-3">Pasajes de bus nacionales:</h4>
                        <h1 class="display-3 text-primary mb-md-s4"><span class="display-3 text-white mb-md-4">Fácil y seguro con</span>ANDEBUS</h1>
                        <h4 class="text-white text-uppercase mb-md-3">Encuentra rutas, precios y asientos en segundos ¡Reserva hoy!</h4>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!-- Portada fin -->


<!-- Busqueda Start -->
<div class="container-fluid booking mt-5 pb-5">
    <div class="container pb-5">
        <form action="svlBuscarViajes" method="get">
            <div class="bg-light shadow" style="padding: 30px;">
                <div class="row align-items-center" style="min-height: 60px;">
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="mb-3 mb-md-0">
                                    <select name="origen" class="custom-select px-4" style="height: 47px;" required>
                                        <option value="" selected>Origen</option>
                                        <% for (String ciudad : listaDestinos) {%>
                                        <option value="<%= ciudad%>"><%= ciudad%></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3 mb-md-0">
                                    <select name="destino" class="custom-select px-4" style="height: 47px;" required>
                                        <option value="" selected>Destino</option>
                                        <% for (String ciudad : listaDestinos) {%>
                                        <option value="<%= ciudad%>"><%= ciudad%></option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3 mb-md-0">
                                    <input type="date" name="fechaSalida" class="form-control p-3" required>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3 mb-md-0">
                                    <input type="date" name="fechaRetorno" class="form-control p-3" placeholder="Fecha de retorno (opcional)">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary btn-block" type="submit" style="height: 47px;">Buscar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Busqueda End -->



<!-- nosotros Start -->
<div class="container-fluid py-5">
    <div class="container">
        <h6 class="text-primary text-uppercase text-center" style="letter-spacing: 5px;">Nosotros</h6>
        <h1 class="text-center mb-5 fw-bold">Disfruta la experiencia <span class="text-primary">ANDEBUS</span></h1>

        <!-- Grid de tarjetas -->
        <div class="row g-4">
            <!-- Tarjeta Destinos -->
            <div class="col-md-4">
                <div class="p-4 text-dark rounded shadow-sm d-flex flex-column justify-content-between" style="background-color:#D6E6FF; min-height: 200px;">
                    <div>
                        <span class="badge  mb-2">Destinos</span>
                        <h6 class="fw-bold">Llega a más lugares</h6>
                        <p>Descubre nuestra red de destinos y explora el Perú</p>
                    </div>
                    <div class="text-center">
                        <i class="bi bi-geo-alt-fill fs-1"></i>
                    </div>
                </div>
            </div>

            <!-- Tarjeta Flota -->
            <div class="col-md-4">
                <div class="p-4 text-dark rounded shadow-sm d-flex flex-column justify-content-between" style="background-color:#FADADD; min-height: 200px;">
                    <div>
                        <span class="badge mb-2">Flota</span>
                        <h6 class="fw-bold">Seguridad en cada viaje</h6>
                        <p>Una flota moderna y equipada con la mejor tecnología</p>
                    </div>
                    <div class="text-center">
                        <i class="bi bi-bus-front-fill fs-1"></i>
                    </div>
                </div>
            </div>

            <!-- Tarjeta Seguridad -->
            <div class="col-md-4">
                <div class="p-4 text-dark rounded shadow-sm d-flex flex-column justify-content-between" style="background-color:#C7F9CC; min-height: 200px;">
                    <div>
                        <span class="badge mb-2">Seguridad</span>
                        <h6 class="fw-bold">Control en cada unidad</h6>
                        <p>Monitoreo GPS 24/7 en todas nuestras unidades</p>
                    </div>
                    <div class="text-center">
                        <i class="bi bi-shield-lock-fill fs-1"></i>
                    </div>
                </div>
            </div>

            <!-- Tarjeta Terminales -->
            <div class="col-md-4 mt-4">
                <div class="p-4 text-dark rounded shadow-sm d-flex flex-column justify-content-between" style="background-color:#FFF5BA; min-height: 200px;">
                    <div>
                        <span class="badge  mb-2">Terminales</span>
                        <h6 class="fw-bold">Instalaciones a tu servicio</h6>
                        <p>Accede a nuestras terminales modernas y bien equipadas</p>
                    </div>
                    <div class="text-center">
                        <i class="bi bi-building fs-1"></i>
                    </div>
                </div>
            </div>

            <!-- Tarjeta Confort -->
            <div class="col-md-4 mt-4">
                <div class="p-4 text-dark rounded shadow-sm d-flex flex-column justify-content-between" style="background-color:#EDE7F6; min-height: 200px;">
                    <div>
                        <span class="badge  mb-2">Confort</span>
                        <h6 class="fw-bold">Un descanso saludable</h6>
                        <p>Disfruta de nuestros cómodos asientos ergonómicos</p>
                    </div>
                    <div class="text-center">
                        <i class="bi bi-moon-stars-fill fs-1"></i>
                    </div>
                </div>
            </div>

            <!-- Tarjeta Comodidades -->
            <div class="col-md-4 mt-4">
                <div class="p-4 text-dark rounded shadow-sm d-flex flex-column justify-content-between" style="background-color:#FFE0B2; min-height: 200px;">
                    <div>
                        <span class="badge  mb-2">Comodidades</span>
                        <h6 class="fw-bold">Un viaje  placentero</h6>
                        <p>Aire acondicionado, TV, servicios higiénicos y más</p>
                    </div>
                    <div class="text-center">
                        <i class="bi bi-tv-fill fs-1"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- nosotros End -->

<!-- Destination Start -->
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-3 pb-3">
            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Destino</h6>
            <h1>Encuentra tu destino!</h1>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="destination-item position-relative overflow-hidden mb-2">
                    <img class="img-fluid" src="img/destino_arequipa.jpg" alt="">
                    <a class="destination-overlay text-white text-decoration-none" >
                        <h5 class="text-white">Arequipa</h5>

                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="destination-item position-relative overflow-hidden mb-2">
                    <img class="img-fluid" src="img/destino_chiclayo.jpg" alt="">
                    <a class="destination-overlay text-white text-decoration-none">
                        <h5 class="text-white">Chiclayo</h5>

                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="destination-item position-relative overflow-hidden mb-2">
                    <img class="img-fluid" src="img/mancora.jpg" alt="">
                    <a class="destination-overlay text-white text-decoration-none" >
                        <h5 class="text-white">Mancora</h5>

                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="destination-item position-relative overflow-hidden mb-2">
                    <img class="img-fluid" src="img/destino_lima.jpg" alt="">
                    <a class="destination-overlay text-white text-decoration-none" >
                        <h5 class="text-white">Lima</h5>

                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="destination-item position-relative overflow-hidden mb-2">
                    <img class="img-fluid" src="img/destino_cusco_imagen2.jpg" alt="">
                    <a class="destination-overlay text-white text-decoration-none" >
                        <h5 class="text-white">Cusco</h5>

                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="destination-item position-relative overflow-hidden mb-2">
                    <img class="img-fluid" src="img/destino_trujillo_imagen1.jpg" alt="">
                    <a class="destination-overlay text-white text-decoration-none">
                        <h5 class="text-white">Trujillo</h5>

                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Destination Start -->




<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const origenSelect = document.querySelector('select[name="origen"]');
        const destinoSelect = document.querySelector('select[name="destino"]');
        const fechaSalida = document.querySelector('input[name="fechaSalida"]');

        // ===== 1?? Evitar que origen y destino sean iguales =====
        function actualizarOpcionesBloqueadas() {
            const origenSeleccionado = origenSelect.value;
            const destinoSeleccionado = destinoSelect.value;

            // Restaurar todas las opciones
            Array.from(origenSelect.options).forEach(opt => opt.disabled = false);
            Array.from(destinoSelect.options).forEach(opt => opt.disabled = false);

            // Deshabilitar la opción seleccionada en el otro select
            if (origenSeleccionado) {
                Array.from(destinoSelect.options).forEach(opt => {
                    if (opt.value === origenSeleccionado)
                        opt.disabled = true;
                });
            }
            if (destinoSeleccionado) {
                Array.from(origenSelect.options).forEach(opt => {
                    if (opt.value === destinoSeleccionado)
                        opt.disabled = true;
                });
            }

            // Si ambas son iguales, limpiar destino
            if (origenSeleccionado === destinoSeleccionado && origenSeleccionado !== "") {
                destinoSelect.value = "";
            }
        }

        origenSelect.addEventListener('change', actualizarOpcionesBloqueadas);
        destinoSelect.addEventListener('change', actualizarOpcionesBloqueadas);



    });
</script>




<%@ include file="footer/footer.jsp" %>
