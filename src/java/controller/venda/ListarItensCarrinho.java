package controller.venda;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Carrinho;
import model.ItensVenda;

/**
 *
 * @author smili08
 */
@WebServlet(name = "ListarItensCarrinho", urlPatterns = {"/ListarItensCarrinho"})
public class ListarItensCarrinho extends HttpServlet {

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
            HttpSession sessao = request.getSession(true);
            List<ItensVenda> listaProdutos = (List<ItensVenda>) sessao.getAttribute("itensProduto");
            
            
            System.out.println("Quantidade: " + listaProdutos.size());
            
            request.setAttribute("produtos", listaProdutos);
            
//            for(ItensVenda venda : listaProdutos){
//            System.out.println("\n\n");
//            System.out.println("codigo Iten V"+venda.getCodigoItenV());
//            System.out.println("Nome"+venda.getProduto().getNomeProduto());                        
//            System.out.println("Nome"+venda.getQtdProduto());                        
//            System.out.println("vlr produto"+venda.getProduto().getVlrVenda());
//            System.out.println("vlr total"+venda.getTotal());
//            System.out.println("codigo Produto"+venda.getProduto().getCodigoProduto());           
//            
//        }// n consigo pegar o sub total pq ele ta na model de carrinho
            
            
            
        } catch (Exception ex) {
            System.out.println("Erro Listar itens Carrinho! " + ex.getMessage());            
        }
        request.getRequestDispatcher("listarCarrinho.jsp").forward(request, response);

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
//
//try {
//            HttpSession sessao = request.getSession(true);
//            Carrinho carrinho = (Carrinho)  sessao.getAttribute("itensProduto");
//            
//            
//            System.out.println("Quantidade: " + carrinho.getItens());
//            
//            request.setAttribute("produtos", carrinho);
//            
//            for(ItensVenda venda : carrinho.getItens()){
//           System.out.println("\n\n");
//           System.out.println("codigo Iten V "+venda.getCodigoItenV);
//           System.out.println("Nome "+venda.getProduto().getNomeProduto());                        
//           System.out.println("Nome "+venda.getQtdProduto());                        
//           System.out.println("vlr produto"+venda.getProduto().getVlrVenda());
//           System.out.println("vlr total"+venda.getTotal());
//           System.out.println("codigo Produto"+venda.getProduto().getCodigoProduto());                     
//     }// n consigo pegar o sub total pq ele ta na model de carrinho
//            
//            
//            request.getRequestDispatcher("listarCarrinho.jsp").forward(request, response);
//
//        } catch (Exception ex) {
//            System.out.println("Erro Listar itens Carrinho! " + ex.getMessage());            
//        }