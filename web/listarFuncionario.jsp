<%@page import="model.Funcionario" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionarios != null) {
%>
<jsp:include page="/cabecalho.jsp"/>

<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header">
        <h3>Funcionario</h3>
    </div>   
    <div class="card-body">
        <div role="alert">
            ${mensagem}
        </div>

        <% List<Funcionario> lista = (List<Funcionario>) request.getAttribute("funcionario"); %>
        <table class="table table-responsive">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>Cargo</th>                   
                    <th>CPF</th>                 
                    <th>Celular</th>
                    <th>Email</th>
                    <th>Sobre</th>
                    <th>Login</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Funcionario funcionario : lista) {
                %>
                <tr>
                    <td><%= funcionario.getCodigoPessoa()%></td>
                    <td><%= funcionario.getNomePessoa()%></td>
                    <td><%= funcionario.getCargo().getNomeCargo()%></td>
                    <td><%= funcionario.getCpfPessoa()%></td>
                    <td><%= funcionario.getCelularPessoa()%></td>
                    <td><%= funcionario.getEmailPessoa()%></td>
                    <td><%= funcionario.getObsFuncionario()%></td>
                    <td><%= funcionario.getLoginFuncionario()%></td>
                    <td><a class="btn btn-info" href="ConsultarFuncionario?codigoFuncionario=<%= funcionario.getCodigoPessoa()%>">Alterar</a></td>
                    <td><a class="btn btn-danger" href="ExcluirFuncionario?codigoFuncionario=<%= funcionario.getCodigoPessoa()%>">Excluir</a></td>              
                </tr>
                <%
                    }
                %>
            </tbody>           
        </table> 
        
        <a class="btn btn-success" href="NovoFuncionario">Novo</a>
        <input  class="btn btn-secondary" type="button" value="Voltar" onclick="history.go(-1)">
       
    </div>
</div>
<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>