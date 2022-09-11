package controller.Cadastrar;

import dao.MontaBoloDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.CoberturaBolo;
import model.FormatoBolo;
import model.MontaBolo;
import model.PesoBolo;
import model.Pessoa;
import model.RecheioBolo;
import model.SaborBolo;

@WebServlet(name = "CadastrarBolo", urlPatterns = {"/CadastrarBolo"})
public class CadastrarBolo extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       request.setCharacterEncoding("UTF-8");
       
       try{
           int codigoBolo = request.getParameter("codigoBolo").isEmpty() ? 0 : Integer.parseInt(request.getParameter("codigoBolo"));
           
           String decoracao = request.getParameter("decoracao");
           
           SaborBolo saborBolo = new SaborBolo(Integer.parseInt(request.getParameter("codigoSabor")));
           
           CoberturaBolo coberturaBolo = new CoberturaBolo(Integer.parseInt(request.getParameter("codigoCobertura")));
           
           RecheioBolo recheioBolo = new RecheioBolo(Integer.parseInt(request.getParameter("codigoRecheio")));
           
           PesoBolo pesoBolo = new PesoBolo(Integer.parseInt(request.getParameter("codigoPeso")));
          
           FormatoBolo formatoBolo = new FormatoBolo(Integer.parseInt(request.getParameter("codigoFormato")));
          
           Pessoa pessoa = new Pessoa(Integer.parseInt(request.getParameter("codigoPessoa")));
                   
           MontaBolo bolo = new  MontaBolo(codigoBolo, decoracao, saborBolo, coberturaBolo, recheioBolo, pesoBolo, formatoBolo, pessoa);
           
           MontaBoloDAO montaBoloDAO = new MontaBoloDAO();
           
           montaBoloDAO.cadastrar(bolo);
           
             request.setAttribute("mensagem", "Gravado com sucesso!");
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mesagem", ex.getMessage());
        }
        request.getRequestDispatcher("ListarBolo").forward(request, response);
    
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
