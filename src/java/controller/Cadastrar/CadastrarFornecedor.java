package controller.Cadastrar;

import dao.FornecedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Fornecedor;

@WebServlet(name = "CadastrarFornecedor", urlPatterns = {"/CadastrarFornecedor"})
public class CadastrarFornecedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            int codigoPessoa = request.getParameter("codigoPessoa").isEmpty()
                    ? 0 : Integer.parseInt(request.getParameter("codigoPessoa"));

            String nomePessoa = request.getParameter("nomePessoa"); 
            
            String dataNascimento = request.getParameter("dataNascimento");
            
            String cpfPessoa = request.getParameter("cpfPessoa");
            
            String rgPessoa = request.getParameter("rgPessoa");
            
            String telefonePessoa = request.getParameter("telefonePessoa");
            
            String celularPessoa = request.getParameter("celularPessoa");
            
            String emailPessoa = request.getParameter("emailPessoa");
            
            String enderecoPessoa = request.getParameter("enderecoPessoa");
            
            String numeroCasa = request.getParameter("numeroCasa");  
            
            String estadoPessoa = request.getParameter("estadoPessoa");
            
            String cepPessoa = request.getParameter("cepPessoa");
            
            String cidadePessoa = request.getParameter("cidadePessoa");
            
            String bairroPessoa = request.getParameter("bairroPessoa");
            
            String razaoSocial = request.getParameter("razaoSocial");
            
            String contatoVendedor = request.getParameter("contatoVendedor");
            
            
            
            String obsFornecedor = request.getParameter("obsFornecedor");

            

            Fornecedor fornecedor = new Fornecedor(razaoSocial, contatoVendedor, obsFornecedor, codigoPessoa, nomePessoa, dataNascimento, cpfPessoa, rgPessoa, telefonePessoa, celularPessoa, emailPessoa, enderecoPessoa, estadoPessoa, numeroCasa, cepPessoa, cidadePessoa, bairroPessoa);

            FornecedorDAO fornecedorDAO = new FornecedorDAO();
            fornecedorDAO.cadastrar(fornecedor);
            request.setAttribute("mensagem", "Gravado com sucesso!");
        } catch (SQLException |ClassNotFoundException  ex) {
            request.setAttribute("mensagem", ex.getMessage());
        }
        request.getRequestDispatcher("ListarFornecedor").forward(request, response);
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
