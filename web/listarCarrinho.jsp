<%@page import="model.Funcionario"%>
<%@page import="model.ItensVenda"%>
<%@page import="model.Carrinho"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>
<%

    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionario != null) {
%>
<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header">
        <h3>Carrinho(era pra ser)</h3>
    </div>
    <div class="card-body">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>
        <hr/>

        <a class="btn btn-secondary" href="homeFuncionario.jsp">Voltar</a>
        <a class="btn btn-secondary" href="ListarProduto">Comprar mais </a>
        <hr/>



        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>codigo Iten</th>
                    <th>Nome Produto</th>           
                    <th>quantidade Produto</th>  
                    <th></th>
                    <th>Valor Unitario</th>           
                    <th>Total</th>       
                    <th>Total</th>       
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
                <td><%=venda.getQtdProduto()%></td>  
                <td><a href="AcaoCarrinho?codigoP=<%=venda.getProduto().getCodigoProduto()%>">+</a></td>
                <td><%=venda.getProduto().getVlrVenda()%></td>
                <td><%=venda.getTotal()%></td>


                <%
                    }%>
                <td><%= car.getSubTotal()%></td>
                <%
                    }

                %>

            </tr>
            <td><a class="btn btn-info" href="FinalizarVenda?codigoPessoa=<%=funcionario.getCodigoPessoa()%>">Alterar</a></td>
            <td><a class="btn btn-info" href="limparCarrinho?limparCarrinho =<%="true"%>">Limpar</a></td>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/rodape.jsp"/>
<%
    }

    
        else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>