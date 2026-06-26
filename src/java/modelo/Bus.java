package modelo;

public class Bus {

    private int id;
    private int idEmpresa;
    private String placa;
    private String tipo;
    private int capacidad;
    private String imagen;

    // Campo adicional para mostrar nombre de empresa
    private String empresa;

    public Bus() {
    }

    // Constructor sin empresa
    public Bus(int id, int idEmpresa, String placa, String tipo, int capacidad, String imagen) {
        this.id = id;
        this.idEmpresa = idEmpresa;
        this.placa = placa;
        this.tipo = tipo;
        this.capacidad = capacidad;
        this.imagen = imagen;
    }

    // Constructor con empresa
    public Bus(int id, int idEmpresa, String placa, String tipo, int capacidad, String imagen, String empresa) {
        this(id, idEmpresa, placa, tipo, capacidad, imagen);
        this.empresa = empresa;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }
}
