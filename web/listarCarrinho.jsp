<%@page import="model.Carrinho"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header">
        <h3>Pacientes</h3>
    </div>
    <div class="card-body">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>
        <hr/>
        
        <a class="btn btn-secondary" href="homeFuncionario.jsp">Voltar</a>
        <hr/>
        <% List<Carrinho> lista = (List<Carrinho>) request.getAttribute("Lprodutos"); %>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Iten</th>
                    <th>Numero</th>           
                    <th>Sub total</th>           
                    <th>Total</th>           
                </tr>
            </thead>
            <tbody>
                <%
                    for (Carrinho carrinho : lista) {                                                  
                %>
                <tr>                 
                    
                    <td><%= carrinho.getNumeroDoItem()%></td>
                    <td><%= carrinho.getSubTotal()%></td>
                    <td><%= carrinho.getTotal()%></td>
                                                                               
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/rodape.jsp"/>
