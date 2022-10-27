package controller.itensbolo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CoberturaBolo;

@WebServlet(name = "NovaCoberturaB", urlPatterns = {"/NovaCoberturaB"})
public class NovaCoberturaB extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("cobertura", new CoberturaBolo());

        request.getRequestDispatcher("bolo_pages/cadastrarCobertura.jsp").forward(request, response);
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
    yung lixo - da vinci code
    
    Olha só ó ó ó
    invadindo a frança, ha assalto de grandte porte 
    tipo entra na casa branca e leva tudo q nois pode
    No topo do louvre, descendo de corda memo
    Hj nois vai leva tudo e tamo poco si fudendo, ha ha
    minha Vó qué janta debaixo da ultima ceia
    Então vo leva pra ela de presente na sexta,
    E se ela faze uma disfeita mano n vai te problema
    Levo mais uma dezena q é so pra ter certeza 
    Da Vinci code, bitch, mano nois ta invisivel 
    Incrivel na noite o Kit, mano, é missão impossivel
    Então aumenta a segurança Então corre e fecha as tranca 
    Que se os moleque chegar, eles rapa ca tua banca e toma tudo.
    
    A segurança tá fraca, nós entrou e levo tudo
    As trava que protegia, nós desfez com um canudo
    Desnudo, o Homem Vitruviano, nós carregamo
    E levamo pra nossa vó que agora tá decifrando   
    Da Vinci code, bitch
    Tá fudido Da Vinci, pegamo teu autorretrato
    Vamo desvendar o barato
    A equipe cheia dos kit, pronta pra desvendar o fato
    E ter fama pelas street, agora nós fica rich, bitch.
    
    Da Vinci code, bitch, mano, nós ta invisível
    Incrível na noite o kit, mano, é Missão Impossível
    Então aumenta a segurança, então corre e fecha as tranca
    Que se os moleque chegar, eles rapa ca tua banca
    Da Vinci code, bitch, mano, nós tá invisível
    Incrível na noite o kit, mano, é Missão Impossível
    Então aumenta a segurança, então corre e fecha as tranca
    Que se os moleque chegar, eles rapa ca tua banca e toma tudo
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}