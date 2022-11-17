<%@page import="model.MontaBolo"%>
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
        <h3>Seus Bolos</h3>
    </div>   
    <div class="card-body">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>
        <hr/>
        <a class="btn btn-success" href="NovoBolo">Novo</a>
        <a class="btn btn-secondary" href="homeFuncionario.jsp">Voltar</a>
        <hr/>
        <% List<MontaBolo> lista = (List<MontaBolo>) request.getAttribute("bolo"); %>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Pessoa</th>
                    <th>Sabor</th>                   
                    <th>Cobertura</th>                 
                    <th>Recheio</th>
                    <th>Peso</th>
                    <th>Formato</th>
                    <th>Decoranacao</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (lista != null) {
                        for (MontaBolo bolo : lista) {
                %>
                <tr>
                    <td><%= bolo.getCodigoBolo()%></td>
                    <td><%= bolo.getPessoa().getNomePessoa()%></td>
                    <td><%= bolo.getSaborBolo().getSaborB()%></td>
                    <td><%= bolo.getCoberturaBolo().getCoberturaB()%></td>                    
                    <td><%= bolo.getRecheioBolo().getRecheioB()%></td>                    
                    <td><%= bolo.getPesoBolo().getPesoB()%></td>                    
                    <td><%= bolo.getFormatoBolo().getFormatoB()%></td>                    
                    <td><%= bolo.getDecoracao()%></td>                    
                    <td><a class="btn btn-info" href="ConsultarBolo?codigoBolo=<%= bolo.getCodigoBolo()%>">Alterar</a></td>
                    <td><a class="btn btn-danger" href="ExcluirBolo?codigoBolo=<%= bolo.getCodigoBolo()%>">Excluir</a></td>              
                </tr>
                <%
                        }
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