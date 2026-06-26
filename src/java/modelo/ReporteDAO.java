package modelo;


import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

public class ReporteDAO {
    
    Connection con = null;


    // Usa el método de tu clase Conexion; ajusta si tu método se llama distinto.
    private Connection obtenerConexion() throws Exception {
        Conexion cn = new Conexion();
        return cn.Con; // <-- ajusta si tu clase usa otro nombre
    }

    //METODO PARA VENTAS POR EMPRESA
    public Map<String, Map<Integer, Double>> ventasPorEmpresaMes() {
        Map<String, Map<Integer, Double>> reporte = new LinkedHashMap<>();
        String sql = "SELECT e.nombre AS empresa, MONTH(v.fecha_salida) AS mes, SUM(v.precio) AS total_mes "
                + "FROM viajes v "
                + "INNER JOIN buses b ON v.id_bus = b.id_bus "
                + "INNER JOIN empresas e ON b.id_empresa = e.id_empresa "
                + "GROUP BY e.nombre, MONTH(v.fecha_salida) "
                + "ORDER BY e.nombre, mes";

        try (Connection con = obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String empresa = rs.getString("empresa");
                int mes = rs.getInt("mes");
                double totalMes = rs.getDouble("total_mes");

                reporte.putIfAbsent(empresa, new LinkedHashMap<>());
                reporte.get(empresa).put(mes, totalMes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reporte;
    }

}
