package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {

    //Validamos al usuario.
    public Usuario validar(String correo, String password) {
        Usuario u = null;
        try {
            Conexion cn = new Conexion();
            String sql = "SELECT * FROM usuarios WHERE correo = ? AND password = ?";
            PreparedStatement ps = cn.Con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                //Agregamos datos a la clase usuario
                u = new Usuario();
                u.setId_usuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setPassword(rs.getString("password"));
                u.setRol(rs.getString("rol"));
            }

            cn.Con.close();
        } catch (Exception e) {
            System.err.println("Error al validar usuario: " + e);
        }
        return u;
    }
    
    //Registramos al usuario
    public boolean registrar(Usuario u) {
        boolean registrado = false;
        try {
            Conexion cn = new Conexion();
            String sql = "INSERT INTO usuarios(nombre, correo, password, rol) VALUES(?, ?, ?, 'cliente')";
            PreparedStatement ps = cn.Con.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getPassword());
            ps.executeUpdate();
            registrado = true;
            cn.Con.close();
        } catch (Exception e) {
            System.err.println("Error al registrar usuario: " + e);
        }
        return registrado;
    }
}
