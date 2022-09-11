package model;

public class RecheioBolo {

private int codigoRecheio;
private String recheioB;

    public RecheioBolo(int codigoRecheio, String recheioB) {
        this.codigoRecheio = codigoRecheio;
        this.recheioB = recheioB;
    }

    
    public RecheioBolo(){
    }

    public RecheioBolo(int codigoRecheio) {
        this.codigoRecheio = codigoRecheio;
     }
    
    public int getCodigoRecheio() {
        return codigoRecheio;
    }

    public void setCodigoRecheio(int codigoRecheio) {
        this.codigoRecheio = codigoRecheio;
    }

    public String getRecheioB() {
        return recheioB;
    }

    public void setRecheioB(String recheioB) {
        this.recheioB = recheioB;
    }


}
