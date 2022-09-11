package model;

public class CoberturaBolo {

private int codigoCobertura;
private String coberturaB;

    public CoberturaBolo(int codigoCobertura, String coberturaB) {
        this.codigoCobertura = codigoCobertura;
        this.coberturaB = coberturaB;
    }

    public CoberturaBolo() {
    
    }

    public CoberturaBolo(int codigoCobertura) {
   this.codigoCobertura = codigoCobertura;
    }

    public int getCodigoCobertura() {
        return codigoCobertura;
    }

    public void setCodigoCobertura(int codigoCobertura) {
        this.codigoCobertura = codigoCobertura;
    }

    public String getCoberturaB() {
        return coberturaB;
    }

    public void setCoberturaB(String coberturaB) {
        this.coberturaB = coberturaB;
    }



}
