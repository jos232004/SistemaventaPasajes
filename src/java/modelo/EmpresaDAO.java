package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpresaDAO {

    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Usa el método de tu clase Conexion; ajusta si tu método se llama distinto.
    private Connection obtenerConexion() throws Exception {
        Conexion cn = new Conexion();
        return cn.Con; // <-- ajusta si tu clase usa otro nombre
    }

    public List<Empresa> listar() {
        List<Empresa> lista = new ArrayList<>();
        String sql = "SELECT * FROM empresas ORDER BY id_empresa";
        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empresa e = new Empresa();
                e.setId_empresa(rs.getInt("id_empresa"));
                e.setNombre(rs.getString("nombre"));
                e.setRuc(rs.getString("ruc"));
                e.setTelefono(rs.getString("telefono"));
                e.setCorreo(rs.getString("correo"));
                e.setDireccion(rs.getString("direccion"));
                lista.add(e);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ignored) {
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ignored) {
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception ignored) {
            }
        }
        return lista;
    }

    public int agregar(Empresa e) {
        String sql = "INSERT INTO empresas (nombre, ruc, telefono, correo, direccion) VALUES (?, ?, ?, ?, ?)";
        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getRuc());
            ps.setString(3, e.getTelefono());
            ps.setString(4, e.getCorreo());
            ps.setString(5, e.getDireccion());
            return ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ignored) {
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception ignored) {
            }
        }
        return 0;
    }

    public int actualizar(Empresa e) {
        String sql = "UPDATE empresas SET nombre=?, ruc=?, telefono=?, correo=?, direccion=? WHERE id_empresa=?";
        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getRuc());
            ps.setString(3, e.getTelefono());
            ps.setString(4, e.getCorreo());
            ps.setString(5, e.getDireccion());
            ps.setInt(6, e.getId_empresa());
            System.out.println("Se actualizo");
            return ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error al editar");
            ex.printStackTrace();
        } finally {//Puedes eliminar los finally, pero mejores investiga mas :D
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ignored) {
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception ignored) {
            }
        }
        return 0;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM empresas WHERE id_empresa = ?";
        try {
            con = obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ignored) {
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception ignored) {
            }
        }
    }
}
