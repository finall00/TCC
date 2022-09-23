<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center">
        <h3>Cadastrar Peso</h3>
    </div>
    <div class="card-body">

        <form action="CadastrarRecheioB" method="post">
            <div class="row w-75 mx-auto">
                <div class="form-group col-6">

                    <label for="codigoRecheio">Código:</label>
                    <input class="form-control" type="text" id="codigoRecheio" name="codigoRecheio" readonly value="${Peso.codigoRecheio > 0 ? Peso.codigoRecheio : ""}"/>
                </div>

                <div class="form-group col-6">
                    <label for="Recheio">Recheioo:</label>
                    <input class="form-control" type="text" id="recheioB" name="recheioB" placeholder="Nome" required value="${recheio.recheioB}"/>
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