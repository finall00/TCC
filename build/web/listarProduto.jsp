<%@page import="model.Funcionario"%>
<%@page import="dao.itensBoloDAO"%>
<%@page import="model.Produto"%>    
<%@page import="java.util.List"%>
<%

    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionarios != null) {
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Produtos</title>
        <link rel="stylesheet" href="Estilos/style.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

    </head>

    <form action="PesquisarProduto">
        <label for="nomeProduto">nome Produto:</label>
        <input class="form-control" type="text" id="pesquisaProduto" name="nomeProduto" placeholder="Nome" />

        <input type="submit" value="Pesquisar">
        <br>
        <a href="ListarItensCarrinho">listar carrinho</a>
    </form>  
    <%
        List<Produto> lista = (List<Produto>) request.getAttribute("produto");

        if (lista == null) {
    %>

    <div class="alert alert-primary" role="alert">
        <br>
        <br>
        <br>  
        ${mensagem}
    </div>
    <%
    } else {
    %>

    <body>
        <div class="button-form">
        </div>
        <h2>${erro}</h2>
        <%            for (Produto produto : lista) {
        %>
        <div class="card">
            <div class="carrinho-logo">
                <img src="" alt="logo teste ">
                <i class='bx bxs-cart-add'></i> 
            </div>
            <div class="produto">

                <img src="<%= (String) request.getContextPath() + "/imagems/" + produto.getImagem()%>">
            </div>

            <div class="detalhes">
                <span hidden="" class="nome" ><%= produto.getCodigoProduto()%></span>
                <span class="nome" ><%= produto.getNomeProduto()%></span>
                <p class="obsProduto"><%= produto.getDescricaoProduto()%></p>
            </div>

            <div class="preco">
                <span class="num-preco">R$<%= produto.getVlrVenda()%></span>
                <span class="num-letra"><%= produto.getDataValidade()%></span>
            </div>
          
                
                <a href="ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>" class="btn btn-primary">mais info</a>
                <a href="ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>"" class="btn btn-primary">comprar</a>
            </div>
        </div>
        <%
                }
            }
        %>

        

        <div class="button">
            <a href="homeFuncionario.jsp">Menu</a>            
        </div>

    </body>
    <script src="Scripts/PesquisarProduto.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    %>
</html>