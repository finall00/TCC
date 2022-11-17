<%@page import="model.Cliente"%>
<%@page import="model.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ItensVenda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Produto"%>
<%
    ArrayList<ItensVenda> carrinho = (ArrayList<ItensVenda>) session.getAttribute("itensProduto");
    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Produtos-Detalhes</title>
        <link rel="stylesheet" href="Estilo/produtos.css">
        <link rel="stylesheet" href="Estilo/dropMenu.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
        <section>
            <header>
                <a href="ListarProduto"><img src="imagens/2ed7df50cadd44f1b9004c048d6a74df.png" alt="carregando.." class="logo"></a>

                <form action="PesquisarProduto" class="search-form">
                    <input type="search" id="pesquisarProduto" name="nomeProduto" placeholder="Pesquisar...">
                    <button id="btn-search" type="submit" class="bx bx-search"></button>
                </form>

                <nav>
                    <ul id="navbar">
                        <li><a href="ListarProduto">Home</a></li>
                        <li><a href="ListarProduto">Produtos</a></li>
                        <li style="display:inline-block;">
                            <a href="#"><span style="font-size: 1.7rem; color: black;" class='bx bxs-cart'></span>
                                <p id="quantCar"><%if (carrinho != null) {%><%=carrinho.size()%><%}%></p>                          
                            </a>
                        </li>
                        <a href="#" id="close"><i class='bx bx-x'></i> </a>
                    </ul>
                    <div class="action">
                        <div class="profile" onclick="menuToggle();">
                            <span id="dropIcon" class="material-icons icons-size">person</span>
                        </div>
                        <div class="menu">
                            <%if (cliente == null && funcionarios == null) {%>
                            <a href="paginaLogin.jsp" style="text-decoration: none; " ><h3>Faça Login</h3></a>
                            <%}%>
                            <%if (cliente != null) {%>
                            <h3>
                                <%=cliente.getNomePessoa()%>
                               
                            </h3>
                            <ul>
                                <li>
                                    <i class='bx bx-user'></i>
                                    <a href="ConsultarCliente?codigoCliente=<%=cliente.getCodigoPessoa()%>">Perfil</a>
                                </li>
                                <li>
                                    <i class='bx bx-cake'></i>
                                    <a href="NovoBolo">Montar seu bolo</a>
                                </li>
                                <li>
                                   <i class='bx bx-wallet' ></i>
                                    <a href="ConsultarCliente?codigoCliente=<%= cliente.getCodigoPessoa()%>">Minhas Compras</a>
                                </li>                                
                                <li>
                                    <i class='bx bx-log-out' ></i>
                                    <a href="Logout">Logout</a>
                                </li>
                            </ul>
                            <%}%>
                            <%if (funcionarios != null) {%>
                            <h3>
                                <%=funcionarios.getNomePessoa()%>
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
                                    <i class='bx bx-user'></i>
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


        <section id="prodeatils" class="section-p">

            <input hidden="" readonly="" type="text" id="codigoProduto" name="codigoProduto" value="${produto.codigoProduto}"/>

            <div class="single-img">
                <img src=" ${pageContext.request.contextPath}/imagens/${produto.imagem}" alt="Carregando.." width="100%" id="MainImg">    
            </div>

            <div class="single-details">
                <h5>${produto.dataValidade}</h5>
                <h4>${produto.nomeProduto}</h4>
                <h2>R$ ${produto.vlrVenda}</h2>               

                <input id="quantidade"  type="number" value="1" min="1" max="${produto.estoqueProduto}"/>

                <button onclick="add()">Adicionar ao carrinho</button>
                <h5>Estoque: ${produto.estoqueProduto}</h5>
                <h4>Detalhes do produto</h4>
                <span>${produto.descricaoProduto}</span>
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
        <script>
            function add() {
                let quant = document.querySelector('#quantidade').value;

                window.location.href = "addCarrinho?codigoProduto=${produto.codigoProduto}&vlrVenda=${produto.vlrVenda}&nomeProduto=${produto.nomeProduto}&estoqueProduto=${produto.estoqueProduto}&qtnProduto=" + quant;
            }

            $("input#quantidade").blur(
                    function quantReplace() {
                        let quant = document.querySelector('#quantidade').value;
                        let max = ${produto.estoqueProduto};
                        if (quant > max) {
                            $("input#quantidade").val(max);
                        } else if (quant < 1) {
                            $("input#quantidade").val(1);
                        }
                    });

        </script> 
        <script src="Scripts/prod.js"></script>
    </body>

    <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
</html>