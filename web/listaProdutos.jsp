<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>

<div class="card-header text-center">
    <div class="card-header" style="background: #ff968a;">
        <h3 style="color: white">Listar Produto</h3> 
    </div>
    <div class="card-body">
        <div class="alert alert-primary" role="alert" style="background:#ffd8be; border: 1px solid #ffd8be">
            ${mensagem}
        </div>

        <hr/>
        <a style="background: #ff968a ; border: 1px solid #ff968a" class="btn btn-dark" href="NovoProduto">Novo</a>
        <input style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-info" type="button" value="Voltar" onclick="history.go(-1)">
        
        <hr/>
        
        <% List<Produto> lista = (List<Produto>) request.getAttribute("produto");%>
        
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Imagem</th>
                    <th>Código</th>
                    <th>Nome Produto</th>                                 
                    <th>Data de Validade</th>
                    <th>Estoque</th>
                    <th>Valor de Custo</th>
                    <th>Valor de Venda</th>
                    <th>codigo de Barra</th>
                    <th>Descrição Produto</th>                   
                    <th colspan="2">Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Produto produto : lista) {
                %>
                <tr>
                    <td><img src="<%= (String) request.getContextPath() + "/imagens/" + produto.getImagem()%>" style=" border-radius: 4px;  padding: 5px;  width: 150px;"></td>
                    <td><%= produto.getCodigoProduto()%></td>
                    <td><%= produto.getNomeProduto()%></td>
                    <td><%= produto.getDataValidade()%></td>
                    <td><%= produto.getEstoqueProduto()%> - Unidades</td>
                    <td>R$ <%=produto.getVlrCusto()%></td>
                    <td>R$ <%=produto.getVlrVenda()%></td>
                    <td><%= produto.getCodigoBarra()%></td>
                    <td><%= produto.getDescricaoProduto()%></td>
                    <td><a style="background: #ff968a ; border: 1px solid #ff968a" class="btn btn-success" href="ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>">Alterar</a></td>
                    <td><a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-danger" href="ExcluirProduto?codigoProduto=<%= produto.getCodigoProduto()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</div>
<jsp:include page="/rodape.jsp"/>            