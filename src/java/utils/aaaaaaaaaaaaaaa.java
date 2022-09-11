/*
--> colocar em todas as paginas
<%
    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
    if (cliente != null) {
%>

<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card mx-auto my-5" style="width: 30%;">
    <div class="card-header text-center">
        <h3>Acesso ao sistema</h3>
    </div>
    <div class="card-body">
        <form method="post" action="Login">
            <div>
                <label for="login">Login:</label>
                <input type="text" class="form-control" id="login" name="login" required placeholder="Login do usuário"/>
            </div>
            <div class="mt-3">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required placeholder="Senha do usuário"/>
            </div>
            <a href="NovoCliente">cadastrar</a>
            <div class="mt-3 text-center">
                <button class="btn btn-success" type="submit">Acessar</button>            
            </div>
           
        </form>
        <div class="text-center mt-3">
            <span class="text-danger">${mensagem}</span>
        </div>
    </div>
</div>
*/