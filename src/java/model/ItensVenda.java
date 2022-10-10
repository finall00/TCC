
package model;


public class ItensVenda {
    
    private int codigoItenV;
    private Produto produto;
    private PedidoVenda pedidoVenda;
    private Double qtdProduto;
    private Double vlrProduto;

    public ItensVenda() {
    }

    public ItensVenda(int codigoItenV, Produto produto, PedidoVenda pedidoVenda, Double qtdProduto, Double vlrProduto) {
        this.codigoItenV = codigoItenV;
        this.produto = produto;
        this.pedidoVenda = pedidoVenda;
        this.qtdProduto = qtdProduto;
        this.vlrProduto = vlrProduto;
    }

    public int getCodigoItenV() {
        return codigoItenV;
    }

    public void setCodigoItenV(int codigoItenV) {
        this.codigoItenV = codigoItenV;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public PedidoVenda getPedidoVenda() {
        return pedidoVenda;
    }

    public void setPedidoVenda(PedidoVenda pedidoVenda) {
        this.pedidoVenda = pedidoVenda;
    }

    public Double getQtdProduto() {
        return qtdProduto;
    }

    public void setQtdProduto(Double qtdProduto) {
        this.qtdProduto = qtdProduto;
    }

    public Double getVlrProduto() {
        return vlrProduto;
    }

    public void setVlrProduto(Double vlrProduto) {
        this.vlrProduto = vlrProduto;
    }
    
    public ItensVenda(Produto produto){
    this.produto = produto;
    qtdProduto = 1.00;
    }
    
    public void aumentarQuant(){
    qtdProduto++;
    }
    
    public void diminuirQuant(){
    qtdProduto--;
    }
    
    public double getTotal(){
    double vlrTotal = 0;
    vlrTotal = (this.getQtdProduto() * produto.getVlrVenda());
    return vlrTotal;
    } 
}
