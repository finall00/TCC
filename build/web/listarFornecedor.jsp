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
    <div class="card-header" style="background: #ff968a;">
        <h3 style="color: white">Fornecedor</h3>
    </div>   
    <div class="card-body">
        <div class="alert alert-primary" role="alert" style="background:#ffd8be; border: 1px solid #ffd8be">
            ${mensagem}
        </div>
        <hr/>
        <a style="background: #ff968a ; border: 1px solid #ff968a" class="btn btn-success" href="NovoFornecedor">Novo</a>
        <a class="btn btn-secondary" href="ListarCompra">Voltar</a>
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
                    
                    <td><a style="background: #ff968a ; border: 1px solid #ff968a; color: white" class="btn btn-info" href="ConsultarFornecedor?codigoFornecedor=<%= fornecedor.getCodigoPessoa()%>">Alterar</a></td>
                    <td><a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-danger" href="ExcluirFornecedor?codigoFornecedor=<%= fornecedor.getCodigoPessoa()%>">Excluir</a></td>              
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
