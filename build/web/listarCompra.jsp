<%@page import="model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.PedidoVenda"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>
<%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");   
    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
    if ( cliente != null||funcionario != null) {
   
%>

    
<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header">
        <h3>Clientes</h3>
    </div>   
    <div class="card-body">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>
        <hr/>
        <a class="btn btn-success" href="NovoCliente">Novo</a>
        <a class="btn btn-secondary" href="homeFuncionario.jsp">Voltar</a>
        <hr/>
        <% List<PedidoVenda> lista = (List<PedidoVenda>) request.getAttribute("compra"); %>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Codigo</th>                   
                    <th>Data Venda</th>
                    <th>Nome Pessoa</th>
                    <th>Produto</th>                  
                    <th>Vlr Unitario</th>
                    <th>quantidade</th>                   
                    <th>vlr total</th>
                    <th></th>
                    
                 
                </tr>
            </thead>
            <tbody>
                <%
                    for (PedidoVenda compra: lista) {
                %>
                <tr>
                    <td><%=compra.getCodigoPedido() %></td>
                    <td><%=compra.getDataVenda() %></td>
                    <td><%=compra.getPessoa().getNomePessoa() %></td>
                    <td><%=compra.getProduto().getNomeProduto()%></td>
                    <td><%=compra.getProduto().getVlrVenda()%></td>
                    <td><%=compra.getQtdProduto()%></td>
                    <td><%=compra.getVlrTotalVenda()%></td>
                    <td><a class="btn btn-danger"  href="CancelarVenda?codigoPedido=<%=compra.getCodigoPedido()%>">Cancelar Compra</a></td>
                    
                </tr>
                <%
                    }
                %>
            </tbody>
            
        </table> 
    </div>
</div>

<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/paginaLogin.jsp");
    }
%>