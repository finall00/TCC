
package model;

import java.util.Date;


public class PedidoVenda {
    private int codigoPedido;
    private Pessoa pessoa;
    private Date dataVenda;
    private String obsVenda;

    public PedidoVenda() {
    }

    public PedidoVenda(int codigoPedido, Pessoa pessoa, Date dataVenda, String obsVenda) {
        this.codigoPedido = codigoPedido;
        this.pessoa = pessoa;
        this.dataVenda = dataVenda;
        this.obsVenda = obsVenda;
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
    
    
}
