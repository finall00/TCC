<%@page import="model.Funcionario"%>
<%@page import="model.Cliente" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>

<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header">
        <h3>Clientes</h3>
    </div>   
    <div class="card-body">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>
        <hr/>
        <a class="btn btn-success" href="cadastrarCliente.jsp">Novo</a>
        <a class="btn btn-secondary" href="homeFuncionario.jsp">Voltar</a>
        <hr/>
        <% List<Cliente> lista = (List<Cliente>) request.getAttribute("cliente"); %>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>Data de Nascimento</th>
                    <th>CPF</th>                  
                    <th>Celular</th>
                    <th>Email</th>                   
                    <th>Sobre</th>
                    <th>Login</th>
                 
                </tr>
            </thead>
            <tbody>
                <%
                    for (Cliente cliente : lista) {
                %>
                <tr>
                    <td><%= cliente.getCodigoPessoa()%></td>
                    <td><%= cliente.getNomePessoa()%></td>
                    <td><%= cliente.getDataNascimento()%></td>
                    <td><%= cliente.getCpfPessoa()%></td>               
                    <td><%= cliente.getCelularPessoa()%></td>
                    <td><%= cliente.getEmailPessoa()%></td>
                    <td><%= cliente.getObsCliente()%></td>
                    <td><%= cliente.getLoginCliente()%></td>
                    <td><a class="btn btn-info" href="ConsultarCliente?codigoCliente=<%= cliente.getCodigoPessoa()%>">Alterar</a></td>
                    <td><a class="btn btn-danger" href="ExcluirCliente?codigoCliente=<%= cliente.getCodigoPessoa()%>">Excluir</a></td>              
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
