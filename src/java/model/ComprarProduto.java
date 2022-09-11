package model;

/**
 *
 * @author Aluno(a)
 */
public class ComprarProduto {

    private int codigoConta;
    private String dataVencimento;
    private Double vlrPagar;
    private Produto produto;
    private Cliente cliente;

    public ComprarProduto(int codigoConta, String dataVencimento, Double vlrPagar, Produto produto, Cliente cliente) {
        this.codigoConta = codigoConta;
        this.dataVencimento = dataVencimento;
        this.vlrPagar = vlrPagar;
        this.produto = produto;
        this.cliente = cliente;
    }

    public int getCodigoConta() {
        return codigoConta;
    }

    public void setCodigoConta(int codigoConta) {
        this.codigoConta = codigoConta;
    }

    public String getDataVencimento() {
        return dataVencimento;
    }

    public void setDataVencimento(String dataVencimento) {
        this.dataVencimento = dataVencimento;
    }

    public Double getVlrPagar() {
        return vlrPagar;
    }

    public void setVlrPagar(Double vlrPagar) {
        this.vlrPagar = vlrPagar;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

  

}
