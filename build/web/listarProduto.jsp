<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ItensVenda"%>
<%@page import="model.Funcionario"%>
<%@page import="dao.itensBoloDAO"%>
<%@page import="model.Produto"%>    
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<ItensVenda> carrinho = (ArrayList<ItensVenda>) session.getAttribute("itensProduto");
    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
    List<Produto> lista = (List<Produto>) request.getAttribute("produto");
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Produtos</title>

        <link rel="stylesheet" href="Estilo/ListarProdutos.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    </head>
    <body>

        <header class="header">
            <div class="header-1">
                <div class="logo">
                    <img src="imagens/Captura de Tela (11).png" alt="">
                    <a href="#">Confeitaria</a>
                </div>
                <form action="PesquisarProduto" class="search-form">
                    <input type="search" id="pesquisaProduto" name="nomeProduto" placeholder="Pesquisar...">
                  <button type="submit" class="fas fa-search"></button>
                </form>

                <div class="icons">
                    <a href="ListarItensCarrinho" class="fas fa-shopping-cart"></a>
                    <a href="Login" class="fas fa-user"></a>
                    

                    <% if (cliente != null) {%><a href="homeCliente.jsp" class="botao">Menu</a> 
                    <%} else if (funcionarios != null) {%> <a href="homeFuncionario.jsp" class="botao">Menu</a><%}%>
                    
                    
                </div>
            </div>
        </header>   

        <div class="mensagem" style="display: flex; align-items:center; ">
            <p style="align-items: end;">${mensagem}</p>
           
        </div>


        <div class="container">

            <main>

                <div class="todo-produto">
                    <%  if (lista != null) {
                            for (Produto produto : lista) {
                    %>
                    <div class="card">
                        <div class="carrinho-logo" style="border-color: black">
                            <a  href="addCarrinho?codigoProduto=<%=produto.getCodigoProduto()%>&qtnProduto=1&vlrVenda=<%= produto.getVlrVenda()%>&nomeProduto=<%= produto.getNomeProduto()%>&estoqueProduto=<%= produto.getEstoqueProduto()%>"><i class='fas fa-shopping-cart'>+</i></a>
                        </div>

                        <div class="img-produto">
                            <img class="imagen" src="<%= (String) request.getContextPath() + "/imagens/" + produto.getImagem()%>" alt="">
                        </div>

                        <div class="detalhes">
                            <span hidden="" class="nome"><%= produto.getCodigoProduto()%></span>

                            <span class="nome"><%= produto.getNomeProduto()%></span>
                            <p class="obsProduto"><%= produto.getDescricaoProduto()%></p>
                        </div>

                        <div class="info">
                            <div class="data">
                                <span class="num-letra">Data de Validade:</span>
                                <span class="num-letra" style="font-size:1.5rem; color: black;"><%= produto.getDataValidade()%></span>
                            </div>
                            <div class="preco">
                                <span class="num-preco">R$ <%= produto.getVlrVenda()%></span>
                            </div>
                        </div>

                        <div style="margin: 10px">
                            <a href="AlterarProduto?codigoProduto=<%= produto.getCodigoProduto()%>" class="btn-info">mais
                                info</a>
                            <a href="ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>"class="btn-comprar">comprar</a>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>

                </div>
            </main>
        </div>

    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
</html>
