<%@page import="java.util.ArrayList"%>
<%@page import="model.ItensVenda"%>
<%@page import="model.Funcionario"%>
<%@page import="dao.itensBoloDAO"%>
<%@page import="model.Produto"%>    
<%@page import="java.util.List"%>
<%
    ArrayList<ItensVenda> carrinho = (ArrayList<ItensVenda>) session.getAttribute("itensProduto");

    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
//    if (funcionarios != null) {
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Produtos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="Estilo/style.css">
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
        <div >
            <div class="button-form">
            </div>
            <h2>${erro}</h2>
            <%            for (Produto produto : lista) {
            %>
            <div class="card">
                <div class="carrinho-logo" style="border-color: black">
                    <img style="border-radius: 50%;"  src="imagens/Captura de Tela (11).png" alt="logo teste">
                    <a  href="addCarrinho?codigoProduto=<%=produto.getCodigoProduto()%>&qtnProduto=1&vlrVenda=<%= produto.getVlrVenda()%>&nomeProduto=<%= produto.getNomeProduto()%>&estoqueProduto=<%= produto.getEstoqueProduto()%>" ><i class='bx bxs-cart-add'></i></a>
                </div>

                
                    <img class="imagen" style="border-radius: 10px" src="<%= (String) request.getContextPath() + "/imagens/" + produto.getImagem()%>">


                <div class="detalhes">
                    <span hidden="" class="nome" ><%= produto.getCodigoProduto()%></span>
                    <span class="nome" ><%= produto.getNomeProduto()%></span>
                    <p class="obsProduto"><%= produto.getDescricaoProduto()%></p>
                </div>

                <div class="preco">
                    <span class="num-preco">R$<%= produto.getVlrVenda()%></span>
                    <span class="num-letra"><%= produto.getDataValidade()%></span>
                </div>

                <div style="margin: 10px">
                <a href="AlterarProduto?codigoProduto=<%= produto.getCodigoProduto()%>" class="btn btn-primary">mais info</a>
                <a href="ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>" class="btn btn-primary">comprar</a>
                </div>
            </div>

            <%
                    }
                }
            %>



        </div>
        <div style="margin: 10px">
            <a class="btn btn-primary" href="Login" > login</a>
       
            <a class="btn btn-primary" href="homeFuncionario.jsp">Menu</a>            
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
    <%
//        } else {
//            response.sendRedirect(request.getContextPath() + "/");
//        }
    %>
</html>