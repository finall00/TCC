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
import model.ItensVenda;
import model.PedidoVenda;
import model.Pessoa;
import model.Produto;

/**
 *
 * @author smili08
 */
@WebServlet(name = "FinalizarVenda", urlPatterns = {"/FinalizarVenda"})
public class FinalizarVenda extends HttpServlet {

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

        HttpSession sessao = request.getSession(true);
        Integer codigo = (Integer) sessao.getAttribute("codigoPessoa");

        String[] produtos = request.getParameterValues("codigoProduto");
        String[] vlrVenda = request.getParameterValues("vlrVenda");
        String[] qtdProdutos = request.getParameterValues("qtdProduto");

        String mensagem = null;

        Pessoa pessoa = new Pessoa();

        pessoa.setCodigoPessoa(codigo);
        pedidoVenda.setPessoa(pessoa);

        Date date = new Date();
        pedidoVenda.setDataVenda(date);

        Double vlrTotalVenda;
        String tipoPagamento;
        String obsVenda;

        if (produtos != null && qtdProdutos != null) {
            try {

                ItensVenda itensVenda = new ItensVenda();
                PedidoVendaDAO dao = new PedidoVendaDAO();
                Integer codigoVenda = dao.cadastrar(pedidoVenda);
                pedidoVenda.setCodigoPedido(codigoVenda);

                if (codigoVenda > 0) {
                    for (int i = 0; i < produtos.length; i++) {

                        itensVenda.setPedidoVenda(pedidoVenda);
                        Produto produto = new Produto();
                        produto.setCodigoProduto(Integer.parseInt(produtos[i]));
                        itensVenda.setProduto(produto);
                        itensVenda.setQtdProduto(Double.parseDouble(qtdProdutos[i]));
                        itensVenda.setVlrProduto(Double.parseDouble(vlrVenda[i]));

                    }
                    ItensVendaDAO daoItensVenda = new ItensVendaDAO();
                    daoItensVenda.cadastrar(itensVenda);
                }

                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("ListarItensCarrinho").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Erro ao adicionar Itens no Carrinho!");
                ex.printStackTrace();
            }
        }

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
