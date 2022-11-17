/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.venda;

import dao.PedidoVendaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Funcionario;

/**
 *
 * @author smili08
 */
@WebServlet(name = "ConsultarCompra", urlPatterns = {"/ConsultarCompra"})
public class ConsultarCompra extends HttpServlet {

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
            Funcionario func = (Funcionario) sessao.getAttribute("funcionario");
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            
            PedidoVendaDAO pedidoVenda = new PedidoVendaDAO();
            
            int codigoPessoa = 0;
            
            if (cliente != null) {
                codigoPessoa = cliente.getCodigoPessoa();
                
                request.setAttribute("compra", pedidoVenda.consultar(codigoPessoa));
                
            } else if (func != null) {
                int codigoPedido = Integer.parseInt(request.getParameter("codigoP")); 
                
                request.setAttribute("compra", pedidoVenda.consultarP(codigoPedido));
            }           
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensagem", ex.getMessage());
        }
        
        request.getRequestDispatcher("listarCompra.jsp").include(request, response);        
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
