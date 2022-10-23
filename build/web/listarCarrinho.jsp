<%@page import="model.Funcionario"%>
<%@page import="model.ItensVenda"%>
<%@page import="model.Carrinho"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>
<%
//verifica se funcionario e vazio e te manda pra puta q paril 
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionario != null) {
%>
<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header">
        <h3>Carrinho(era pra ser)</h3>
    </div>
    <div class="card-body">    
        <hr/>
        <a class="btn btn-secondary" href="homeFuncionario.jsp">Voltar</a>
        <a class="btn btn-secondary" href="ListarProduto">Comprar mais </a>
        <hr/>



        <table class="table table-striped">
            <thead>
                <tr>
                    <th>codigo Iten</th>
                    <th>Nome Produto</th>  
                    <th></th>
                    <th>quantidade Produto</th>  
                    <th></th>

                    <th>Vlr item</th>       
                    <th>Total</th>
                    <th></th>
                    <th>Total do carrinho</th>                                  
                </tr>
            </thead>
            <tbody>


                <%
                    List<ItensVenda> lista = (List<ItensVenda>) request.getAttribute("produtos");

                    if (lista == null) {
                %>

            <div class="alert alert-primary" role="alert">
                <br>
                <br>
                <br>  
                ${mensagem}
            </div>
            <%
            } else {
                Carrinho car = new Carrinho(lista);
                for (ItensVenda venda : lista) {
            %>
            <tr>                 

                <td><%=venda.getProduto().getCodigoProduto()%></td>
                <td><%=venda.getProduto().getNomeProduto()%></td>  
                <td><a class="btn btn-secondary" href="DiminuirItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>">-</a></td>
                <td><%=venda.getQtdProduto()%></td>  
                <td><a class="btn btn-info" href="AumentarItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>">+</a></td>               
                <td>R$ <%=venda.getProduto().getVlrVenda()%></td>
                <td>R$ <%=venda.getTotal()%></td>
                <td><a class="btn btn-danger" href="RemoverItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>">Remover Item</a></td>

                <% }%>
                <td>R$ <%= car.getSubTotal()%></td>
            </tr> 

            <% }%>

            <td><a class="btn btn-success" href="FinalizarVenda">Fizalilzar comspra!!!!!!</a></td>
            <td><a class="btn btn-info" href="LimparCarrinho">Limpar</a></td>
            </tbody>         
        </table>
    </div>
</div>
<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>