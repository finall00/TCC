<%@page import="model.MontaBolo"%>
<%@page import="model.Funcionario" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    
%>
<jsp:include page="/cabecalho.jsp"/>

<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header" style="background: #ff968a;">
        <h3 style="color: white">Seus Bolos</h3>
    </div>   
    <div class="card-body">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>


        <% List<MontaBolo> lista = (List<MontaBolo>) request.getAttribute("bolo"); %>
        <table class="table ">
            <thead>
                <tr>                 
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
                    <td><%= bolo.getSaborBolo().getSaborB()%></td>
                    <td><%= bolo.getCoberturaBolo().getCoberturaB()%></td>                    
                    <td><%= bolo.getRecheioBolo().getRecheioB()%></td>                    
                    <td><%= bolo.getPesoBolo().getPesoB()%></td>                    
                    <td><%= bolo.getFormatoBolo().getFormatoB()%></td>                    
                    <td><%= bolo.getDecoracao()%></td>                    
                    <td><a style="background: #ff968a ; border: 1px solid #ff968a" class="btn btn-success" href="ConsultarBolo?codigoBolo=<%= bolo.getCodigoBolo()%>">Alterar</a></td>
                    <td><a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-danger" href="ExcluirBolo?codigoBolo=<%= bolo.getCodigoBolo()%>">Excluir</a></td>              
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <br>
        <a class="btn btn-success" href="NovoBolo">Novo</a>
        <input  class="btn btn-secondary" type="button" value="Voltar" onclick="history.go(-1)">
    </div>
</div>
<jsp:include page="/rodape.jsp"/>
