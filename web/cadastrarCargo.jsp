<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center">
        <h3>Cadastrar Cargo</h3>
    </div>
    <div class="card-body">

        <form action="CadastrarCargo" method="post">
            <div class="row w-75 mx-auto">
                <div class="form-group col-6">

                    <label for="codigoCargo">Código:</label>
                    <input class="form-control" type="text" id="codigoCargo" name="codigoCargo" readonly value="${cargo.codigoCargo > 0 ? cargo.codigoCargo : ""}"/>
                </div>

                <div class="form-group col-6">
                    <label for="nomeCargo">Nome Cargo:</label>
                    <input class="form-control" type="text" id="nomeCargo" name="nomeCargo" placeholder="Nome" required value="${cargo.nomeCargo}"/>
                </div>
                <div class="form-group col-6">
                    <label for="decoracao">Descreva a decoracao:</label>
                    <input class="form-control" type="text" id="decoracao" name="decoracao" placeholder="Nome" />
                </div>

            </div>
            <div class="row mt-3">
                <div class="form-group col-12 text-center">
                    <button class="btn btn-success" type="submit">Gravar</button>
                    <a class="btn btn-secondary" href="ListarCargo">Voltar</a>
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