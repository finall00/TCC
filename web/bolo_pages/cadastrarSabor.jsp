<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center">
        <h3>Cadastrar Sabor</h3>
    </div>
    <div class="card-body">

        <form action="CadastrarSaborB" method="post">
            <div class="row w-75 mx-auto">
                <div class="form-group col-6">

                    <label for="codigoSabor">Código:</label>
                    <input class="form-control" type="text" id="codigoSabor" name="codigoSabor" readonly value="${sabor.codigoSabor > 0 ? sabor.codigoSabor : ""}"/>
                </div>

                <div class="form-group col-6">
                    <label for="sabor">Sabor:</label>
                    <input class="form-control" type="text" id="saborB" name="saborB" placeholder="Nome" required value="${sabor.saborB}"/>
                </div>
               

            </div>
            <div class="row mt-3">
                <div class="form-group col-12 text-center">
                    <button class="btn btn-success" type="submit">Gravar</button>
                    <a class="btn btn-secondary" href="NovoBolo">Voltar</a>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>