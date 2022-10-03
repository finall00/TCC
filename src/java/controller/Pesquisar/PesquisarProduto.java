package controller.Pesquisar;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import model.Produto;

@WebServlet(name = "PesquisarProduto", urlPatterns = {"/PesquisarProduto"})
public class PesquisarProduto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

       

        //Pesquisar normal
         try {
            String nomeProduto = request.getParameter("nomeProduto");
            
            

            ProdutoDAO produtoDAO = new ProdutoDAO();
            List<Produto> produtos = (List<Produto>) (Object) produtoDAO.PesquisarProduto(nomeProduto);
            if (produtos.size() > 0) {
                request.setAttribute("produto", produtos);
            } else {
                request.setAttribute("mensagem", "Produto não encontrado");
            }

        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensagem", ex.getMessage());
        }
        request.getRequestDispatcher("listarProduto.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
