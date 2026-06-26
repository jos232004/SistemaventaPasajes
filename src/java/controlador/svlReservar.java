package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.PasajeDAO;
import modelo.Pasajero;

@WebServlet(name = "svlReservar", urlPatterns = {"/svlReservar"})
public class svlReservar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlReservar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlReservar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Pasajero pasajero = (Pasajero) sesion.getAttribute("pasajero");
        if (pasajero == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int idViaje = Integer.parseInt(request.getParameter("idViaje"));
        int asiento = Integer.parseInt(request.getParameter("asiento"));

        PasajeDAO pdao = new PasajeDAO();
        boolean exito = pdao.reservarAsiento(pasajero.getId_pasajero(), idViaje, asiento);

        if (exito) {
            response.sendRedirect("misReservas.jsp?msg=ok");
        } else {
            response.sendRedirect("reservar.jsp?idViaje=" + idViaje + "&error=1");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
