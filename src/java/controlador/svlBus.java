package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.BusDAO;
import modelo.EmpresaDAO;
import modelo.Bus;
import modelo.Empresa;
import java.io.File;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author PC
 */
@WebServlet(name = "svlBus", urlPatterns = {"/svlBus"})
@MultipartConfig
public class svlBus extends HttpServlet {

    BusDAO busDAO = new BusDAO();
    EmpresaDAO empresaDAO = new EmpresaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlBus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlBus at " + request.getContextPath() + "</h1>");
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

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Bus> lista = busDAO.listar();
        List<Empresa> empresas = empresaDAO.listar();
        request.setAttribute("lista", lista);
        request.setAttribute("empresas", empresas);
        request.getRequestDispatcher("buses.jsp").forward(request, response);
    }

    private void agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
        String placa = request.getParameter("placa");
        String tipo = request.getParameter("tipo");
        int capacidad = Integer.parseInt(request.getParameter("capacidad"));

        Part filePart = request.getPart("imagen");
        String nombreArchivo = filePart.getSubmittedFileName();

        String uploadPath = request.getServletContext().getRealPath("") + "img/buses/";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        filePart.write(uploadPath + nombreArchivo);

        Bus bus = new Bus(0, idEmpresa, placa, tipo, capacidad, nombreArchivo);
        busDAO.agregar(bus);

        response.sendRedirect("svlBus?action=listar");
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
        String placa = request.getParameter("placa");
        String tipo = request.getParameter("tipo");
        int capacidad = Integer.parseInt(request.getParameter("capacidad"));

        Part filePart = request.getPart("imagen");
        String nombreArchivo = filePart.getSubmittedFileName();

        String uploadPath = request.getServletContext().getRealPath("") + "img/buses/";
        if (nombreArchivo != null && !nombreArchivo.isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            filePart.write(uploadPath + nombreArchivo);
        } else {
            Bus viejo = busDAO.obtener(id);
            nombreArchivo = viejo.getImagen();
        }

        Bus bus = new Bus(id, idEmpresa, placa, tipo, capacidad, nombreArchivo);
        busDAO.editar(bus);

        response.sendRedirect("svlBus?action=listar");
    }

    // ============================
    //          ELIMINAR
    // ============================
    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        busDAO.eliminar(id);

        response.sendRedirect("svlBus?action=listar");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
