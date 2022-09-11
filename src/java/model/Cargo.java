package model;

public class Cargo {

    private int codigoCargo;
    private String nomeCargo;
    private String descCargo;

    public Cargo(int codigoCargo, String nomeCargo, String descCargo) {
        this.codigoCargo = codigoCargo;
        this.nomeCargo = nomeCargo;
        this.descCargo = descCargo;
    }

   

    public Cargo() {

    }

    public Cargo(int codigoCargo) {
        this.codigoCargo = codigoCargo;
    }

    public int getCodigoCargo() {
        return codigoCargo;
    }

    public void setCodigoCargo(int codigoCargo) {
        this.codigoCargo = codigoCargo;
    }

    public String getNomeCargo() {
        return nomeCargo;
    }

    public void setNomeCargo(String nomeCargo) {
        this.nomeCargo = nomeCargo;
    }

    public String getDescCargo() {
        return descCargo;
    }

    public void setDescCargo(String descCargo) {
        this.descCargo = descCargo;
    }
    

}
