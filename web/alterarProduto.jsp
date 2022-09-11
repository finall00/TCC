<%@page import="model.Produto"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center">
        <h3>Cadastrar produto</h3>
    </div>
    <div class="card-body">
        <form action="CadastrarProduto" method="post">
            <%
            Produto produto = (Produto) request.getAttribute("produto");
            %>
            
            
            <div class="row w-75 mx-auto">     
                <div class="form-group col-6">
                    <label for="codigoProduto">Código:</label>
                    <input class="form-control" type="text" id="codigoProduto" name="codigoProduto" readonly value="${produto.codigoProduto > 0 ? produto.codigoProduto : ""}"/>
                </div>

                <div class="form-group col-6">
                    <label for="nomeProduto">Nome:</label>
                    <input class="form-control" type="text" id="nomeProduto" name="nomeProduto" placeholder="Nome" required value="${produto.nomeProduto}"/>
                </div>
            </div>

            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                    <label for="dataValidade">Data de Validade:</label>
                    <input class="form-control" type="date" id="dataValidade" name="dataValidade" required value="${produto.dataValidade}"/>
                </div>

                <div class="form-group col-6">
                    <label for="estoqueProduto">Estoque:</label>
                    <input  class="form-control"  min="0" type="number" id="estoqueProduto" name="estoqueProduto"  required value="${produto.estoqueProduto}"/>
                </div>



            </div>
            <div class="row w-75 mx-auto"> 
                <div class="form-group col-6">
                    <label for="vlrCusto">Valor de Custo:</label>
                    <input class="form-control"    type="text" id="vlrCusto" name="vlrCusto" required value="${produto.vlrCusto}"/>
                </div>                              
                <div class="form-group col-6">
                    <label for="vlrVenda">Valor de Venda:</label>
                    <input class="form-control"   type="text" id="vlrVenda" name="vlrVenda" required value="${produto.vlrVenda}"/>
                </div>  
            </div>



            <div class="row w-75 mx-auto">              

                <div class="form-group col-6">
                    <label for="codigoBarra">Código de Barra:</label>
                    <input class="form-control" type="text" id="codigoBarra" name="codigoBarra"  value="${produto.codigoBarra}"/>
                </div>
                <div class="form-group col-6">
                    <label for="descricaoProduto">Descricao do Produto:</label>
                    <input class="form-control" type="text" id="descricaoProduto" name="descricaoProduto"  required value="${produto.descricaoProduto}"/>
                </div>
            </div>
            <div class="row w-75 mx-auto">  
                <div class="row mt-3">
                    <div class="form-group col-12 text-center">
                        <button class="btn btn-success" type="submit">Gravar</button>
                        <a class="btn btn-secondary" href="ListarProduto">Voltar</a>
                        <a class="btn btn-danger" href="ExcluirProduto?codigoProduto=<%= produto.getCodigoProduto() %>">Excluir</a>
                        
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="/rodape.jsp"/>