/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.venda;

import dao.ItensVendaDAO;
import dao.PedidoVendaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Carrinho;
import model.Funcionario;
import model.ItensVenda;
import model.PedidoVenda;
import model.Pessoa;
import model.Produto;

/**
 *
 * @author smili08
 */
@WebServlet(name = "FinalizarVendaTodos", urlPatterns = {"/FinalizarVendaTodos"})
public class FinalizarVendaTodos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PedidoVenda pedidoVenda = new PedidoVenda();
        Pessoa pessoa = new Pessoa();

        HttpSession sessao = request.getSession(true);
        Funcionario cliente = (Funcionario) sessao.getAttribute("funcionario");//trocar isso no futuro por codigo cliente ou codigo pessoa porem pode dar problema no login n sei n vo testar agora 

        Integer codigo = cliente.getCodigoPessoa();

        List<ItensVenda> Itens = (List<ItensVenda>) sessao.getAttribute("itensProduto");
        Carrinho car = new Carrinho(Itens);
        car.getCodigoItem();
        car.getQtnItens();

        //eu n to conseguindo pegar a porra dos dados vai se fudeeeeeeeeeeeeeeeeeeeeeeeeeee
        String[] produtos = request.getParameterValues("codigoProduto");

        String[] vlrVenda = request.getParameterValues("vlrVenda");

        String[] qtdProdutos = request.getParameterValues("qtdProduto");
        String obsVenda = "";
        String mensagem = null;

        //fazer um for para colocar os dados no array
        
//        for (int i = 0; i < Itens.size(); i++) {
//        }

        Date date = new Date();
        pessoa.setCodigoPessoa(codigo);

        //coloca os dados na model de pedido
        pedidoVenda.setPessoa(pessoa);
        pedidoVenda.setDataVenda(date);
        pedidoVenda.setObsVenda(obsVenda);
        pedidoVenda.setVlrTotalVenda(car.getSubTotal());

        if (produtos != null && qtdProdutos != null) {
            try {

                ItensVenda itensVenda = new ItensVenda();
                PedidoVendaDAO PedidoDao = new PedidoVendaDAO();

                //cadastra o pedido e retorna o codigo da venda
                Integer codigoVenda = PedidoDao.cadastrar(pedidoVenda);
                pedidoVenda.setCodigoPedido(codigoVenda);

                if (codigoVenda > 0) {
                    for (int i = 0; i < produtos.length; i++) {

                        Produto produto = new Produto();
                        produto.setCodigoProduto(Integer.parseInt(produtos[i]));

                        itensVenda.setPedidoVenda(pedidoVenda);
                        itensVenda.setProduto(produto);
                        itensVenda.setQtdProduto(Double.parseDouble(qtdProdutos[i]));
                        itensVenda.setVlrProduto(Double.parseDouble(vlrVenda[i]));

                        car.getItens().remove(i);
                    }

                    ItensVendaDAO ItensVendaDAO = new ItensVendaDAO();
                    if (ItensVendaDAO.cadastrar(itensVenda)) {

                        mensagem = "Compra realizado com sucesso!";

                    } else {
                        mensagem = "Problemas ao realizar compra!";
                    }
                } else {
                    mensagem = "Problemas ao realizar cadastro!";
                }

                request.setAttribute("mensagem", mensagem);

            } catch (Exception ex) {
                System.out.println("Erro ao adicionar Itens no Carrinho!");
                ex.printStackTrace();
            }
        }
        request.getRequestDispatcher("ListarCompra").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}