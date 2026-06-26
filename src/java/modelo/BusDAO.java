package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BusDAO {

    private Connection obtenerConexion() throws Exception {
        Conexion cn = new Conexion();
        return cn.Con;
    }

    public List<Bus> listar() {
        List<Bus> lista = new ArrayList<>();
        String sql = "SELECT b.*, e.nombre AS empresa "
                + "FROM buses b INNER JOIN empresas e ON b.id_empresa = e.id_empresa";

        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Bus b = new Bus(
                        rs.getInt("id_bus"),
                        rs.getInt("id_empresa"),
                        rs.getString("placa"),
                        rs.getString("tipo"),
                        rs.getInt("capacidad"),
                        rs.getString("imagen"),
                        rs.getString("empresa")
                );
                lista.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean agregar(Bus b) {
        String sql = "INSERT INTO buses (id_empresa, placa, tipo, capacidad, imagen) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, b.getIdEmpresa());
            ps.setString(2, b.getPlaca());
            ps.setString(3, b.getTipo());
            ps.setInt(4, b.getCapacidad());
            ps.setString(5, b.getImagen());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean editar(Bus b) {
        String sql = "UPDATE buses SET id_empresa=?, placa=?, tipo=?, capacidad=?, imagen=? WHERE id_bus=?";
        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, b.getIdEmpresa());
            ps.setString(2, b.getPlaca());
            ps.setString(3, b.getTipo());
            ps.setInt(4, b.getCapacidad());
            ps.setString(5, b.getImagen());
            ps.setInt(6, b.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM buses WHERE id_bus=?";
        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Bus obtener(int id) {
        Bus b = null;
        String sql = "SELECT b.*, e.nombre AS empresa "
                + "FROM buses b INNER JOIN empresas e ON b.id_empresa = e.id_empresa WHERE b.id_bus=?";
        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    b = new Bus(
                            rs.getInt("id_bus"),
                            rs.getInt("id_empresa"),
                            rs.getString("placa"),
                            rs.getString("tipo"),
                            rs.getInt("capacidad"),
                            rs.getString("imagen"),
                            rs.getString("empresa")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
}
