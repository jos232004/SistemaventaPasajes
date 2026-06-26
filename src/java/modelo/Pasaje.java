package modelo;

import java.sql.Date;
import java.sql.Time;

public class Pasaje {

    private int idPasaje;
    private int idPasajero;
    private int idViaje;
    private int asiento;
    private String estado;

    // Datos del viaje
    private Date fechaSalida;
    private Time horaSalida;
    private double precio;
    private String origen;
    private String destino;

    // =====================
    // Constructores
    // =====================
    public Pasaje() {
    }

    public Pasaje(int idPasaje, int idPasajero, int idViaje, int asiento, String estado) {
        this.idPasaje = idPasaje;
        this.idPasajero = idPasajero;
        this.idViaje = idViaje;
        this.asiento = asiento;
        this.estado = estado;
    }

    // =====================
    // Getters y Setters
    // =====================
    public int getIdPasaje() {
        return idPasaje;
    }

    public void setIdPasaje(int idPasaje) {
        this.idPasaje = idPasaje;
    }

    public int getIdPasajero() {
        return idPasajero;
    }

    public void setIdPasajero(int idPasajero) {
        this.idPasajero = idPasajero;
    }

    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
    }

    public int getAsiento() {
        return asiento;
    }

    public void setAsiento(int asiento) {
        this.asiento = asiento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public Time getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(Time horaSalida) {
        this.horaSalida = horaSalida;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
}
