<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center" >
        <h3>Cadastrar Cargo</h3>
    </div>
    <div class="card-body" style="padding-bottom: 10rem;">

        <form action="CadastrarCargo" method="post">
            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                   <input type="text" hidden="" name="out" id="out" value="volta">
                    <label for="codigoCargo">Código:</label>
                    <input class="form-control" type="text" id="codigoCargo" name="codigoCargo" readonly value="${cargo.codigoCargo > 0 ? cargo.codigoCargo : ""}"/>
                </div>

                <div class="form-group col-6">
                    <label for="nomeCargo">Nome Cargo:</label>
                    <input class="form-control" type="text" id="nomeCargo" name="nomeCargo" placeholder="Nome" required value="${cargo.nomeCargo}"/>
                </div>
                <div class="form-group col-6">
                    <label for="descCargo">Função:</label>
                    <input class="form-control" type="text" id="descCargo" name="descCargo" placeholder="Nome"  required value="${cargo.descCargo}"/>
                </div>

            </div>
            <div class="row mt-3">
                <div class="form-group col-12 text-center">
                    <button style="background: #ff968a ; border: 1px solid #ff968a" class="btn btn-success" type="submit">Gravar</button>
                    <a href="ListarCargo" style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn" >Voltar</a>
                    
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