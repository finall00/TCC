package controller.venda;

import dao.ItensVendaDAO;
import dao.PedidoVendaDAO;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Carrinho;
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

        List<ItensVenda> a = (List<ItensVenda>) sessao.getAttribute("itensProduto");
        Carrinho car = new Carrinho(a);
        car.getCodigoItem();
        car.getQtnItens();

        //eu n to conseguindo pegar a porra dos dados vai se fudeeeeeeeeeeeeeeeeeeeeeeeeeee
        String[] produtos = request.getParameterValues("codigoProduto");

        String[] vlrVenda = request.getParameterValues("vlrVenda");

        String[] qtdProdutos = request.getParameterValues("qtdProduto");
        String obsVenda = "";

        String mensagem = null;

        Date date = new Date();
        pessoa.setCodigoPessoa(codigo);

        //coloca os dados na model de pedido
        pedidoVenda.setPessoa(pessoa);
        pedidoVenda.setDataVenda(date);
        pedidoVenda.setObsVenda(obsVenda);
        pedidoVenda.setVlrTotalVenda(car.getSubTotal());

        if (produtos != null && qtdProdutos != null) {
            try {

                ItensVenda itensVenda = new ItensVenda();
                PedidoVendaDAO PedidoDao = new PedidoVendaDAO();

                //cadastra o pedido e retorna o codigo da venda
                Integer codigoVenda = PedidoDao.cadastrar(pedidoVenda);
                pedidoVenda.setCodigoPedido(codigoVenda);

                if (codigoVenda > 0) {
                    for (int i = 0; i < produtos.length; i++) {

                        Produto produto = new Produto();
                        produto.setCodigoProduto(Integer.parseInt(produtos[i]));

                        itensVenda.setPedidoVenda(pedidoVenda);
                        itensVenda.setProduto(produto);
                        itensVenda.setQtdProduto(Double.parseDouble(qtdProdutos[i]));
                        itensVenda.setVlrProduto(Double.parseDouble(vlrVenda[i]));

                    }

                    ItensVendaDAO ItensVendaDAO = new ItensVendaDAO();
                    if (ItensVendaDAO.cadastrar(itensVenda)) {
                        car.clear();
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
    /*
    Imagine Dragins- Sharks
    
    Trouble
    Blood is in the rocky waters
    Hide away your sons and daughters
    Eat you alive
 
    Levels better put your head on swivels
    Dancing with the very devil
    Butter to knife
 
    You think you're better than them, better than them
    You think they're really your friends, really your friends
    But when it comes to the end, to the end
    You're just the same as them, same as them
 
    So let it go, let it go 
    That's the way that it goes
    First you're in then you're out, everybody knows
    You're hot then you're cold, you're a light in the dark
    Just you wait and you’ll see that you're swimming with sharks
 
    He's coming to get you, he's coming to get you, get you
 
    Bubbles, drowning you're seeing doubles
    Don't you let them see your struggles hiding your tears
    Crisis, take advantage of your niceness
    Cut you up in even slices
    Prey on your fears
 
    You think you're better than them, better than them
    You think they're really your friends, really your friends
    But when it comes to the end, to the end
    You're just the same as them, same as them
 
    So let it go, let it go 
    That's the way that it goes
    First you're in then you're out, everybody knows
    You're hot then you're cold, you're a light in the dark
    Just you wait and you’ll see that you're swimming with sharks
 
    My blood is pumping, coming to get you, don't take it from me
    My blood is pumping, coming to get you, don't take it from me
    My blood is pumping, coming to get you, don't take it from me
    My blood is pumping, coming to get you, don't take it from me
 
    Every time my heart is beating I can feel the recipe
    I wonder if my day is coming, blame it on the entropy
    My blood is pumping I can see the end is right in front of me
    Don't take it from me
    I could be everything....everything
 
    So let it go, let it go 
    That's the way that it goes
    First you're in then you're out, everybody knows
    You're hot then you're cold, you're a light in the dark
    Just you wait and you’ll see that you're swimming with sharks
 
    My blood is pumping, coming to get you, don't take it from me
    My blood is pumping, coming to get you, don't take it from me
    My blood is pumping, coming to get you, don't take it from me
 
    My blood is pumping, coming to get you, don't take it from me
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
