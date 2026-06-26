/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    
    public Connection Con;
    
     public Conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_andebus", "root", "Junior_10");
            System.out.println("Conexión exitosa a la base de datos");
        } catch (Exception e) {
            System.err.println("Error de conexión: " + e);
        }
    }
}
