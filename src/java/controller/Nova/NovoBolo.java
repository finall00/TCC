
package controller.Nova;

import dao.MontaBoloDAO;
import dao.PessoaDAO;
import dao.itensBoloDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CoberturaBolo;
import model.FormatoBolo;
import model.MontaBolo;
import model.PesoBolo;
import model.Pessoa;
import model.RecheioBolo;
import model.SaborBolo;


@WebServlet(name = "NovoBolo", urlPatterns = {"/NovoBolo"})
public class NovoBolo extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
        
        try{         
            request.setAttribute("montaBolo", new MontaBolo(new PesoBolo(), new SaborBolo(), new CoberturaBolo(), new RecheioBolo(), new FormatoBolo(), new Pessoa()));
            
            itensBoloDAO recheios = new itensBoloDAO();
            request.setAttribute("recheio", recheios.listarRecheio());
            
            itensBoloDAO pesos = new itensBoloDAO();
            request.setAttribute("peso", pesos.listarPeso());
            
            itensBoloDAO sabores = new itensBoloDAO();
            request.setAttribute("sabor", sabores.listarSabor());
            
            itensBoloDAO coberturas = new itensBoloDAO();
            request.setAttribute("cobertura", coberturas.listarCobertura());
            
            itensBoloDAO formatos = new itensBoloDAO();
            request.setAttribute("formato", formatos.listarFormato());    
            
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensagem", ex.getMessage());
        }
         
        request.getRequestDispatcher("montarBolo.jsp").forward(request, response);

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
