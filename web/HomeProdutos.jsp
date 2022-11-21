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
        <link rel="stylesheet" href="Estilo/produtos.css">
        <link rel="stylesheet" href="Estilo/dropMenu.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>
        <section>
            <header>
                <a href="ListarProduto"><img src="imagens/logo.png" alt="" class="logo"></a>

                <form action="PesquisarProduto" class="search-form">
                    <input type="search" id="pesquisarProduto" name="nomeProduto" placeholder="Pesquisar...">
                    <button id="btn-search" type="submit" class="bx bx-search"></button>
                </form>

                <nav>
                    <ul id="navbar">
                        <li><a href="ListarProduto">Home</a></li>

                        <li style="display:inline-block;">
                            <a href="ListarItensCarrinho"><span style="font-size: 1.7rem; color:var(--color-dark);" class='bx bxs-cart'></span>
                                <p id="quantCar"><%if (carrinho != null) {%><%=carrinho.size()%><%}%></p>
                            </a>
                        </li>
                    </ul>

                    <div class="action">
                        <div class="profile" onclick="menuToggle();">
                            <i id="dropIcon" class='bx bxs-user'></i>
                        </div>
                        <div class="menu">
                            <%if (cliente == null && funcionarios == null) {%>
                            <a href="paginaLogin.jsp" style="text-decoration: none; " ><h3>Faça Login</h3></a>
                            <%}%>
                            <%if (cliente != null) {%>
                            <h3>
                                <%=cliente.getLoginCliente()%>                        
                            </h3>
                            <ul>
                                <li>
                                    <i class='bx bx-user'></i>
                                    <a href="ConsultarCliente?codigoCliente=<%=cliente.getCodigoPessoa()%>">Perfil</a>
                                </li>
                                <li>
                                    <i class='bx bx-cake' ></i>
                                    <a href="NovoBolo">Montar seu bolo</a>
                                </li>
                                <li>
                                    <i class='bx bx-wallet' ></i>
                                    <a href="ConsultarCompra">Minhas Compras</a>
                                </li>  
                                <li>
                                    <i class='bx bx-log-out' ></i>
                                    <a href="Logout">Logout</a>
                                </li>
                            </ul>
                            <%}%>
                            <%if (funcionarios != null) {%>
                            <h3>
                                <%=funcionarios.getLoginFuncionario()%>
                                <div>
                                    <%=funcionarios.getCargo().getNomeCargo()%>
                                </div>
                            </h3>
                            <ul>
                                <li>
                                    <i class='bx bx-user'></i>
                                    <a href="ConsultarFuncionario?codigoFuncionario=<%=funcionarios.getCodigoPessoa()%>">Perfil</a>
                                </li>
                                <li>
                                    <i class='bx bx-menu' ></i>
                                    <a href="homeFuncionario.jsp">Menu Funcionario</a>
                                </li>
                                <li>
                                    <i class='bx bx-log-out' ></i>
                                    <a href="Logout">Logout</a>
                                </li>
                            </ul>
                            <%}%>

                        </div>
                    </div>
                </nav>

                <div id="mobile">
                    <i class='bx bx-menu' id="bar"></i>
                </div>
            </header>
        </section>

        <section id="hero">
            <h4>Melhores Preços</h4>
            <h2>E super promoções</h2>
            <h1>Em todos os prodrutos</h1>
        </section>
        <section id="prod1" class="section-p">


            <h2>Produtos Disponiveis</h2>
            <p>Os melhores bolos e doces você encontra aqui</p>
            <p style="font-size: 20px; color: red;">${mensagem}</p>

            <div class="container-pro">
                <%  if (lista != null) {
                        for (Produto produto : lista) {
                %>
                <%if (cliente != null) {%>
                <div class="pro" onclick="window.location.href = 'ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>'">
                    <%}%> 

                    <%if (funcionarios != null) {%>
                    <div class="pro" onclick="window.location.href = 'AlterarProduto?codigoProduto=<%=produto.getCodigoProduto()%>'">

                        <%}
                            if (funcionarios == null && cliente == null) {%>
                        <div class="pro" onclick="window.location.href = 'ConsultarProduto?codigoProduto=<%=produto.getCodigoProduto()%>'">
                            <%}%>

                            <span hidden="" class="nome"><%= produto.getCodigoProduto()%></span>
                            <img src="<%= (String) request.getContextPath() + "/imagens/" + produto.getImagem()%>" alt="Carregar...">
                            <div class="des">
                                <span><%=produto.getEstoqueProduto()%>(estoque)</span>
                                <h5><%=produto.getNomeProduto()%></h5>
                                <h4>R$<%=produto.getVlrVenda()%></h4>
                            </div>
                            <a href="addCarrinho?codigoProduto=<%=produto.getCodigoProduto()%>&qtnProduto=1&imagem=<%=produto.getImagem()%>&vlrVenda=<%= produto.getVlrVenda()%>&nomeProduto=<%= produto.getNomeProduto()%>&estoqueProduto=<%= produto.getEstoqueProduto()%>"><i class='bx bx-cart cart'></i></a>
                        </div>
                        <%}
                            }%>

                    </div>
                    </section>

                    <footer class="section-p">
                        <div class="footer-con">
                            <h3>Projeto Confeitaria</h3>
                            <p>Alguma coisa para prencher aqui dps eu vejo</p>
                            <ul class="socials">
                                <li><a href=""><i class='bx bxl-instagram'></i></a></li>
                                <li><a href=""><i class='bx bxl-whatsapp'></i></a></li>
                                <li><a href=""><i class='bx bxl-facebook'></i></a></li>
                            </ul>
                        </div>
                        <div class="footer-bottom">
                            <p>Todos os direitos reservados a &copy;2022 Projeto Confeitaria </p>
                        </div>
                    </footer>


                    <script src="Scripts/prod.js"></script>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    </body>

                    </html>