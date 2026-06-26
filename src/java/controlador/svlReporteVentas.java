package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ReporteDAO;

/**
 *
 * @author PC
 */
@WebServlet(name = "svlReporteVentas", urlPatterns = {"/svlReporteVentas"})//AQUI ME QUEDE
public class svlReporteVentas extends HttpServlet {

    private final ReporteDAO viajeDAO = new ReporteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlReporteVentas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlReporteVentas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, Map<Integer, Double>> reporte = viajeDAO.ventasPorEmpresaMes();
        request.setAttribute("reporte", reporte);
        request.getRequestDispatcher("reporteVentas.jsp").forward(request, response);
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
