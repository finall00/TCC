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
<main>
    <div class="card my-5 text-center w-75 mx-auto">
        <div class="card-header">
            <h3>Carrinho</h3>
        </div>
        
        <div class="card-body">    
<hr>
            <table class="table ">
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
                <div role="alert">                
                    <h2 style="font-size: 20px; margin-bottom: 2rem;"> ${mensagem} </h2>
                </div>
                <%
                    if (lista == null) {
                %>
                
                <%
                } else {
                    Carrinho car = new Carrinho(lista);
                    for (ItensVenda venda : lista) {
                %>

                <tr>                

                    <td name="codigoProduto"><%=venda.getProduto().getCodigoProduto()%></td>

                    <td><%=venda.getProduto().getNomeProduto()%></td>  

                    <td><a class="btn btn-secondary" href="DiminuirItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>">-</a></td>

                    <td><input id="qtdProd" name="qtdProduto"readonly="" value="<%=venda.getQtdProduto()%>"/></td>  


                    <td><a class="btn btn-info" href="AumentarItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>">+</a></td>   

                    <td>R$ <%=venda.getProduto().getVlrVenda()%></td>

                    <td>R$ <%= df.format(venda.getTotal())%></td>

                    <td><a class="btn btn-danger" href="RemoverItem?codigoP=<%=venda.getProduto().getCodigoProduto()%>">Remover Item</a></td>

                    <td><a class="btn btn-info" href="FinalizarVenda?codigoProduto=<%=venda.getProduto().getCodigoProduto()%>&qtdProduto=<%=venda.getQtdProduto()%>&vlrVenda=<%=venda.getProduto().getVlrVenda()%> ">Comprar</a> </td>
                    <% }%>
                    <td>Valor Total: R$ <%= df.format(car.getSubTotal())%></td>   
                </tr> 
                <td>
                    <input type="hidden" name="" value="<%= car.getItens()%>" class="form-input">
                </td>

                <td><a class="btn btn-info" href="LimparCarrinho">Limpar</a></td> 
                <% }%> 

                </tbody>  

            </table>
                <hr>
                <input class="btn btn-primary" value="Voltar" type="button" onclick="history.go(-1)">
            <a class="btn btn-secondary" href="ListarProduto">Comprar mais </a>

        </div>
    </div>
</main>
<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>

