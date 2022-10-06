<%@page import="model.Funcionario"%>
<%@page import="model.Fornecedor"%>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
 
<div class="card my-5 text-center w-75 mx-auto">
    <div class="card-header">
        <h3>Fornecedor</h3>
    </div>   
    <div class="card-body">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>
        <hr/>
        <a class="btn btn-success" href="NovoFornecedor">Novo</a>
        <a class="btn btn-secondary" href="homeFuncionario.jsp">Voltar</a>
        <hr/>
        <% List<Fornecedor> lista = (List<Fornecedor>) request.getAttribute("fornecedor"); %>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>CPF</th>                                                       
                    <th>Celular</th>                   
                    <th>Email</th>
                    <th>Contato</th>
                    <th>Sobre</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Fornecedor fornecedor : lista) {
                %>
               <tr>
                    <td><%= fornecedor.getCodigoPessoa()%></td>
                    <td><%= fornecedor.getNomePessoa()%></td>
                    <td><%= fornecedor.getCpfPessoa()%></td>
                    <td><%= fornecedor.getCelularPessoa()%></td>                  
                    <td><%= fornecedor.getEmailPessoa()%></td>
                    <td><%= fornecedor.getContatoVendedor()%></td>
                    <td><%= fornecedor.getObsFornecedor()%></td>
                    
                    <td><a class="btn btn-info" href="ConsultarFornecedor?codigoFornecedor=<%= fornecedor.getCodigoPessoa()%>">Alterar</a></td>
                    <td><a class="btn btn-danger" href="ExcluirFornecedor?codigoFornecedor=<%= fornecedor.getCodigoPessoa()%>">Excluir</a></td>              
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
