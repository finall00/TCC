<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Cargo"%>
<%

    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>

<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header">
        <h3>Cargos</h3>
    </div>   
    <div class="card-body">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>
        <hr/>
        <a href="cadastrarCargo.jsp" class="btn btn-primary">Novo Cargo</a>
        <a href="homeFuncionario.jsp" class="btn btn-secondary">Voltar</a><hr/>
        <% List<Cargo> lista = (List<Cargo>) request.getAttribute("cargo");%>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th colspan="2">Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Cargo cargo : lista) {
                %>
                <tr>
                    <td><%= cargo.getCodigoCargo()%></td>
                    <td><%= cargo.getNomeCargo()%></td>
                    <td><%= cargo.getDescCargo()%></td>
                    <td><a href="ConsultarCargo?codigoCargo=<%= cargo.getCodigoCargo()%>" class="btn btn-info">Alterar</a></td>
                    <td><a href="ExcluirCargo?codigoCargo=<%= cargo.getCodigoCargo()%>" class="btn btn-danger">Excluir</a></td>

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
        response.sendRedirect(request.getContextPath() + "/");
    }
%>