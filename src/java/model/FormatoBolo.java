
package model;

public class FormatoBolo {

private int codigoFormato;
private String formatoB;

    public FormatoBolo(int codigoFormato, String formatoB) {
        this.codigoFormato = codigoFormato;
        this.formatoB = formatoB;
    }

    public FormatoBolo() {
   }

    public FormatoBolo(int codigoFormato) {
        this.codigoFormato = codigoFormato;
    }

    public int getCodigoFormato() {
        return codigoFormato;
    }

    public void setCodigoFormato(int codigoFormato) {
        this.codigoFormato = codigoFormato;
    }

    public String getFormatoB() {
        return formatoB;
    }

    public void setFormatoB(String formatoB) {
        this.formatoB = formatoB;
    }

}
