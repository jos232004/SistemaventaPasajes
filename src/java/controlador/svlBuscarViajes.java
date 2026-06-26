/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Viaje;
import modelo.ViajeDAO;
import java.util.List;
import javax.servlet.RequestDispatcher;
import modelo.DestinoDAO;

/**
 *
 * @author PC
 */
@WebServlet(name = "svlBuscarViajes", urlPatterns = {"/svlBuscarViajes"})
public class svlBuscarViajes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlBuscarViajes</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlBuscarViajes at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String origen = request.getParameter("origen");
        String destino = request.getParameter("destino");
        String fechaSalida = request.getParameter("fechaSalida");

        // DAO de destinos (para el formulario)
        DestinoDAO daoDestinos = new DestinoDAO();
        List<String> listaDestinos = daoDestinos.listarCiudades();
        request.setAttribute("listaDestinos", listaDestinos);

        if (origen != null && destino != null && fechaSalida != null) {
            ViajeDAO daoViajes = new ViajeDAO();
            List<Viaje> listaViajes = daoViajes.buscarViajes(origen, destino, fechaSalida);
            request.setAttribute("listaViajes", listaViajes);
            RequestDispatcher rd = request.getRequestDispatcher("buscarViajes.jsp");
            rd.forward(request, response);
        } else {
            // Si no hay parámetros, solo redirige al index con los destinos cargados
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
