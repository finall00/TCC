package controller.Cadastrar;

import dao.FuncionarioDAO;
import model.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cargo;

@WebServlet(name = "CadastrarFuncionario", urlPatterns = {"/CadastrarFuncionario"})
public class CadastrarFuncionario extends HttpServlet {

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

            String obsFuncionario = request.getParameter("obsFuncionario");

            String loginFuncionario = request.getParameter("loginFuncionario");

            String senhaFuncionario = request.getParameter("senhaFuncionario");

            Cargo cargo = new Cargo(Integer.parseInt(request.getParameter("codigoCargo")));

            Funcionario funcionario = new Funcionario(obsFuncionario, loginFuncionario, senhaFuncionario, cargo, codigoPessoa, nomePessoa, dataNascimento, cpfPessoa, rgPessoa, telefonePessoa, celularPessoa, emailPessoa, enderecoPessoa, estadoPessoa, numeroCasa, cepPessoa, cidadePessoa, bairroPessoa);

            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
            funcionarioDAO.cadastrar(funcionario);
            request.setAttribute("mensagem", "Gravado com sucesso!");
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensagem", ex.getMessage());
        }

        request.getRequestDispatcher("ListarFuncionario").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     * mc vv - e no fim foram dois;
     *
     * To make those rainbows in my mind, when i think of you sometime And I
     * wanna spend some time with you I see the crystal raindrops fall and the
     * beauty of it all Is when the sun comes shining through
     * To make those rainbows in my mind When I think of you sometime
     * And I wanna spend some time with you Just the two of us We can make it if
     * we try Just the two of us (Just the two of us) Just the two of us
     * Building castles in the sky Just the two of us You and I [Verso 1] Ó,
     * Deus, ó, Dеus, encontrei o meu A jornada foi longa, mas acabou, mеu Deus
     * E agora com você fica tudo bem mais fácil Tudo fiz e faço pra poder te
     * dar um abraço Viajei por vários mundos, várias dimensões Eu já vi de
     * tudo, fui heróis e fui vilões Em uma vida eu traficava, mas o negócio não
     * era bom Prefiro ficar em casa, curtir essa com você, Robson
     *
     * [Refrão] Descendo a escada lá do céu, me pergunto de onde vim Será que o
     * destino planejou isso pra mim? Me recuso a crer, me pergunto se é o fim
     * Posso descansar, posso descansar enfim
     *
     * [Verso 2] 'Cê não ia acreditar nas coisas que eu vi Melhor dizendo, nas
     * coisas que eu vivi Senti na pele a vida de um ladrão, de um traficante De
     * um amante de idosa e de um estudante Vivi bastante pra cobrir cinquenta
     * vida' Achei que era uma viagem só de ida Tomei dedada no butico, até
     * perdi a vida Tive doença venérea e fui terraplanista Mas memo' tendo
     * chupado minha própria pica Memo' tendo namorado um ouriço armado Memo'
     * tendo derrubado meu vô e matado Memo' tendo sonegado imposto toda vida
     * Memo' tendo sido meio insano e caipira Memo' tendo batalhado com um
     * demônio sogra Memo' tendo feito vlog e virado moda Memo' tendo matado
     * alguém na pista Memo' tendo vivido toda' essas vida' Algo sempre parecia
     * tá errado Memo' tendo vivido toda' essas vida' Eu ainda prefiro 'tar do
     * teu lado, Robson [Refrão] Descendo a escada lá do céu, me pergunto de
     * onde vim Será que o destino planejou isso pra mim? Me recuso a crer, me
     * pergunto se é o fim Posso descansar, posso descansar enfim
     *
     * [Verso 3] E ele pediu por anal Não é legal, só boquetin' Eu só chupei meu
     * amigo Não vem querer comer cuzin'
     *
     * Na Fenda da Sunga Piranha não cola, sai, sua vagabunda Só peixe gostoso,
     * Hasselhoff de sunga Linguado na água, linguada na bunda Filha da puta,
     * essa é a Fenda da Sunga
     *
     * Bitch, eu não te amo, eu amo crack, ô, vagabunda Como pedra tipo Mac, Big
     * Crack like bunda Tua sexta-feira é igual minha segunda Sim, eu uso crack,
     * ô, cala a boca, sua imunda
     *
     * Pego tua prima, levo lá pra esquina e feel good Já virou mania, pego ela
     * e solto um haha Pego tua prima, levo lá pra esquina e feel good Já virou
     * mania, pego ela e solto um haha Bitch, eu mando o Michael Fuck you up,
     * like I'm a psycho (Soneguei) Bitch, eu mando o Michael Bag it up, drop in
     * the bayou (Soneguei) Bitch, eu mando o Michael Fuck you up, like I'm a
     * psycho (Soneguei) Bitch, eu mando o Michael Bag it up, drop in the bayou
     *
     * E eu sinto o Shadow no meu cu Larissa, não quero teus beijo Só me
     * apaixono por ouriços pretos Ou azuis nos pelos, mas de qualquer jeito
     * Não, não, não, Não.
     *
     *
     *
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
