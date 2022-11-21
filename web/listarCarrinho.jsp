<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Cliente"%>
<%@page import="model.Funcionario"%>
<%@page import="model.ItensVenda"%>
<%@page import="model.Carrinho"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>
<%
//verifica se funcionario e vazio e te manda pra puta q paril 
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
    DecimalFormat df = new DecimalFormat("#,###.00");

    if (cliente != null || funcionario != null) {

        List<ItensVenda> lista = (List<ItensVenda>) request.getAttribute("produtos");
%>


<section id="cart" class="section-p">
    <h2 style="padding-left: 40%;
        padding-bottom: 30px;">${mensagem}</h2>
    <div class="conteudo">

        <table width="100%">
            <thead>
                <tr>
                    <td>Remover</td>
                    <td>Imagem</td>
                    <td>Produto</td>
                    <td>Preço</td>
                    <td>Quantidade</td>
                    <td>Total</td>
                    <td>Comprar</td>

                </tr>
            </thead>

            <tbody>
                <% if (lista == null) { %>

                <% }
                    if (lista != null) {
                        Carrinho car = new Carrinho(lista);
                        for (ItensVenda venda : lista) {%>
                <tr>
                    <td><a href="RemoverItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>"><i
                                class='bx bx-trash'></i></a></td>
                    <td><img id="imgProd" src="<%= (String) request.getContextPath() + "/imagens/" + venda.getProduto().getImagem()%>" alt=""></td>
                    <td>
                        <%=venda.getProduto().getNomeProduto()%>
                    </td>
                    <td>R$ <%=venda.getProduto().getVlrVenda()%>
                    </td>

                    <td>


                        <input id="qtdProd" name="qtdProduto" readonly=""value="<%=venda.getQtdProduto()%>">

                        <a href="DiminuirItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>" ><i id="add-sub" style=" padding-top: 24px;" class='bx bxs-down-arrow' ></i></a>
                        <a href="AumentarItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>" ><i id="add-sub"style="  padding-top: 3px;" class='bx bxs-up-arrow' ></i></a>
                    </td>
                    <td>R$ <%= df.format(venda.getTotal())%>
                    </td>
                    <td><a href="FinalizarVenda?codigoProduto=<%=venda.getProduto().getCodigoProduto()%>&qtdProduto=<%=venda.getQtdProduto()%>&vlrVenda=<%=venda.getProduto().getVlrVenda()%>">Comprar</a></td>

                </tr>
                <% }%>

            </tbody>
        </table>
    </div>
</section>

<section id="vtotal" class="section-p">
    <div id="total">
        <h3>Total do Carrinho</h3>
        <table>
            <tr>
                <td><strong>Total</strong></td>

                <td><strong>R$ <%= df.format(car.getSubTotal())%></strong></td>

            </tr>
        </table>


    </div>
</section>
<% } else {%>

<section id="vtotal" class="section-p"  style=" display: none;" >
    <div id="total" >
        <h3>Total do Carrinho</h3>
        <table>
            <tr>
                <td><strong>Total</strong></td>

                <td><strong>R$ 0.00</strong></td>

            </tr>
        </table>
    </div>
</section>
<%}%>








<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>

