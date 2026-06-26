package modelo;

public class Destino {

    private int id;
    private String ciudad;
    private String terminal;

    public Destino() {
    }

    public Destino(int id, String ciudad, String terminal) {
        this.id = id;
        this.ciudad = ciudad;
        this.terminal = terminal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getTerminal() {
        return terminal;
    }

    public void setTerminal(String terminal) {
        this.terminal = terminal;
    }
}
