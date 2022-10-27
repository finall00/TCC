<%@page import="model.Funcionario"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="card">
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
    if ( cliente != null||funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
    <div class="card-header text-center">
        <h3>Bem vindo, <%=cliente.getNomePessoa()%> </h3>
        <p>id da sessão <%=session.getId()%></p>
    </div>
    <div class="card-body text-center">                           
        <a href="ConsultarCliente?codigoCliente=<%= cliente.getCodigoPessoa()%>" class="btn btn-info">Clientes</a>  
        <a href="ListarContasPagar" class="btn btn-secondary">Contas à Pagar</a>        
        <a href="Logout" class="btn btn-danger">logout</a>     
        
      
    </div>
</div>
<jsp:include page="/rodape.jsp"/>

<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>