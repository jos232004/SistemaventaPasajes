package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.UsuarioDAO;
import modelo.Pasajero;
import modelo.PasajeroDAO;

/**
 *
 * @author PC
 */
@WebServlet(name = "svlRegistro", urlPatterns = {"/svlRegistro"})
public class svlRegistro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

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

        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String sexo = request.getParameter("sexo");
        String fecha = request.getParameter("fecha_nacimiento");

        Pasajero p = new Pasajero();
        p.setDni(dni);
        p.setNombre(nombre);
        p.setApellido(apellido);
        p.setCorreo(correo);
        p.setPassword(password);
        p.setSexo(sexo);
        p.setFecha_nacimiento(fecha);

        PasajeroDAO dao = new PasajeroDAO();
        boolean registrado = dao.registrar(p);

        if (registrado) {
            request.setAttribute("mensaje", "Registro exitoso. Ahora inicia sesión.");
        } else {
            request.setAttribute("mensaje", "Error al registrar. Intente nuevamente.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
