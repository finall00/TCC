<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Cargo"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
<div class="w-75 mx-auto">
    <h3 class="text-center">Listagem de Cargos</h3>
    
    
    <table class="table text-center">
        <thead>
            <tr>
                
                <th>Nome</th>
                <th>Descrição</th>
                <th colspan="2">Ações</th>
            </tr>
        </thead>
        <%
            List<Cargo> lista = (List<Cargo>) request.getAttribute("cargo");
        %>
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
        
        
    <div class="row my-3">
        <div class="form-group col-12 text-center">
            <a href="NovoCargo" class="btn btn-primary">Novo Cargo</a>
            <a href="homeFuncionario.jsp" class="btn btn-secondary">Voltar</a>
        </div>
    </div>
    <p class="text-center">${mensagem}</p>
</div>
<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>