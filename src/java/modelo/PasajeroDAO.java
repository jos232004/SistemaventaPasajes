package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PasajeroDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Pasajero validar(String correo, String password) {
        Pasajero p = null;
        String sql = "SELECT * FROM pasajeros WHERE correo = ? AND password = ?";
        try {
            con = cn.Con;
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                p = new Pasajero();
                p.setId_pasajero(rs.getInt("id_pasajero"));
                p.setDni(rs.getString("dni"));
                p.setNombre(rs.getString("nombre"));
                p.setApellido(rs.getString("apellido"));
                p.setCorreo(rs.getString("correo"));
                p.setPassword(rs.getString("password"));
            }
            con.close();
        } catch (Exception e) {
            System.out.println("Error al validar pasajero: " + e.getMessage());
        }
        return p;
    }

    public boolean registrar(Pasajero p) {
        String sql = "INSERT INTO pasajeros (dni, nombre, apellido, correo, password, sexo, fecha_nacimiento) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            con = cn.Con;
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getDni());
            ps.setString(2, p.getNombre());
            ps.setString(3, p.getApellido());
            ps.setString(4, p.getCorreo());
            ps.setString(5, p.getPassword());
            ps.setString(6, p.getSexo());
            ps.setString(7, p.getFecha_nacimiento());
            ps.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("Error al registrar pasajero: " + e.getMessage());
            return false;
        }
    }
}
