package modelo;

import java.sql.Date;
import java.sql.Time;

public class viajeAdmin {

    private int id;
    private int idBus;
    private int origen;   // id_destino origen
    private int destino;  // id_destino destino
    private Date fechaSalida;
    private Time horaSalida;
    private double precio;

    // Campos adicionales para mostrar nombres
    private String placaBus;
    private String empresaBus;
    private String ciudadOrigen;
    private String ciudadDestino;

    public viajeAdmin() {
    }

    public viajeAdmin(int id, int idBus, int origen, int destino, Date fechaSalida, Time horaSalida, double precio) {
        this.id = id;
        this.idBus = idBus;
        this.origen = origen;
        this.destino = destino;
        this.fechaSalida = fechaSalida;
        this.horaSalida = horaSalida;
        this.precio = precio;

    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdBus() {
        return idBus;
    }

    public void setIdBus(int idBus) {
        this.idBus = idBus;
    }

    public int getOrigen() {
        return origen;
    }

    public void setOrigen(int origen) {
        this.origen = origen;
    }

    public int getDestino() {
        return destino;
    }

    public void setDestino(int destino) {
        this.destino = destino;
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

    public String getPlacaBus() {
        return placaBus;
    }

    public void setPlacaBus(String placaBus) {
        this.placaBus = placaBus;
    }

    public String getEmpresaBus() {
        return empresaBus;
    }

    public void setEmpresaBus(String empresaBus) {
        this.empresaBus = empresaBus;
    }

    public String getCiudadOrigen() {
        return ciudadOrigen;
    }

    public void setCiudadOrigen(String ciudadOrigen) {
        this.ciudadOrigen = ciudadOrigen;
    }

    public String getCiudadDestino() {
        return ciudadDestino;
    }

    public void setCiudadDestino(String ciudadDestino) {
        this.ciudadDestino = ciudadDestino;
    }

}
