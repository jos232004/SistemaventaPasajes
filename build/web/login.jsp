<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<%
    HttpSession sesion = request.getSession(false);
    if (sesion != null && sesion.getAttribute("pasajero") != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>AndeBus</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="<%= path%>/img/favicon.ico" rel="icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="<%= path%>/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="<%= path%>/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="<%= path%>/css/style.css" rel="stylesheet">

        <style>
            /* === Estilos exclusivos para la página de login === */
            .login-page * {
                box-sizing: border-box;
            }

            .login-page h1 {
                font-weight: bold;
                margin: 0;
            }

            .login-page h2 {
                text-align: center;
            }

            .login-page p {
                font-size: 14px;
                font-weight: 100;
                line-height: 20px;
                letter-spacing: 0.5px;
                margin: 20px 0 30px;
            }

            .login-page span {
                font-size: 12px;
            }

            .login-page a {
                color: #333;
                font-size: 14px;
                text-decoration: none;
                margin: 15px 0;
            }

            .login-page button {
                border-radius: 20px;
                border: 1px solid #7ab730;
                background-color: #7ab730;
                color: #FFFFFF;
                font-size: 12px;
                font-weight: bold;
                padding: 12px 45px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: transform 80ms ease-in;
            }

            .login-page button:active {
                transform: scale(0.95);
            }

            .login-page button:focus {
                outline: none;
            }

            .login-page button.ghost {
                background-color: transparent;
                border-color: #FFFFFF;
            }

            .login-page form {
                background-color: #FFFFFF;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 50px;
                height: 100%;
                text-align: center;
            }

            .login-page input {
                background-color: #eee;
                border: none;
                padding: 12px 15px;
                margin: 8px 0;
                width: 100%;
            }

            .login-page .container {

                border-radius: 10px;

                position: relative;
                overflow: hidden;
                width: 768px;
                max-width: 100%;
                min-height: 610px;
                margin: 40px auto;
            }

            .login-page .form-container {
                position: absolute;
                top: 0;
                height: 100%;
                transition: all 0.6s ease-in-out;
            }

            .login-page .sign-in-container {
                left: 0;
                width: 50%;
                z-index: 2;
            }

            .login-page .container.right-panel-active .sign-in-container {
                transform: translateX(100%);
            }

            .login-page .sign-up-container {
                left: 0;
                width: 50%;
                opacity: 0;
                z-index: 1;
            }

            .login-page .container.right-panel-active .sign-up-container {
                transform: translateX(100%);
                opacity: 1;
                z-index: 5;
                animation: show 0.6s;
            }

            @keyframes show {
                0%, 49.99% {
                    opacity: 0;
                    z-index: 1;
                }

                50%, 100% {
                    opacity: 1;
                    z-index: 5;
                }
            }

            .login-page .overlay-container {
                position: absolute;
                top: 0;
                left: 50%;
                width: 50%;
                height: 100%;
                overflow: hidden;
                transition: transform 0.6s ease-in-out;
                z-index: 100;
            }

            .login-page .container.right-panel-active .overlay-container {
                transform: translateX(-100%);
            }

            .login-page .overlay {
                background: #FF416C;
                background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
                background: linear-gradient(to right, #609026, #75d200);
                background-repeat: no-repeat;
                background-size: cover;
                background-position: 0 0;
                color: #FFFFFF;
                position: relative;
                left: -100%;
                height: 100%;
                width: 200%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .login-page .container.right-panel-active .overlay {
                transform: translateX(50%);
            }

            .login-page .overlay-panel {
                position: absolute;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 40px;
                text-align: center;
                top: 0;
                height: 100%;
                width: 50%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .login-page .overlay-left {
                transform: translateX(-20%);
            }

            .login-page .container.right-panel-active .overlay-left {
                transform: translateX(0);
            }

            .login-page .overlay-right {
                right: 0;
                transform: translateX(0);
            }

            .login-page .container.right-panel-active .overlay-right {
                transform: translateX(20%);
            }

            .login-page .social-container {
                margin: 20px 0;
            }

            .login-page .social-container a {
                border: 1px solid #DDDDDD;
                border-radius: 50%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                margin: 0 5px;
                height: 40px;
                width: 40px;
            }
        </style>
    </head>
    <body>

        <!-- Topbar Start -->
        <div class="container-fluid bg-light pt-3 d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a href="mailto:henryjosebecerraiman530@gmail.com"><p><i class="fa fa-envelope mr-2"></i>henryjosebecerraiman530@gmail.com</p></a>
                            <p class="text-body px-3">|</p>
                            <p><i class="fa fa-phone-alt mr-2"></i>+51 951 833 077</p>
                        </div>
                    </div>
                    <div class="col-lg-6 text-center text-lg-right">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-primary px-3" target="_blank" href="https://www.facebook.com/">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-primary px-3" target="_blank" href="https://x.com/">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-primary px-3" target="_blank" href="https://pe.linkedin.com/">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-primary px-3" target="_blank" href="https://www.instagram.com/">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a class="text-primary pl-3" target="_blank" href="https://www.youtube.com/">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navegacion -->
        <div class="container-fluid position-relative nav-bar p-0">
            <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
                <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                    <a href="" class="navbar-brand">
                        <h1 class="m-0 text-primary"><span class="text-dark">ANDE</span>BUS</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                        <div class="navbar-nav ml-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link active">Inicio</a>
                            <a href="nosotros.jsp" class="nav-item nav-link">Nosotros</a>
                            <a href="servicios.jsp" class="nav-item nav-link">Servicios</a>
                            <a href="contactanos.jsp" class="nav-item nav-link">Contactanos</a>
                        </div>
                        <!-- Botón de Acceso -->

                    </div>
                </nav>
            </div>
        </div>
        <!-- Navegacion fin -->

        <!-- LOGIN WRAPPER -->
        <div class="login-page">

            <div class="container" id="container">
                <div class="form-container sign-up-container">
                    <form action="svlRegistro" method="post">
                        <h1>Crear una cuenta</h1>
                        <!-- comment 
                        <div class="social-container">
                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                        </div>-->
                        <span>Completa todos los campos</span>
                        <input type="text" name="dni" placeholder="DNI" required />
                        <input type="text" name="nombre" placeholder="Nombre" required />
                        <input type="text" name="apellido" placeholder="Apellido" required />
                        <input type="email" name="correo" placeholder="Correo electrónico" required />
                        <input type="password" name="password" placeholder="Contraseña" required />
                        <select name="sexo" required style="background-color: #eee; border: none; padding: 12px 15px; margin: 8px 0; width: 100%;">
                            <option value="" disabled selected>Seleccione su sexo</option>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                        <input type="date" name="fecha_nacimiento" placeholder="Fecha de nacimiento" />
                        <button>Inscribirse</button>
                    </form>
                </div>
                <div class="form-container sign-in-container">
                    <form action="svlLogin" method="post">
                        <h1>Iniciar sesión</h1>
                        <!-- comment <div class="social-container">
                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                        </div>-->
                        <span>usa tu cuenta</span>
                        <input type="email" name="correo" placeholder="Correo electrónico" required />
                        <input type="password" name="password" placeholder="Contraseña" required />
                        <a href="#">¿Olvidaste tu contraseña?</a>
                        <button>Iniciar sesión</button>
                        <% if (request.getAttribute("mensaje") != null) {%>
                        <div class="alert alert-danger mt-3" style="font-size:14px;">
                            <%= request.getAttribute("mensaje")%>
                        </div>
                        <% }%>
                    </form>
                </div>
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-panel overlay-left">
                            <h1 style="color: white">¡Bienvenido de nuevo!</h1>
                            <p>Para mantenerse conectado con nosotros, inicie sesión con su información personal.</p>
                            <button class="ghost" id="signIn">Iniciar sesión</button>
                        </div>
                        <div class="overlay-panel overlay-right">
                            <h1 style="color: white">¡Hola, amigo!</h1>
                            <p>Introduce tus datos personales y comienza tu viaje con nosotros</p>
                            <button class="ghost" id="signUp">Inscribirse</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 py-5 px-sm-3 px-lg-5" style="margin-top: 90px;">
            <div class="row pt-5">
                <div class="col-lg-4 col-md-6 mb-5">
                    <a href="" class="navbar-brand">
                        <h1 class="text-primary"><span class="text-white">ANDE</span>BUS</h1>
                    </a>
                    <p>Empresa de pasajes multiples AndeBus S.A.C</p>
                    <h6 class="text-white text-uppercase mt-4 mb-3" style="letter-spacing: 5px;">Síguenos</h6>
                    <div class="d-flex justify-content-start">
                        <a class="btn btn-outline-primary btn-square mr-2" href="https://x.com/"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-primary btn-square mr-2" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-primary btn-square mr-2" href="https://pe.linkedin.com/"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-primary btn-square" href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-5">
                    <h5 class="text-white text-uppercase mb-4" style="letter-spacing: 5px;">Otros servicios</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-white-50 mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Nosotros</a>
                        <a class="text-white-50 mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Destinos</a>
                        <a class="text-white-50 mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Servicios</a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-5">
                    <h5 class="text-white text-uppercase mb-4" style="letter-spacing: 5px;">Contactanos</h5>
                    <p><i class="fa fa-map-marker-alt mr-2"></i>Chiclayo - Perú</p>
                    <p><i class="fa fa-phone-alt mr-2"></i>+51 951 833 077</p>
                    <p><i class="fa fa-envelope mr-2"></i>henryjosebecerraiman530@gmail.com</p>
                </div>
            </div>
        </div>
        <div class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
            <div class="row">
                <div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
                    <p class="m-0 text-white-50">Copyright &copy; <a>ANDEBUS</a>. Todos los derechos reservados.
                    </p>
                </div>

            </div>
        </div>
        <!-- Footer End -->

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script>
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('container');

            signUpButton.addEventListener('click', () => {
                container.classList.add("right-panel-active");
            });

            signInButton.addEventListener('click', () => {
                container.classList.remove("right-panel-active");
            });
        </script>
        <script src="<%= path%>/lib/easing/easing.min.js"></script>
        <script src="<%= path%>/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="<%= path%>/lib/tempusdominus/js/moment.min.js"></script>
        <script src="<%= path%>/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="<%= path%>/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="<%= path%>/mail/jqBootstrapValidation.min.js"></script>
        <script src="<%= path%>/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="<%= path%>/js/main.js"></script>
    </body>

</html>
