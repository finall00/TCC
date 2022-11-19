/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.venda;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ItensVenda;

/**
 *
 * @author smili08
 */
@WebServlet(name = "AumentarItem", urlPatterns = {"/AumentarItem"})
public class AumentarItem extends HttpServlet {

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
//        try {
//            HttpSession sessao = request.getSession(true);
//            
//            Carrinho carrinho = new Carrinho();
//            String limpar = (String) request.getAttribute("limpar");
//            
//            
//          if(limpar.equals("true")){
//             carrinho.clear();
//            }
//        } catch (Exception e) {
//            request.setAttribute("mensagem", e.getMessage());
//        }

        try {

            HttpSession sessao = request.getSession(true);

            int codigoP = Integer.parseInt(request.getParameter("codigoP"));

            List<ItensVenda> lista = (List<ItensVenda>) sessao.getAttribute("itensProduto");

            ItensVenda i = new ItensVenda();
            boolean a = false;
            for (ItensVenda venda : lista) {
                if (venda.getProduto().getCodigoProduto() == codigoP) {

                    a = venda.aumentarQuant();
                    break;
                }
            }
            if (a == false) {
                request.setAttribute("mensagem", "O estoque não possui essa quantidade de itens");
            }

            sessao.setAttribute("itensProduto", lista);
        } catch (Exception ex) {
            request.setAttribute("mensagem", "Erro ao adicionar item no carrinho " + ex.getMessage());

        }

        request.getRequestDispatcher("ListarItensCarrinho").forward(request, response);

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
