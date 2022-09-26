<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center">
        <h3>Cadastrar Cobertura</h3>
    </div>
    <div class="card-body">

        <form action="CadastrarCoberturaB" method="post">
            <div class="row w-75 mx-auto">
                <div hidden="" class="form-group col-6">
                    <label for="codigoCobertura">Código:</label>
                    <input class="form-control" type="text" id="codigoCobertura" name="codigoCobertura" readonly value="${cobertura.codigoCobertura > 0 ? cobertura.codigoCobertura : ""}"/>
                </div>

                <div class="form-group col-12">
                    <label for="Cobertura">Cobertura:</label>
                    <input class="form-control" type="text" id="coberturaB" name="coberturaB" placeholder="Nome" required value="${cobertura.coberturaB}"/>
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