package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.PasajeDAO;
import modelo.PagoDAO;
import modelo.Pago;

@WebServlet(name = "svlPagar", urlPatterns = {"/svlPagar"})
public class svlPagar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlPagar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlPagar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*
        int idPasaje = Integer.parseInt(request.getParameter("idPasaje"));
        PasajeDAO pdao = new PasajeDAO();
        pdao.actualizarEstado(idPasaje, "pagado");
        response.sendRedirect("misReservas.jsp");POR SI ACASO*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idPasajeStr = request.getParameter("idPasaje");
        if (idPasajeStr == null || idPasajeStr.trim().isEmpty()) {
            System.out.println("ID PASAJE RECIBIDO: " + request.getParameter("idPasaje"));
            System.out.println("METODO: " + request.getParameter("metodo"));
            System.out.println("MONTO: " + request.getParameter("monto"));
            request.setAttribute("mensaje", "Error: No se recibió el ID del pasaje.");
            request.getRequestDispatcher("misReservas.jsp").forward(request, response);
            return;
        }

        int idPasaje = Integer.parseInt(idPasajeStr);
        String metodo = request.getParameter("metodo");
        double monto = Double.parseDouble(request.getParameter("monto"));

        Pago pago = new Pago();
        pago.setIdPasaje(idPasaje);
        pago.setMetodo(metodo);
        pago.setMonto(monto);

        PagoDAO dao = new PagoDAO();
        boolean exito = dao.registrarPago(pago);// OJO: PREGUNTAR: CUANDO DOY EN CONFIMRAR PAGO ME SALE EL SIGUIENTE ERROR... MUESTRAS EL ERROR

        if (exito) {
            request.setAttribute("mensaje", "Pago realizado correctamente.");
        } else {
            request.setAttribute("mensaje", "No se pudo procesar el pago.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("misReservas.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
