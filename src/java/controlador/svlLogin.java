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
@WebServlet(name = "svlLogin", urlPatterns = {"/svlLogin"})
public class svlLogin extends HttpServlet {

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

        //Recibe datos del formulario y valida con UsuarioDAO
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        // Validar pasajero
        PasajeroDAO pdao = new PasajeroDAO();
        Pasajero pasajero = pdao.validar(correo, password);

        if (pasajero != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("pasajero", pasajero);
            
            sesion.setAttribute("nombre", pasajero.getNombre());

            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        // Sino es pasajero, validar al administrador
        UsuarioDAO udao = new UsuarioDAO();
        Usuario admin = udao.validar(correo, password);

        if (admin != null && "admin".equals(admin.getRol())) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("admin", admin);
            sesion.setAttribute("rol", "admin");
            sesion.setAttribute("nombre", admin.getNombre());

            // Redirigir al Panel Admin
            response.sendRedirect(request.getContextPath() + "/svlDashboard");
            return;
        }

        // 3️⃣ SI NO ES NINGUNO → ERROR
        request.setAttribute("mensaje", "Correo o contraseña incorrectos");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
