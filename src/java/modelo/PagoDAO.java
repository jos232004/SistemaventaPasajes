package modelo;

import java.sql.*;
import modelo.Pago;

public class PagoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;

    public boolean registrarPago(Pago pago) {
        String sql1 = "INSERT INTO pagos (id_pasaje, metodo, monto) VALUES (?, ?, ?)";
        String sql2 = "UPDATE pasajes SET estado = 'pagado' WHERE id_pasaje = ?";
        try {
            
            
            
            con = cn.Con;
            con.setAutoCommit(false);

            // Registrar pago
            ps = con.prepareStatement(sql1);
            ps.setInt(1, pago.getIdPasaje());
            ps.setString(2, pago.getMetodo());
            ps.setDouble(3, pago.getMonto());
            ps.executeUpdate();

            // Actualizar estado del pasaje
            ps = con.prepareStatement(sql2);
            ps.setInt(1, pago.getIdPasaje());
            ps.executeUpdate();

            con.commit();
            return true;
        } catch (Exception e) {
            System.out.println("Error en registrarPago: " + e.getMessage());
            try {
                con.rollback();
            } catch (SQLException ignored) {
            }
            return false;
        }
    }
}
