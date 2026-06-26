# 🚌 Sistema de Venta de Pasajes Multiempresa (Java, JSP, MVC)

Este es un proyecto universitario integral desarrollado en Java Web utilizando el patrón de arquitectura **MVC (Modelo-Vista-Controlador)** y **MySQL**. El sistema permite centralizar la venta de pasajes de autobús para múltiples empresas de transporte.

## 👥 Interfaces del Sistema

El sistema está dividido en dos grandes módulos con accesos y permisos independientes:

1. **Plataforma del Cliente (E-Commerce):**
   * Búsqueda dinámica de pasajes por origen, destino, fecha y hora.
   * Selección de asientos en un mapa interactivo del autobús.
   * Proceso de compra y simulación de pago.
   * Generación y descarga del boleto de viaje.

2. **Panel de Gestión Interna (Multiempresa / Admin):**
   * **Super Administrador:** Registro de nuevas empresas de transporte, terminales, rutas y gestión de usuarios globales.
   * **Administrador de Empresa:** Gestión de su propia flota de autobuses, asignación de choferes, creación de horarios, control de precios y visualización de reportes de ventas.
