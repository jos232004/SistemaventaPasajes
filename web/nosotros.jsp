<%@ include file="header/header.jsp" %>

<!-- Header Start -->
<div class="container-fluid page-header">
    <div class="container">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
            <h3 class="display-4 text-white text-uppercase">Nosotros</h3>
            <div class="d-inline-flex text-white">
                <p class="m-0 text-uppercase"><a class="text-white" href="index.jsp">Inicio</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Nosotros</p>
            </div>
        </div>
    </div>
</div>
<!-- Header End -->

<!-- About Start -->
<div class="container-fluid py-5">
    <div class="container">
        <h6 class="text-primary text-uppercase text-center" style="letter-spacing: 5px;">Nosotros</h6>
        <h1 class="text-center mb-5 fw-bold">
            Disfruta la experiencia <span class="text-primary">ANDEBUS</span>
        </h1>

        <!-- Tarjetas de información -->
        <div class="row g-4">
            <!-- Misión -->
            <div class="col-md-4">
                <div class="p-4 text-dark rounded shadow-sm text-center h-100" style="background-color:#E3F2FD;">
                    <i class="bi bi-bullseye fs-1 text-primary mb-3"></i>
                    <h5 class="fw-bold">Misión</h5>
                    <p>Brindar un servicio de transporte seguro, puntual y cómodo, conectando a nuestros pasajeros con los principales destinos del país.</p>
                </div>
            </div>

            <!-- Visión -->
            <div class="col-md-4">
                <div class="p-4 text-dark rounded shadow-sm text-center h-100" style="background-color:#F1F8E9;">
                    <i class="bi bi-eye fs-1 text-success mb-3"></i>
                    <h5 class="fw-bold">Visión</h5>
                    <p>Ser la empresa de transporte líder en el Perú, reconocida por su innovación, calidad y experiencia de viaje inigualable.</p>
                </div>
            </div>

            <!-- Valores -->
            <div class="col-md-4">
                <div class="p-4 text-dark rounded shadow-sm text-center h-100" style="background-color:#FFF3E0;">
                    <i class="bi bi-stars fs-1 text-warning mb-3"></i>
                    <h5 class="fw-bold">Valores</h5>
                    <p>Compromiso, seguridad y respeto por cada pasajero. Trabajamos para ofrecer viajes agradables y confiables en cada trayecto.</p>
                </div>
            </div>
        </div>

        <!-- Imagen inferior opcional -->
        <div class="row mt-5">
            <div class="col text-center">
                <img src="img/nosotros.jpeg" class="img-fluid rounded shadow-sm" alt="Nuestra Empresa" style="max-width: 70%;">
            </div>
        </div>
    </div>
</div>
<!-- About End -->

<%@ include file="footer/footer.jsp" %>
