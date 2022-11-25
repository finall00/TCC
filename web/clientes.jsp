<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%

        Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
        if (funcionario != null) {
    %>  
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes</title>
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
                    <div class="logo">
                        <img src="imgSistema/logo.png" alt="">
                        <h2>Nlogo</h2>
                    </div>
                    <div class="close" id="btn-close">
                        <i class='bx bx-x'></i>
                    </div>
                </div>
                <!--***********************SideBar*************************************-->
                <div class="sidebar">
                    <nav>
                        <a  href="ListarCompra">
                            <i class='bx bxs-dashboard'></i>
                            <h3>Painel de Controle</h3>
                        </a>
                        <a href="produtos.jsp">
                            <i class='bx bxs-package'></i>
                            <h3>Produtos</h3>
                        </a>
                        <a  class="active"href="clientes.jsp">
                            <i class='bx bxs-user-pin '></i>
                            <h3>Cliente</h3>
                        </a>
                        <a href="funcionario.jsp">
                            <i class='bx bx-male'></i>
                            <h3>Funcionario</h3>
                        </a>
                    </nav>
                </div>
            </aside>
            <!--****************************Main********************************-->
            <main>
                <section id="interface">
                    <div class="navigation">
                        <div class="n1">
                            <div class="search">
                                <i class='bx bx-search-alt' ></i>
                                <input type="text" placeholder="Pesquisar">
                            </div>
                        </div>
                        <div class="profile">
                            <i class='bx bxs-user'></i>
                        </div>
                    </div>
                </section>
                <section id="actions">
                    <div class="products-action">
                        <div class="actions">
                            <div class="i">
                                <div class="action-icon">
                                    <a href="NovoCliente">
                                        <i class='bx bxs-user-plus' ></i>
                                    </a>
                                </div>
                                <div class="tittle">
                                    <p>Cadastar Cliente</p>
                                </div>
                            </div>
                        </div>
                        <div class="actions">
                            <div class="i">
                                <div class="action-icon">
                                    <a href="ListarCliente">
                                        <i class='bx bxs-user-detail'></i>
                                    </a>
                                </div>
                                <div class="tittle">
                                    <p>Listar Cliente</p>
                                </div>
                            </div>
                        </div>
                        <div class="actions">
                            <div class="i">
                                <div class="action-icon">
                                    <a href="ListarFornecedor">
                                        <i class='bx bx-id-card' ></i>
                                    </a>
                                </div>
                                <div class="tittle">
                                    <p>Fornecedores</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>  
            <!--**************************Sidebar right*********************************-->

        </div>

    </body> 
    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    %>
</html>