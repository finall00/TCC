
package model;

import java.util.Date;


public class PedidoVenda {
    private int codigoPedido;
    private Pessoa pessoa;
    private Date dataVenda;
    private String obsVenda;
    private double vlrTotalVenda;

    public PedidoVenda() {
    }

    public PedidoVenda(int codigoPedido, Pessoa pessoa, Date dataVenda, String obsVenda, double vlrTotalVenda) {
        this.codigoPedido = codigoPedido;
        this.pessoa = pessoa;
        this.dataVenda = dataVenda;
        this.obsVenda = obsVenda;
        this.vlrTotalVenda = vlrTotalVenda;
    }

    

    public int getCodigoPedido() {
        return codigoPedido;
    }

    public void setCodigoPedido(int codigoPedido) {
        this.codigoPedido = codigoPedido;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public Date getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
        this.dataVenda = dataVenda;
    }

    public String getObsVenda() {
        return obsVenda;
    }

    public void setObsVenda(String obsVenda) {
        this.obsVenda = obsVenda;
    }

    public double getVlrTotalVenda() {
        return vlrTotalVenda;
    }

    public void setVlrVenda(double vlrTotalVenda) {
        this.vlrTotalVenda = vlrTotalVenda;
    }
      
}
