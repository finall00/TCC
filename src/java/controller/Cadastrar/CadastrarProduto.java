package controller.Cadastrar;

import dao.ProdutoDAO;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Produto;

@MultipartConfig
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

            //Mudar o caminho para o local da pasta q o servidor esta rodadando
//            String caminho = "C:/Users/smili08/Documents/NetBeansProjects/confeitaria/web" + "/imagens" + "/";
            Part filePart = request.getPart("file");
            String imagem = filePart.getSubmittedFileName();
            
            if (imagem.isEmpty()) {
                imagem = request.getParameter("imagem");
            }
            
            Produto produto = new Produto(codigoProduto, nomeProduto, dataValidade, estoqueProduto, vlrCusto, vlrVenda, codigoBarra, descricaoProduto, imagem);
            
            request.getRequestDispatcher("CadastrarImg").include(request, response);
            
            ProdutoDAO produtoDAO = new ProdutoDAO();
            produtoDAO.cadastrar(produto);
            
            request.setAttribute("mensagem", "gravado com sucesso!");
            
//            request.setAttribute("imagem", filePart);
            
        } catch (SQLException | ClassNotFoundException | FileNotFoundException ex) {
            request.setAttribute("mesagem", ex.getMessage());
            request.getRequestDispatcher("ListarProduto").forward(request, response);
        }
        request.getRequestDispatcher("ListarProduto").forward(request, response);
        
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
    }
    
}
