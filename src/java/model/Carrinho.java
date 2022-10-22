
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author smili08
 */
public class Carrinho {

    List<ItensVenda> itens;
    int qtnItens;
    double vlrTotalCar;

    public Carrinho() {
        itens = new ArrayList<ItensVenda>();
        qtnItens = 0;
        vlrTotalCar = 0;
    }

    public Carrinho(List<ItensVenda> itens) {
        this.itens = itens;
       
    }

    public int getQtnItens() {
        return qtnItens;
    }

    public void setQtnItens(int qtnItens) {
        this.qtnItens = qtnItens;
    }

     
    
   
  
    public synchronized void addItem(Produto produto) {
        boolean novoItem = true;

        for (ItensVenda itemSelecionado : itens) {
            if (itemSelecionado.getProduto().getCodigoProduto() == produto.getCodigoProduto()) {
                novoItem = false;
                itemSelecionado.aumentarQuant();
                
            }
        }

        if (novoItem) {
            ItensVenda item = new ItensVenda(produto);
            itens.add(item);
        }
    }

    public synchronized void update(Produto produto, String quantidade) {
        Double quant = -1.00;

        quant = Double.parseDouble(quantidade);

        if (quant >= 0) {
            ItensVenda item = null;

            for (ItensVenda scItem : itens) {
                if (scItem.getProduto().getCodigoProduto() == produto.getCodigoProduto()) {
                    if (quant != 0) {
                        scItem.setQtdProduto(quant);
                    } else {
                        item = scItem;
                        break;
                    }
                }
            }
        }
    }

    public synchronized List<ItensVenda> getItens() {
        return itens;
    }
    
    public synchronized int getNumeroDeItens(){
    qtnItens = 0;
    for (ItensVenda itemSelecionado : itens ){
        qtnItens += itemSelecionado.getQtdProduto();
    }
    return qtnItens;
    }
    
    public synchronized double  getSubTotal(){
        double total = 0;
        
        for (ItensVenda itemSelecinado : itens){
        Produto produto = (Produto) itemSelecinado.getProduto();
        total += (itemSelecinado.getQtdProduto() * produto.getVlrVenda());
        }
        
        
        return total;
    }
    
    public  synchronized void calcularTotal(){
        double total = 0;
           
        total = this.getSubTotal();
        
        vlrTotalCar = total;
    }
    
    
    public synchronized void clear(){
    itens.clear();
    qtnItens = 0;
    vlrTotalCar = 0;
    }
}
