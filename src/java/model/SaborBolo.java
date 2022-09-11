package model;

public class SaborBolo {

    private int codigoSabor;
    private String saborB;

    public SaborBolo(int codigoSabor, String saborB) {
        this.codigoSabor = codigoSabor;
        this.saborB = saborB;
    }

    public SaborBolo() {
    }

    public SaborBolo(int codigoSabor) {
        this.codigoSabor = codigoSabor;
    }

    public int getCodigoSabor() {
        return codigoSabor;
    }

    public void setCodigoSabor(int codigoSabor) {
        this.codigoSabor = codigoSabor;
    }

    public String getSaborB() {
        return saborB;
    }

    public void setSaborB(String saborB) {
        this.saborB = saborB;
    }

}
