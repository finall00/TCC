package controller.venda;

import dao.ItensVendaDAO;
import dao.PedidoVendaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Funcionario;
import model.ItensVenda;
import model.PedidoVenda;
import model.Pessoa;
import model.Produto;

/**
 *
 * @author smili08
 */
@WebServlet(name = "FinalizarVenda", urlPatterns = {"/FinalizarVenda"})
public class FinalizarVenda extends HttpServlet {

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

        PedidoVenda pedidoVenda = new PedidoVenda();
        Pessoa pessoa = new Pessoa();

        HttpSession sessao = request.getSession(true);
        Funcionario cliente = (Funcionario) sessao.getAttribute("funcionario");//trocar isso no futuro por codigo cliente ou codigo pessoa porem pode dar problema no login n sei n vo testar agora 

        Integer codigo = cliente.getCodigoPessoa();

        String[] produtos = request.getParameterValues("codigoProduto");
        String[] vlrVenda = request.getParameterValues("vlrVenda");
        String[] qtdProdutos = request.getParameterValues("qtdProduto");
        Double vlrTotalVenda = Double.parseDouble(request.getParameter("VlrTotal"));

        String mensagem = null;

        Date date = new Date();
        pessoa.setCodigoPessoa(codigo);

        pedidoVenda.setPessoa(pessoa);

        pedidoVenda.setDataVenda(date);
        String obsVenda = "";
        pedidoVenda.setObsVenda(obsVenda);
        pedidoVenda.setVlrTotalVenda(vlrTotalVenda);

        if (produtos != null && qtdProdutos != null) {
            try {

                ItensVenda itensVenda = new ItensVenda();
                PedidoVendaDAO PedidoDao = new PedidoVendaDAO();

                Integer codigoVenda = PedidoDao.cadastrar(pedidoVenda);
                pedidoVenda.setCodigoPedido(codigoVenda);

                if (codigoVenda > 0) {
                    for (int i = 0; i < produtos.length; i++) {

                        Produto produto = new Produto();
                        produto.setCodigoProduto(Integer.parseInt(produtos[i]));

                       // itensVenda.setCodigoItenV(codigoVenda);
                        itensVenda.setPedidoVenda(pedidoVenda);
                        itensVenda.setProduto(produto);
                        itensVenda.setQtdProduto(Double.parseDouble(qtdProdutos[i]));
                        itensVenda.setVlrProduto(Double.parseDouble(vlrVenda[i]));

                    }

                    ItensVendaDAO ItensVendaDAO = new ItensVendaDAO();
                    if (ItensVendaDAO.cadastrar(itensVenda)) {
                        mensagem = "Cadastro realizado com sucesso!";

                    } else {
                        mensagem = "Problemas ao realizar cadastro!";
                    }
                } else {
                    mensagem = "Problemas ao realizar cadastro!";
                }

                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Erro ao adicionar Itens no Carrinho!");
                ex.printStackTrace();
            }
        }
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
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
