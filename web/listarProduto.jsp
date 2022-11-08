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
        <link rel="stylesheet" href="Estilo/dropMenu.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    </head>
    <body>

        <header class="header">
            <div class="header-1">
                <div class="logo">
                    <img style="boder-radius: 50px; border: #ccffff; " src="" alt="">
                    <a href="#">Confeitaria</a>
                </div>
                <form action="PesquisarProduto" class="search-form">
                    <input type="search" id="pesquisaProduto" name="nomeProduto" placeholder="Pesquisar...">
                    <button type="submit" class="fas fa-search"></button>
                </form>

                <div class="icons">
                    <a href="ListarItensCarrinho" class="fas fa-shopping-cart"></a>
                    <div class="action">
                        <div id="divU" class="profile" onclick="menuToggle();">
                            <a id="login-btn" class="fas fa-user"></a>
                        </div>
                        <div class="menu">
                            <%if (cliente == null && funcionarios == null) {%>
                            <a href="Login"><h3>Faça Login</h3></a>
                            <%}%>

                            <%if (cliente != null) {%>
                            <h3><%=cliente.getNomePessoa()%></h3>
                            <ul>
                                <li>
                                    <a href="ConsultarCliente?codigoCliente=<%=cliente.getCodigoPessoa()%>">
                                        <span class="icon">
                                            <ion-icon class="fas fa-user"></ion-icon>
                                        </span>
                                        <span>perfil</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="homeCliente.jsp" class="botao">
                                        <span class="icon">
                                            <ion-icon class="fas fa-bars"</ion-icon>
                                        </span>
                                        <span>Menu</span>
                                    </a>
                                </li>
                            </ul>
                            <a href="Logout"><h3>logout</h3></a>
                            <% }
                                if (funcionarios != null) {%>

                            <h3><%= funcionarios.getNomePessoa()%><br/><span><%= funcionarios.getCargo().getNomeCargo()%></span></h3>

                            <ul>
                                <li>
                                    <a href="ConsultarFuncionario?codigoFuncionario=<%=funcionarios.getCodigoPessoa()%>">
                                        <span class="icon">
                                            <ion-icon class="fas fa-user"></ion-icon>
                                        </span>
                                        <span>perfil</span>
                                    </a>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <a href="homeFuncionario.jsp"> <!-- mudar para ListarCompra -->
                                        <span class="icon">
                                            <ion-icon class="fas fa-bars"></ion-icon>
                                        </span>
                                        <span>Menu</span>
                                    </a>
                                </li>
                            </ul>

                            <a href="Logout" class="login"><h3>logout</h3></a>
                            <%}%>         

                        </div>
                    </div>


                </div>
            </div>
        </header>   

        <div class="mensagem" style="display: flex; align-items:center; ">
            <p style="font-size: 2rem; text-decoration: none; color: black; margin: 30px; margin-left: 58rem; ">${mensagem}</p>

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

                        <div style="margin-top: 4rem">
                            <% if (funcionarios != null) {%>
                            <a href="AlterarProduto?codigoProduto=<%= produto.getCodigoProduto()%>" class="btn-info">mais
                                info</a>
                                
                                <%} else {%>  
                           
                            <a href="ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>"class="btn-comprar">comprar</a>
                            <%}%>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>

                </div>
            </main>
        </div>
        <script>
            function menuToggle() {
                const toggleMenu = document.querySelector(".menu");
                toggleMenu.classList.toggle("active");
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>

        <footer>

        </footer>
        <!--maskara do git--> 
        <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
        <!--script de buscar pessoa-->
        <script src="${pageContext.request.contextPath}/Scripts/PesquisarPessoa.js"></script> 
    </body>
</html>