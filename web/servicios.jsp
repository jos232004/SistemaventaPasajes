<%@ include file="header/header.jsp" %>

<!-- Header Start -->
<div class="container-fluid page-header">
    <div class="container">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
            <h3 class="display-4 text-white text-uppercase">Servicios</h3>
            <div class="d-inline-flex text-white">
                <p class="m-0 text-uppercase"><a class="text-white" href="index.jsp">Inicio</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Servicios</p>
            </div>
        </div>
    </div>
</div>
<!-- Header End -->

<!-- Service Start -->
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-3 pb-3">
            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Servicios</h6>
            <h1 class="fw-bold">Lo que ofrecemos en <span class="text-primary">ANDEBUS</span></h1>
            <p class="text-muted">Conectamos al Perú con un servicio seguro, rápido y confiable</p>
        </div>

        <!-- Aquí el fix: justify-content-center -->
        <div class="row justify-content-center">

            <!-- Venta de pasajes -->
            <div class="col-lg-4 col-md-6 mb-4 d-flex">
                <div class="service-item bg-white text-center shadow-sm py-5 px-4 h-100 rounded w-100">
                    <i class="bi bi-ticket-detailed text-primary fs-1 mb-3"></i>
                    <h5 class="mb-3 fw-bold">Venta de pasajes online</h5>
                    <p>Compra tus boletos de forma rápida y segura desde nuestra web.</p>
                </div>
            </div>

            <!-- Viajes nacionales -->
            <div class="col-lg-4 col-md-6 mb-4 d-flex">
                <div class="service-item bg-white text-center shadow-sm py-5 px-4 h-100 rounded w-100">
                    <i class="bi bi-bus-front text-success fs-1 mb-3"></i>
                    <h5 class="mb-3 fw-bold">Viajes nacionales</h5>
                    <p>Cubrimos rutas a nivel nacional, conectando las principales ciudades del Perú.</p>
                </div>
            </div>

            <!-- Encomiendas -->
            <div class="col-lg-4 col-md-6 mb-4 d-flex">
                <div class="service-item bg-white text-center shadow-sm py-5 px-4 h-100 rounded w-100">
                    <i class="bi bi-box-seam text-warning fs-1 mb-3"></i>
                    <h5 class="mb-3 fw-bold">Encomiendas</h5>
                    <p>Envía tus paquetes y documentos de manera rápida y segura.</p>
                </div>
            </div>

            <!-- Servicios empresariales -->
            <div class="col-lg-4 col-md-6 mb-4 d-flex">
                <div class="service-item bg-white text-center shadow-sm py-5 px-4 h-100 rounded w-100">
                    <i class="bi bi-briefcase text-danger fs-1 mb-3"></i>
                    <h5 class="mb-3 fw-bold">Servicios empresariales</h5>
                    <p>Soluciones de transporte para empresas y organizaciones.</p>
                </div>
            </div>

            <!-- Viajes turísticos -->
            <div class="col-lg-4 col-md-6 mb-4 d-flex">
                <div class="service-item bg-white text-center shadow-sm py-5 px-4 h-100 rounded w-100">
                    <i class="bi bi-geo-alt text-info fs-1 mb-3"></i>
                    <h5 class="mb-3 fw-bold">Viajes turísticos</h5>
                    <p>Descubre el Perú con nuestros paquetes turísticos exclusivos.</p>
                </div>
            </div>

            <!-- Atención al cliente -->
            <div class="col-lg-4 col-md-6 mb-4 d-flex">
                <div class="service-item bg-white text-center shadow-sm py-5 px-4 h-100 rounded w-100">
                    <i class="bi bi-headset text-secondary fs-1 mb-3"></i>
                    <h5 class="mb-3 fw-bold">Atención al cliente</h5>
                    <p>Soporte personalizado para resolver tus dudas las 24 horas.</p>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Service End -->


<%@ include file="footer/footer.jsp" %>