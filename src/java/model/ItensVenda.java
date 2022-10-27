package model;

import dao.ProdutoDAO;
import java.sql.SQLException;

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

    public ItensVenda(Produto produto) {
        this.produto = produto;
        qtdProduto = 1.00;
    }

    public boolean aumentarQuant() {
        boolean a;
        int b = produto.getEstoqueProduto();
        if (produto.getEstoqueProduto() > qtdProduto) {
            qtdProduto++;
            a = true;
        } else {
            System.out.println("n deu socorro");
            a = false;
        }
        return a;
    }

    public void diminuirQuant() {
        qtdProduto--;
    }

    public double getTotal() {
        double vlrTotal = 0;
        vlrTotal = (this.getQtdProduto() * produto.getVlrVenda());
        return vlrTotal;
    }
}
