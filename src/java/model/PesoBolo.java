package model;

public class PesoBolo {

private int codigoPeso;
private String pesoB;

    public PesoBolo(int codigoPeso, String pesoB) {
        this.codigoPeso = codigoPeso;
        this.pesoB = pesoB;
    }

    public PesoBolo() {
    }

    public PesoBolo(int codigoPeso) {
  this.codigoPeso = codigoPeso;
    }

    public int getCodigoPeso() {
        return codigoPeso;
    }

    public void setCodigoPeso(int codigoPeso) {
        this.codigoPeso = codigoPeso;
    }

    public String getPesoB() {
        return pesoB;
    }

    public void setPesoB(String pesoB) {
        this.pesoB = pesoB;
    }


}
