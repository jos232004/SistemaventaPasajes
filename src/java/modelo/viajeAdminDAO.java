package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class viajeAdminDAO {

    private Connection obtenerConexion() throws Exception {
        Conexion cn = new Conexion();
        return cn.Con;
    }

    public List<viajeAdmin> listar() {
        List<viajeAdmin> lista = new ArrayList<>();
        String sql = "SELECT v.*, b.placa, e.nombre AS empresa, d1.ciudad AS origen_ciudad, d2.ciudad AS destino_ciudad "
                + "FROM viajes v "
                + "INNER JOIN buses b ON v.id_bus = b.id_bus "
                + "INNER JOIN empresas e ON b.id_empresa = e.id_empresa "
                + "INNER JOIN destinos d1 ON v.origen = d1.id_destino "
                + "INNER JOIN destinos d2 ON v.destino = d2.id_destino";

        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                viajeAdmin v = new viajeAdmin(
                        rs.getInt("id_viaje"),
                        rs.getInt("id_bus"),
                        rs.getInt("origen"),
                        rs.getInt("destino"),
                        rs.getDate("fecha_salida"),
                        rs.getTime("hora_salida"),
                        rs.getDouble("precio")
                );
                v.setPlacaBus(rs.getString("placa"));
                v.setEmpresaBus(rs.getString("empresa"));
                v.setCiudadOrigen(rs.getString("origen_ciudad"));
                v.setCiudadDestino(rs.getString("destino_ciudad"));
                lista.add(v);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean agregar(viajeAdmin v) {
        String sql = "INSERT INTO viajes (id_bus, origen, destino, fecha_salida, hora_salida, precio) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, v.getIdBus());
            ps.setInt(2, v.getOrigen());
            ps.setInt(3, v.getDestino());
            ps.setDate(4, v.getFechaSalida());
            ps.setTime(5, v.getHoraSalida());
            ps.setDouble(6, v.getPrecio());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean editar(viajeAdmin v) {
        String sql = "UPDATE viajes SET id_bus=?, origen=?, destino=?, fecha_salida=?, hora_salida=?, precio=? WHERE id_viaje=?";
        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, v.getIdBus());
            ps.setInt(2, v.getOrigen());
            ps.setInt(3, v.getDestino());
            ps.setDate(4, v.getFechaSalida());
            ps.setTime(5, v.getHoraSalida());
            ps.setDouble(6, v.getPrecio());
            ps.setInt(7, v.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM viajes WHERE id_viaje=?";
        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public viajeAdmin obtener(int id) {
        viajeAdmin v = null;
        String sql = "SELECT * FROM viajes WHERE id_viaje=?";
        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    v = new viajeAdmin(
                            rs.getInt("id_viaje"),
                            rs.getInt("id_bus"),
                            rs.getInt("origen"),
                            rs.getInt("destino"),
                            rs.getDate("fecha_salida"),
                            rs.getTime("hora_salida"),
                            rs.getDouble("precio")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return v;
    }

}
