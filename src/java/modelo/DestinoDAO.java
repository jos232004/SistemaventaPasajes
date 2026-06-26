package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DestinoDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Usa el método de tu clase Conexion; ajusta si tu método se llama distinto.
    private Connection obtenerConexion() throws Exception {
        Conexion cn = new Conexion();
        return cn.Con; // <-- ajusta si tu clase usa otro nombre
    }

    //NO TOCAR PORQUE ME LISTA LAS CIUDADES EN MI PAGINA DE INICIO
    public List<String> listarCiudades() {
        List<String> lista = new ArrayList<>();
        String sql = "SELECT ciudad FROM destinos ORDER BY ciudad ASC";

        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(rs.getString("ciudad"));
            }
        } catch (Exception e) {
            System.out.println("Error en listarCiudades(): " + e.getMessage());
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
    } //FIN DE LISTAR CIUDADES

    //AQUI EMPEIZAN LOS METODOS DEL CRUD PARA EL ADMINISTRADOR
    public List<Destino> listar() {
        List<Destino> lista = new ArrayList<>();
        String sql = "SELECT * FROM destinos";

        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Destino d = new Destino();
                d.setId(rs.getInt("id_destino"));
                d.setCiudad(rs.getString("ciudad"));
                d.setTerminal(rs.getString("terminal"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error listar destinos: " + e.getMessage());
        }

        return lista;
    }

    public boolean agregar(Destino d) {
        String sql = "INSERT INTO destinos (ciudad, terminal) VALUES (?, ?)";

        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, d.getCiudad());
            ps.setString(2, d.getTerminal());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Error agregar destino: " + e.getMessage());
        }

        return false;
    }

    public boolean editar(Destino d) {
        String sql = "UPDATE destinos SET ciudad=?, terminal=? WHERE id_destino=?";

        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, d.getCiudad());
            ps.setString(2, d.getTerminal());
            ps.setInt(3, d.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Error editar destino: " + e.getMessage());
        }

        return false;
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM destinos WHERE id_destino=?";

        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Error eliminar destino: " + e.getMessage());
        }

        return false;
    }

}
