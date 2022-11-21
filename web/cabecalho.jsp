<%@page import="java.util.ArrayList"%>
<%@page import="model.ItensVenda"%>
<%@page import="model.Cliente"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
    ArrayList<ItensVenda> carrinho = (ArrayList<ItensVenda>) session.getAttribute("itensProduto");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confeitaria</title>
        <!--fonts-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,600&display=swap" rel="stylesheet" />
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="Estilo/cabeçalho-rodape.css"/>
        <link rel="stylesheet" href="Estilo/dropMenu.css"/>
    </head>
    <body>
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