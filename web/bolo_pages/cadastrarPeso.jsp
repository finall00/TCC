<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card" style="padding-top: 4rem; padding-bottom: 5rem">
    <div class="card-header text-center">
        <h3>Cadastrar Peso</h3>
    </div>
    <div class="card-body">

        <form action="CadastrarPesoB" method="post">
            <div class="row w-75 mx-auto">
                <div hidden="" class="form-group col-6">

                    <label for="codigoPesoB">Código:</label>
                    <input class="form-control" type="text" id="codigoPeso" name="codigoPeso" readonly value="${Peso.codigoPeso > 0 ? Peso.codigoPeso : ""}"/>
                </div>

                <div class="form-group col-12">
                    <label for="Peso">Peso:</label>
                    <input class="form-control" type="text" id="pesoB" name="pesoB" placeholder="Nome" required value="${peso.pesoB}"/>
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