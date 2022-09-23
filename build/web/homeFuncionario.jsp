<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="card">
    <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
    <div class="card-header text-center">
       
    </div>
    <div class="card-body text-center">
        <p> seja bem vindo, <%= funcionario.getNomePessoa()%> </p>
        <p> seja bem vindo, <%= session.getId()%> </p>
       <a href="ListarCargo" class="btn btn-primary">Cargos</a>      
        <a href="ListarProduto" class="btn btn-dark">Produtos</a>
        <a href="ListarCliente" class="btn btn-info">Clientes</a>
        <a href="ListarFuncionario" class="btn btn-secondary">Funcionarios</a>
        <a href="ListarContasPagar" class="btn btn-secondary">Contas à Pagar</a>
        <a href="ListarFornecedor" class="btn btn-danger">Fornecedores</a>
        <a href="Logout" class="btn btn-danger">logout</a>
        <a href="home.jsp" class="btn btn-danger">home</a>
        <a href="NovoBolo" class="btn btn-danger">Montar seu Bolo</a>
        <a href="NovoPesoB" class="btn btn-danger">peso</a>
        
    </div>
       <div class="card-body text-center">
        <a href="NovoPesoB" class="btn btn-danger">peso</a>   
        <a href="NovoRecheioB" class="btn btn-danger">Recheio</a>   
        <a href="NovoFormatoB" class="btn btn-danger">Formato</a>   
        <a href="NovaCoberturaB" class="btn btn-danger">Cobertura</a>   
        <a href="NovoSaborB" class="btn btn-danger">Sabor</a>   
           
       </div>
</div>
<jsp:include page="/rodape.jsp"/>




<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>