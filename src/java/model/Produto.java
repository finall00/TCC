
package model;

public class Produto {

    private int codigoProduto;
    private String nomeProduto;
    private String dataValidade;
    private int estoqueProduto;
    private double vlrCusto;
    private double vlrVenda;
    private String codigoBarra;
    private String descricaoProduto;
    private String imagem;
   

    public Produto(int codigoProduto, String nomeProduto, String dataValidade, int estoqueProduto, double vlrCusto, double vlrVenda, String codigoBarra, String descricaoProduto) {
        this.codigoProduto = codigoProduto;
        this.nomeProduto = nomeProduto;
        this.dataValidade = dataValidade;
        this.estoqueProduto = estoqueProduto;
        this.vlrCusto = vlrCusto;
        this.vlrVenda = vlrVenda;
        this.codigoBarra = codigoBarra;
        this.descricaoProduto = descricaoProduto;
       
    }

    public Produto(int codigoProduto, String nomeProduto, String dataValidade, int estoqueProduto, double vlrCusto, double vlrVenda, String codigoBarra, String descricaoProduto, String imagem) {
        this.codigoProduto = codigoProduto;
        this.nomeProduto = nomeProduto;
        this.dataValidade = dataValidade;
        this.estoqueProduto = estoqueProduto;
        this.vlrCusto = vlrCusto;
        this.vlrVenda = vlrVenda;
        this.codigoBarra = codigoBarra;
        this.descricaoProduto = descricaoProduto;
        this.imagem = imagem;
    }
    
    

    public Produto() {
    }

    public Produto(int estoqueProduto) {
        this.estoqueProduto = estoqueProduto;
    }

    public int getCodigoProduto() {
        return codigoProduto;
    }

    public void setCodigoProduto(int codigoProduto) {
        this.codigoProduto = codigoProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getDataValidade() {
        return dataValidade;
    }

    public void setDataValidade(String dataValidade) {
        this.dataValidade = dataValidade;
    }

    public int getEstoqueProduto() {
        return estoqueProduto;
    }

    public void setEstoqueProduto(int estoqueProduto) {
        this.estoqueProduto = estoqueProduto;
    }

    public double getVlrCusto() {
        return vlrCusto;
    }

    public void setVlrCusto(double vlrCusto) {
        this.vlrCusto = vlrCusto;
    }

    public double getVlrVenda() {
        return vlrVenda;
    }

    public void setVlrVenda(double vlrVenda) {
        this.vlrVenda = vlrVenda;
    }

    public String getCodigoBarra() {
        return codigoBarra;
    }

    public void setCodigoBarra(String codigoBarra) {
        this.codigoBarra = codigoBarra;
    }

    public String getDescricaoProduto() {
        return descricaoProduto;
    }

    public void setDescricaoProduto(String descricaoProduto) {
        this.descricaoProduto = descricaoProduto;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

 
}
