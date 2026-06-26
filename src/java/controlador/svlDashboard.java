/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import modelo.EmpresaDAO;
import modelo.BusDAO;
import modelo.DestinoDAO;
import modelo.viajeAdminDAO;
import modelo.viajeAdmin;

@WebServlet(name = "svlDashboard", urlPatterns = {"/svlDashboard"})
public class svlDashboard extends HttpServlet {

    private final EmpresaDAO empresaDAO = new EmpresaDAO();
    private final BusDAO busDAO = new BusDAO();
    private final DestinoDAO destinoDAO = new DestinoDAO();
    private final viajeAdminDAO viajeDAO = new viajeAdminDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlDashboard at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Totales
        int totalEmpresas = empresaDAO.listar().size();
        int totalBuses = busDAO.listar().size();
        int totalDestinos = destinoDAO.listar().size();
        int totalViajes = viajeDAO.listar().size();

        // Datos para gráficos
        List<viajeAdmin> viajes = viajeDAO.listar();

        // --- Viajes por mes ---
        Map<String, Integer> viajesPorMes = new LinkedHashMap<>();
        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
            "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        for (String m : meses) {
            viajesPorMes.put(m, 0);
        }

        for (viajeAdmin v : viajes) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(v.getFechaSalida());
            int mes = cal.get(Calendar.MONTH); // 0-11
            String nombreMes = meses[mes];
            viajesPorMes.put(nombreMes, viajesPorMes.get(nombreMes) + 1);
        }

        // --- Viajes por empresa ---
        Map<String, Integer> viajesPorEmpresa = new LinkedHashMap<>();
        for (viajeAdmin v : viajes) {
            String empresa = v.getEmpresaBus();
            viajesPorEmpresa.put(empresa, viajesPorEmpresa.getOrDefault(empresa, 0) + 1);
        }

        // Atributos al JSP
        request.setAttribute("totalEmpresas", totalEmpresas);
        request.setAttribute("totalBuses", totalBuses);
        request.setAttribute("totalDestinos", totalDestinos);
        request.setAttribute("totalViajes", totalViajes);
        request.setAttribute("viajesPorMes", viajesPorMes);
        request.setAttribute("viajesPorEmpresa", viajesPorEmpresa);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
