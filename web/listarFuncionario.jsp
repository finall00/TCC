<%@page import="model.Funcionario" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionario != null) {
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar funcionario</title>
    <link rel="stylesheet" href="EstilosFunc/dash.css">
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>


</head>

<body>
    <a href="ListarProduto" class="goWebpage">
        <i class='bx bxs-store-alt'></i>
    </a>

    <div class="containerrr">
        <aside>
            <div class="top">
                <a href="ListarProduto">
                    <div class="logo">
                        <img src="imgSistema/logo.png" alt="">

                    </div>
                </a>

                <div class="close" id="btn-close">
                    <i class='bx bx-x'></i>
                </div>
            </div>
            <!--***********************SideBar*************************************-->

            <div class="sidebar">
                <nav>
                    <a href="ListarCompra">
                        <i class='bx bxs-dashboard'></i>
                        <h3>Painel de Controle</h3>
                    </a>
                    <a href="produtos.jsp">
                        <i class='bx bxs-package'></i>
                        <h3>Produtos</h3>
                    </a>
                    <a href="clientes.jsp">
                        <i class='bx bxs-user-pin '></i>
                        <h3>Cliente</h3>
                    </a>
                    <a class="active" href="funcionario.jsp">
                        <i class='bx bx-male'></i>
                        <h3>Funcionario</h3>
                    </a>
                </nav>
            </div>
        </aside>
        <!--****************************Main********************************-->
        <main style="overflow-y: hidden;">
            <section id="interface">
                <div class="navigation">
                    <div class="n1">
                        <div class="search">
                            <i class='bx bx-search-alt'></i>
                            <input type="text" placeholder="Pesquisar">
                        </div>
                    </div>
                    <div class="profile">
                        <div class="action">
                            <div class="profile" onclick="menuToggle();">
                                <i id="dropIcon" class='bx bxs-user'></i>
                            </div>
                            <div class="menu">

                                <%if (funcionario != null) {%>
                                <h3>
                                    <%=funcionario.getNomePessoa()%>
                                    <div>
                                        <%=funcionario.getCargo().getNomeCargo()%>
                                    </div>
                                </h3>
                                <ul>
                                    <li>
                                        <i class='bx bx-user'></i>
                                        <a href="ConsultarFuncionario?codigoFuncionario=<%=funcionario.getCodigoPessoa()%>">Perfil</a>
                                    </li>
                                    <li>
                                        <i class='bx bx-menu' ></i>
                                        <a href="ListarCompra">Menu Funcionario</a>
                                    </li>
                                    <li>
                                        <i class='bx bx-log-out' ></i>
                                        <a href="Logout">Logout</a>
                                    </li>
                                </ul>
                                <%}%>

                            </div>
                        </div>

                    </div>

                </div>
            </section>
            <section id="listarFunc">
                <% List<Funcionario> lista = (List<Funcionario>) request.getAttribute("funcionario"); %>
                <table class="content-table">
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nome</th>
                            <th>Cargo</th>
                            <th>CPF</th>
                            <th>Celular</th>
                            <th>Cidade</th>
                            <th>Email</th>
                            <th>Sobre</th>
                            <th>Login</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <%
                        for (Funcionario funcionarios : lista) {
                    %>
                    <tbody>
                        <tr>
                            <td><%= funcionarios.getCodigoPessoa()%></td>
                            <td><%= funcionarios.getNomePessoa()%></td>
                            <td><%= funcionarios.getCargo().getNomeCargo()%></td>
                            <td><%= funcionarios.getCpfPessoa()%></td>
                            <td><%= funcionarios.getCelularPessoa()%></td>
                            <td><%= funcionarios.getEmailPessoa()%></td>
                            <td><%= funcionarios.getObsFuncionario()%></td>
                            <td><%= funcionarios.getLoginFuncionario()%></td>
                            <td><a class="alter" href="ConsultarFuncionario?codigoFuncionario=<%= funcionarios.getCodigoPessoa()%>">Mais</a></td>
                            <td><a class="delete" href="ExcluirFuncionario?codigoFuncionario=<%= funcionarios.getCodigoPessoa()%>">Excluir</a></td> 
                        </tr>
                    </tbody>
                    <%}%>
                </table>

            </section>
        </main>
        <!--**************************Sidebar right*********************************-->

    </div>
</body>
<script>
    function menuToggle() {
        const toggleMenu = document.querySelector('.menu');
        toggleMenu.classList.toggle('active');
    }
</script>

<style>
    .icons-size {
        color: #333;
        font-size: 50px;
    }

    .action {
        position: absolute;
        right: 20px;
        top: 2px
    }

    .action ul {
        display: block;
        list-style-type: disc;
        margin-block-start: 0.58em;
        margin-block-end: 0.75em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
    }


    .action .profile {
        cursor: pointer;
        height: 40px;
        overflow: hidden;
        position: relative;
        width: 40px;
        top: 15px;
        margin-right: 50px;
    }

    .action .profile #dropIcon {
        font-size: 3rem;
        top: auto;
        position: absolute;
        left: 0;
    }

    .action .menu {
        background-color: #FFF;
        box-sizing: 0 5px 25px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        padding: 10px 20px;
        position: absolute;
        right: -10px;
        width: 200px;
        transition: 0.5s;
        top: 120px;
        visibility: hidden;
        opacity: 0;
        z-index: 1;
    }

    .action .menu.active {
        opacity: 1;
        top: 80px;
        right: 25px;
        visibility: visible;
        z-index: 1;
    }

    .action .menu::before {
        background-color: #fff;
        content: '';
        height: 20px;
        position: absolute;
        right: 30px;
        transform: rotate(45deg);
        top: -5px;
        width: 20px;
    }

    .action .menu h3 {
        color: #555;
        font-size: 20px;
        font-weight: 600;
        line-height: 1.3em;
        padding: 20px 0px;
        text-align: center;
        width: 100%;
    }

    .action .menu h3 div {
        color: #818181;
        font-size: 14px;
        font-weight: 400;
    }

    .action .menu ul li {
        align-items: center;
        border-top: 1px solid rgba(0, 0, 0, 0.05);
        display: flex;
        justify-content: left;
        list-style: none;
        padding: 10px 5px;
    }

    .action .menu ul li img {
        max-width: 20px;
        margin-right: 10px;
        opacity: 0.5;
        transition: 0.5s
    }

    .action .menu ul li i{
        font-size: 1.8rem;
        margin-right: 15px;
    }

    .action .menu ul li a {
        display: inline-block;
        color: #555;
        font-size: 14px;
        font-weight: 600;
        padding-left: 1px;
        text-decoration: none;
        text-transform: uppercase;
        transition: 0.5s;
    }

    .action .menu ul li:hover img {
        opacity: 1;
    }

    .action .menu ul li:hover a {
        color: orangered;
    }

    @media (max-width:799px) {
        .action {
            position: absolute;
            right: 30px;
            top: -1px;
        }
    }

    @media (max-width:477px) {
        .action {
            position: absolute;
            right: 30px;
            top: -1px;
        }
    }</style>
</html>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>