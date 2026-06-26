package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Empresa;
import modelo.EmpresaDAO;
import java.util.List;
import javax.servlet.http.HttpSession;

@WebServlet(name = "svlEmpresa", urlPatterns = {"/svlEmpresa"})
public class svlEmpresa extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private EmpresaDAO dao = new EmpresaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svlEmpresa</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svlEmpresa at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // seguridad: comprobar sesión y rol (si quieres duplicar lógica puedes eliminar)
        HttpSession sesion = request.getSession(false);
        if (sesion == null || !"admin".equals(sesion.getAttribute("rol"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                List<Empresa> lista = dao.listar();
                request.setAttribute("listaEmpresas", lista);
                request.getRequestDispatcher("empresas.jsp").forward(request, response);
                break;

            case "eliminar":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    dao.eliminar(id);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                response.sendRedirect("svlEmpresa?accion=listar");
                break;

            default:
                response.sendRedirect("svlEmpresa?accion=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // recibir datos del formulario (agregar o editar)
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id"); // puede venir vacío si es nuevo
        String nombre = request.getParameter("nombre");
        String ruc = request.getParameter("ruc");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");

        Empresa e = new Empresa();
        e.setNombre(nombre);
        e.setRuc(ruc);
        e.setTelefono(telefono);
        e.setCorreo(correo);
        e.setDireccion(direccion);

        try {
            if (idStr == null || idStr.isEmpty()) {
                // agregar
                dao.agregar(e);
            } else {
                // actualizar
                System.out.println("entro al metodo actualizar");
                e.setId_empresa(Integer.parseInt(idStr));
                dao.actualizar(e);
            }
        } catch (Exception ex) {
            System.out.println("Error");
            ex.printStackTrace();
        }

        response.sendRedirect("svlEmpresa?accion=listar");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
