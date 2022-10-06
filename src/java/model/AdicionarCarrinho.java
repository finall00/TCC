/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author smili08
 */
public class AdicionarCarrinho {

    List<ItensVenda> itens;
    int quantIntens;
    double vlrTotalCar;

    public AdicionarCarrinho() {
        itens = new ArrayList<ItensVenda>();
        quantIntens = 0;
        vlrTotalCar = 0;
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
                        scItem.setQtnProduto(quant);
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
    
    public synchronized int getNumeroDoItem(){
    quantIntens = 0;
    for (ItensVenda itemSelecionado : itens ){
        quantIntens += itemSelecionado.getQtnProduto();
    }
    return quantIntens;
    }
    
    public synchronized double  getSubTotal(){
        double total = 0;
        
        for (ItensVenda itemSelecinado : itens){
        Produto produto = (Produto) itemSelecinado.getProduto();
        total += (itemSelecinado.getQtnProduto() * produto.getVlrVenda());
        }
        
        return total;
    }
    
    public  synchronized void calcularTotal(String surchanger){
        double total = 0;
        
        double s = Double.parseDouble(surchanger);
        
        total = this.getSubTotal();
        total += s;
        
        vlrTotalCar = total;
    }
    
    public synchronized double  getTotal(){
        return vlrTotalCar;
    }
    
    public synchronized void clear(){
    itens.clear();
    quantIntens = 0;
    vlrTotalCar = 0;
    }
}
