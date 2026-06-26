package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PasajeDAO {

    Conexion cn = new Conexion();

    public List<Integer> obtenerAsientosOcupados(int idViaje) {
        List<Integer> ocupados = new ArrayList<>();
        String sql = "SELECT asiento FROM pasajes WHERE id_viaje = ? AND estado IN ('reservado','pagado')";
        try (Connection con = cn.Con; PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idViaje);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ocupados.add(rs.getInt("asiento"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ocupados;
    }

    public boolean reservarAsiento(int idPasajero, int idViaje, int asiento) {
        String sql = "INSERT INTO pasajes (id_pasajero, id_viaje, asiento, estado) VALUES (?, ?, ?, 'reservado')";
        try (Connection con = cn.Con; PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPasajero);
            ps.setInt(2, idViaje);
            ps.setInt(3, asiento);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Pasaje> listarReservasPorPasajero(int idPasajero) {
        List<Pasaje> lista = new ArrayList<>();
        String sql = """
        SELECT p.id_pasaje, p.asiento, p.estado,
               v.fecha_salida, v.hora_salida, v.precio,
               d1.ciudad AS origen, d2.ciudad AS destino
        FROM pasajes p
        JOIN viajes v ON p.id_viaje = v.id_viaje
        JOIN destinos d1 ON v.origen = d1.id_destino
        JOIN destinos d2 ON v.destino = d2.id_destino
        WHERE p.id_pasajero = ?
        ORDER BY v.fecha_salida DESC;
    """;

        try (Connection con = cn.Con; PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPasajero);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pasaje p = new Pasaje();
                p.setIdPasaje(rs.getInt("id_pasaje"));
                p.setAsiento(rs.getInt("asiento"));
                p.setEstado(rs.getString("estado"));
                p.setFechaSalida(rs.getDate("fecha_salida"));
                p.setHoraSalida(rs.getTime("hora_salida"));
                p.setPrecio(rs.getDouble("precio"));
                p.setOrigen(rs.getString("origen"));
                p.setDestino(rs.getString("destino"));
                lista.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void actualizarEstado(int idPasaje, String estado) {
        String sql = "UPDATE pasajes SET estado = ? WHERE id_pasaje = ?";
        try (Connection con = cn.Con; PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, estado);
            ps.setInt(2, idPasaje);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarPasaje(int idPasaje) {
        String sql = "DELETE FROM pasajes WHERE id_pasaje = ?";
        try (Connection con = cn.Con; PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPasaje);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
