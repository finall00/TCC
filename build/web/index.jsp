<%@page import="model.Funcionario"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario == null) {
%>
<div class="card">

<jsp:include page="/cabecalho.jsp"/>
    <div class="card-header text-center">
        <h3>Menu principal</h3>
    </div>
    <div class="card-body text-center">                   
        
        <a href="paginaLogin.jsp" class="btn btn-danger">login</a>      
        <a href="ListarProduto" class="btn btn-info">Produtos</a>      
        
      
    </div>
</div>
<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/homeFuncionario.jsp");
    }
%>


