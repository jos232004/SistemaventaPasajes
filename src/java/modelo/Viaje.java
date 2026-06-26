package modelo;

public class Viaje {

    private int idViaje;
    private String origen;
    private String destino;
    private String fechaSalida;
    private String horaSalida;
    private double precio;
    private String empresa;
    private String tipoBus;
    private String imagenBus;
    private int CapacidadBus;
    //Ultimos agregados
    private int idBus;
    private int origenId;
    private int destinoId;

    public Viaje() {
    }
    //Por mientras

    public Viaje(int idViaje, String origen, String destino, String fechaSalida, String horaSalida, double precio, String empresa, String tipoBus, String imagenBus, int CapacidadBus, int idBus, int origenId, int destinoId) {
        this.idViaje = idViaje;
        this.origen = origen;
        this.destino = destino;
        this.fechaSalida = fechaSalida;
        this.horaSalida = horaSalida;
        this.precio = precio;
        this.empresa = empresa;
        this.tipoBus = tipoBus;
        this.imagenBus = imagenBus;
        this.CapacidadBus = CapacidadBus;
        this.idBus = idBus;
        this.origenId = origenId;
        this.destinoId = destinoId;

    }

    // Getters y setters
    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
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

    public String getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(String fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getTipoBus() {
        return tipoBus;
    }

    public void setTipoBus(String tipoBus) {
        this.tipoBus = tipoBus;
    }

    public String getImagenBus() {
        return imagenBus;
    }

    public void setImagenBus(String imagenBus) {
        this.imagenBus = imagenBus;
    }

    public int getCapacidadBus() {
        return CapacidadBus;
    }

    public void setCapacidadBus(int CapacidadBus) {
        this.CapacidadBus = CapacidadBus;
    }

    //ESTO SON LAS ULTIMAS MODIFICACIONES
    public int getIdBus() {
        return idBus;
    }

    public void setIdBus(int idBus) {
        this.idBus = idBus;
    }

    public int getOrigenId() {
        return origenId;
    }

    public void setOrigenId(int origenId) {
        this.origenId = origenId;
    }

    public int getDestinoId() {
        return destinoId;
    }

    public void setDestinoId(int destinoId) {
        this.destinoId = destinoId;
    }

}
