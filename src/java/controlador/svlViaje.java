package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import modelo.viajeAdmin;
import modelo.viajeAdminDAO;
import modelo.Bus;
import modelo.BusDAO;
import modelo.Destino;
import modelo.DestinoDAO;

/**
 *
 * @author PC
 */
@WebServlet(name = "svlViaje", urlPatterns = {"/svlViaje"})
public class svlViaje extends HttpServlet {

    viajeAdminDAO viajeDAO = new viajeAdminDAO();
    BusDAO busDAO = new BusDAO();
    DestinoDAO destinoDAO = new DestinoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlViaje</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlViaje at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");

        switch (action) {
            case "listar":
                listar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            default:
                listar(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "agregar":
                agregar(request, response);
                break;
            case "actualizar":
                actualizar(request, response);
                break;
            default:
                listar(request, response);
        }
    }

    // ============================
    //           LISTAR
    // ============================
    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<viajeAdmin> lista = viajeDAO.listar();
        List<Bus> buses = busDAO.listar();
        List<Destino> destinos = destinoDAO.listar();

        request.setAttribute("lista", lista);
        request.setAttribute("buses", buses);
        request.setAttribute("destinos", destinos);

        request.getRequestDispatcher("viajes.jsp").forward(request, response);
    }

    // ============================
    //           AGREGAR
    // ============================
    private void agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idBus = Integer.parseInt(request.getParameter("idBus"));
            int origen = Integer.parseInt(request.getParameter("origen"));
            int destino = Integer.parseInt(request.getParameter("destino"));
            Date fecha = Date.valueOf(request.getParameter("fechaSalida")); // formato: yyyy-MM-dd
            Time hora = Time.valueOf(request.getParameter("horaSalida") + ":00"); // HH:mm -> HH:mm:ss
            double precio = Double.parseDouble(request.getParameter("precio"));

            viajeAdmin v = new viajeAdmin(0, idBus, origen, destino, fecha, hora, precio);
            viajeDAO.agregar(v);

            response.sendRedirect("svlViaje?action=listar");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("svlViaje?action=listar");
        }
    }

    // ============================
    //          ACTUALIZAR
    // ============================
    private void actualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int idBus = Integer.parseInt(request.getParameter("idBus"));
            int origen = Integer.parseInt(request.getParameter("origen"));
            int destino = Integer.parseInt(request.getParameter("destino"));
            Date fecha = Date.valueOf(request.getParameter("fechaSalida")); // yyyy-MM-dd
            // Aceptar HH:mm o HH:mm:ss
            String horaParam = request.getParameter("horaSalida");
            if (horaParam.length() == 5) {
                horaParam += ":00";
            }
            Time hora = Time.valueOf(horaParam);
            double precio = Double.parseDouble(request.getParameter("precio"));

            viajeAdmin v = new viajeAdmin(id, idBus, origen, destino, fecha, hora, precio);
            viajeDAO.editar(v);

            response.sendRedirect("svlViaje?action=listar");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("svlViaje?action=listar");
        }
    }

    // ============================
    //           ELIMINAR
    // ============================
    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            viajeDAO.eliminar(id);
            response.sendRedirect("svlViaje?action=listar");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("svlViaje?action=listar");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
