package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ViajeDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();

    public List<Viaje> buscarViajes(String origen, String destino, String fechaSalida) {
        List<Viaje> lista = new ArrayList<>();
        String sql = """
        SELECT v.id_viaje, d1.ciudad AS origen, d2.ciudad AS destino,
               v.fecha_salida, v.hora_salida, v.precio,
               e.nombre AS empresa, b.tipo AS tipo_bus, b.imagen
        FROM viajes v
        JOIN destinos d1 ON v.origen = d1.id_destino
        JOIN destinos d2 ON v.destino = d2.id_destino
        JOIN buses b ON v.id_bus = b.id_bus
        JOIN empresas e ON b.id_empresa = e.id_empresa
        WHERE d1.ciudad = ? AND d2.ciudad = ? AND v.fecha_salida = ?;
    """;

        try {
            con = cn.Con;
            ps = con.prepareStatement(sql);
            ps.setString(1, origen);
            ps.setString(2, destino);
            ps.setString(3, fechaSalida);
            rs = ps.executeQuery();

            while (rs.next()) {
                Viaje v = new Viaje();
                v.setIdViaje(rs.getInt("id_viaje"));
                v.setOrigen(rs.getString("origen"));
                v.setDestino(rs.getString("destino"));
                v.setFechaSalida(rs.getString("fecha_salida"));
                v.setHoraSalida(rs.getString("hora_salida"));
                v.setPrecio(rs.getDouble("precio"));
                v.setEmpresa(rs.getString("empresa"));
                v.setTipoBus(rs.getString("tipo_bus"));
                v.setImagenBus(rs.getString("imagen"));
                lista.add(v);
            }
        } catch (SQLException e) {
            System.out.println("Error en buscarViajes(): " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    public Viaje obtenerViajePorId(int idViaje) {
        Viaje v = null;
        String sql = """
        SELECT v.*, b.capacidad, b.imagen, d1.ciudad AS origen, d2.ciudad AS destino
        FROM viajes v
        JOIN buses b ON v.id_bus = b.id_bus
        JOIN destinos d1 ON v.origen = d1.id_destino
        JOIN destinos d2 ON v.destino = d2.id_destino
        WHERE v.id_viaje = ?;
    """;
        try (Connection co = cn.Con; PreparedStatement pst = co.prepareStatement(sql)) { //OJO: SI DA UN ERROR CAMBIAR LAS VARIABLES POR LAS QUE ESTAN ARRIBA.
            pst.setInt(1, idViaje);
            ResultSet rst = pst.executeQuery();
            if (rst.next()) {
                v = new Viaje();
                v.setIdViaje(rst.getInt("id_viaje"));
                v.setOrigen(rst.getString("origen"));
                v.setDestino(rst.getString("destino"));
                v.setFechaSalida(rst.getString("fecha_salida"));
                v.setHoraSalida(rst.getString("hora_salida"));
                v.setPrecio(rst.getDouble("precio"));
                v.setCapacidadBus(rst.getInt("capacidad"));
                v.setImagenBus(rst.getString("imagen"));
            }
        } catch (Exception e) {
            System.out.println("Entro aqui");
            e.printStackTrace();
        }
        return v;
    }

    //CRUD PARA VIAJES
    public List<Viaje> listar() {
        List<Viaje> lista = new ArrayList<>();

        String sql = """
        SELECT v.id_viaje, d1.ciudad AS origen, d2.ciudad AS destino,
               v.fecha_salida, v.hora_salida, v.precio,
               e.nombre AS empresa, b.tipo AS tipo_bus, b.imagen, b.capacidad
        FROM viajes v
        JOIN destinos d1 ON v.origen = d1.id_destino
        JOIN destinos d2 ON v.destino = d2.id_destino
        JOIN buses b ON v.id_bus = b.id_bus
        JOIN empresas e ON b.id_empresa = e.id_empresa
        ORDER BY v.id_viaje DESC;
    """;

        try (Connection c = cn.Con; PreparedStatement pst = c.prepareStatement(sql)) {

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Viaje v = new Viaje();
                v.setIdViaje(rs.getInt("id_viaje"));
                v.setOrigen(rs.getString("origen"));
                v.setDestino(rs.getString("destino"));
                v.setFechaSalida(rs.getString("fecha_salida"));
                v.setHoraSalida(rs.getString("hora_salida"));
                v.setPrecio(rs.getDouble("precio"));
                v.setEmpresa(rs.getString("empresa"));
                v.setTipoBus(rs.getString("tipo_bus"));
                v.setImagenBus(rs.getString("imagen"));
                v.setCapacidadBus(rs.getInt("capacidad"));

                lista.add(v);
            }
        } catch (SQLException e) {
            System.out.println("Error en listar(): " + e.getMessage());
        }

        return lista;
    }

    public boolean insertar(Viaje v) {
        String sql = "INSERT INTO viajes (id_bus, origen, destino, fecha_salida, hora_salida, precio) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection c = cn.Con; PreparedStatement pst = c.prepareStatement(sql)) {

            pst.setInt(1, v.getIdBus());
            pst.setInt(2, v.getOrigenId());
            pst.setInt(3, v.getDestinoId());
            pst.setString(4, v.getFechaSalida());
            pst.setString(5, v.getHoraSalida());
            pst.setDouble(6, v.getPrecio());

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error insertar(): " + e.getMessage());
            return false;
        }
    }

    public boolean actualizar(Viaje v) {
        String sql = """
        UPDATE viajes SET id_bus=?, origen=?, destino=?, fecha_salida=?, hora_salida=?, precio=?
        WHERE id_viaje=?
    """;

        try (Connection c = cn.Con; PreparedStatement pst = c.prepareStatement(sql)) {

            pst.setInt(1, v.getIdBus());
            pst.setInt(2, v.getOrigenId());
            pst.setInt(3, v.getDestinoId());
            pst.setString(4, v.getFechaSalida());
            pst.setString(5, v.getHoraSalida());
            pst.setDouble(6, v.getPrecio());
            pst.setInt(7, v.getIdViaje());

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error actualizar(): " + e.getMessage());
            return false;
        }
    }

    public boolean eliminar(int idViaje) {
        String sql = "DELETE FROM viajes WHERE id_viaje = ?";

        try (Connection c = cn.Con; PreparedStatement pst = c.prepareStatement(sql)) {

            pst.setInt(1, idViaje);
            return pst.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error eliminar(): " + e.getMessage());
            return false;
        }
    }

}
