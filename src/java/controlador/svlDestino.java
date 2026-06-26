package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Destino;
import modelo.DestinoDAO;

@WebServlet(name = "svlDestino", urlPatterns = {"/svlDestino"})
public class svlDestino extends HttpServlet {

    //INSTANCIA DE DESTINODAO
    DestinoDAO dao = new DestinoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlDestino</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlDestino at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {

            case "listar":
                List<Destino> lista = dao.listar();
                request.setAttribute("destinos", lista);
                request.getRequestDispatcher("destinos.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("svlDestino?accion=listar");
                break;

            default:
                response.sendRedirect("svlDestino?accion=listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        switch (accion) {

            case "agregar":
                Destino d1 = new Destino();
                d1.setCiudad(request.getParameter("ciudad"));
                d1.setTerminal(request.getParameter("terminal"));
                dao.agregar(d1);
                break;

            case "editar":
                Destino d2 = new Destino();
                d2.setId(Integer.parseInt(request.getParameter("id")));
                d2.setCiudad(request.getParameter("ciudad"));
                d2.setTerminal(request.getParameter("terminal"));
                dao.editar(d2);
                break;
        }

        response.sendRedirect("svlDestino?accion=listar");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
