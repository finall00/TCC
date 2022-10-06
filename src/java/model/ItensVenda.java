
package model;


public class ItensVenda {
    
    private int codigoItenV;
    private Produto produto;
    private PedidoVenda pedidoVenda;
    private Double qtnProduto;
    private Double vlrProduto;

    public ItensVenda() {
    }

    public ItensVenda(int codigoItenV, Produto produto, PedidoVenda pedidoVenda, Double qtnProduto, Double vlrProduto) {
        this.codigoItenV = codigoItenV;
        this.produto = produto;
        this.pedidoVenda = pedidoVenda;
        this.qtnProduto = qtnProduto;
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

    public Double getQtnProduto() {
        return qtnProduto;
    }

    public void setQtnProduto(Double qtnProduto) {
        this.qtnProduto = qtnProduto;
    }

    public Double getVlrProduto() {
        return vlrProduto;
    }

    public void setVlrProduto(Double vlrProduto) {
        this.vlrProduto = vlrProduto;
    }
    
    public ItensVenda(Produto produto){
    this.produto = produto;
    qtnProduto = 1.00;
    }
    
    public void aumentarQuant(){
    qtnProduto++;
    }
    
    public void diminuirQuant(){
    qtnProduto--;
    }
    
    public double getTotal(){
    double vlrTotal = 0;
    vlrTotal = (this.getQtnProduto() * produto.getVlrVenda());
    return vlrTotal;
    } 
}
