package controller.venda;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Funcionario;
import model.ItensVenda;
import model.Produto;

/**
 * @author smili08
 */
@WebServlet(name = "addCarrinho", urlPatterns = {"/addCarrinho"})
public class AddCarrinho extends HttpServlet {

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
        try {

            HttpSession sessao = request.getSession(false);

            Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
            Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
            if (cliente != null || funcionario != null) {

                List<ItensVenda> listaAtual = null;
                
                if (sessao.getAttribute("itensProduto") != null) {
                    listaAtual = (List<ItensVenda>) sessao.getAttribute("itensProduto");
                } else {
                    listaAtual = new ArrayList<>();
                }
                

                //pega os dados do front 
                Integer codigoProduto = Integer.parseInt(request.getParameter("codigoProduto"));
                String nomeProduto = request.getParameter("nomeProduto");
                String Imagem = request.getParameter("imagem");
                Double vlrVenda = Double.parseDouble(request.getParameter("vlrVenda"));
                Double qtnProduto = Double.parseDouble(request.getParameter("qtnProduto"));
                Integer estoqueProduto = Integer.parseInt(request.getParameter("estoqueProduto"));

                //model de protudo
                Produto produto = new Produto();
                produto.setCodigoProduto(codigoProduto);
                produto.setNomeProduto(nomeProduto);
                produto.setVlrVenda(vlrVenda);
                produto.setEstoqueProduto(estoqueProduto);
                produto.setImagem(Imagem);

                //model de itensVenda 
                ItensVenda itensVenda = new ItensVenda();
                itensVenda.setProduto(produto);
                itensVenda.setQtdProduto(qtnProduto);
                

                //cria e passa a lista para o carrinho
                listaAtual.add(itensVenda);
                        
//                Carrinho carrinho = new Carrinho(listaAtual);
//                carrinho.addItem(produto);

//                listaAtual = carrinho.getItens();

                sessao.setAttribute("itensProduto", listaAtual);
            } else {
                request.setAttribute("mensagem", "Você não esta logado!!!");
            }
        } catch (Exception | AbstractMethodError ex) {
            request.setAttribute("mensagem", "Erro ao adicionar item no carrinho:" + ex.getMessage());
        }

        // request.getRequestDispatcher("ListarItensCarrinho").forward(request, response);
        request.getRequestDispatcher("ListarProduto").forward(request, response);
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
