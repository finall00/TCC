package controller.Cadastrar;

import dao.ProdutoDAO;
import java.io.IOException;

import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;

@WebServlet(name = "CadastrarProduto", urlPatterns = {"/CadastrarProduto"})
public class CadastrarProduto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            int codigoProduto = request.getParameter("codigoProduto").isEmpty()
                    ? 0 : Integer.parseInt(request.getParameter("codigoProduto"));

            String nomeProduto = request.getParameter("nomeProduto");
            
            String dataValidade = request.getParameter("dataValidade");
            
            int estoqueProduto = request.getParameter("estoqueProduto").isEmpty() ? 0 : Integer.parseInt(request.getParameter("estoqueProduto"));
            
            double vlrCusto = Double.parseDouble(request.getParameter("vlrCusto"));
            
            double vlrVenda = Double.parseDouble(request.getParameter("vlrVenda"));

            String codigoBarra = request.getParameter("codigoBarra");
            String descricaoProduto = request.getParameter("descricaoProduto");
            

            Produto produto = new Produto(codigoProduto, nomeProduto, dataValidade, estoqueProduto, vlrCusto, vlrVenda, codigoBarra, descricaoProduto);

            ProdutoDAO produtoDAO = new ProdutoDAO();
            produtoDAO.cadastrar(produto);
            request.setAttribute("mensagem", "gravado com sucesso!");

        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mesagem", ex.getMessage());
        }

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
