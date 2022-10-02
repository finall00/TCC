<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Controle</title>
        <link rel="stylesheet" href="../EstilosFunc/TempDash.css">
        <link rel="stylesheet" href="../EstilosFunc/dash.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>


    </head>
    <body>
        <a href="../homeFuncionario.jsp" class="goWebpage">
            <i class='bx bxs-store-alt'></i>
        </a>

        <div class="containerrr">
            <aside>
                <div class="top">
                    <div class="logo">
                        <img src="../imgaes/—Pngtree—blue gradient birthday cake 3d_5378657.png" alt="">
                        <h2>Nlogo</h2>
                    </div>
                    <div class="close" id="btn-close">
                        <i class='bx bx-x'></i>
                    </div>
                </div>
                <!--***********************SideBar*************************************-->    
                <div class="sidebar">
                    <nav>
                        <a href="dashboard.jsp">
                            <i class='bx bxs-dashboard' ></i>
                            <h3>Painel de Controle</h3>
                        </a>
                        <a href="produtos.jsp">
                            <i class='bx bxs-package'></i>
                            <h3>Produtos</h3>
                        </a>
                        <a href="clientes.jsp">
                            <i class='bx bxs-user-pin ' ></i>
                            <h3>Cliente</h3>
                        </a>
                        <a href="../Logout">
                            <i class='bx bx-log-out'></i>
                            <h3>logout</h3>
                        </a>
                    </nav>
                </div>
            </aside>
            <!--****************************Main********************************-->
            <main>
                <h1>Painel de Controle</h1>
                <div class="pedidos-recentes">
                    <div class="pedidos">
                        <div class="tittle">
                            <span class="id-text">ID do pedido:</span>
                            <p class="Id-pedido">01</p>
                        </div>
                        <div class="middle">
                            <div class="left">
                                <p>17/03/2022</p>
                                <h1>R$ 37,00</h1>
                            </div>
                            <div class="product-photo">
                                <img src="../imgaes/—Pngtree—blue gradient birthday cake 3d_5378657.png" alt=""><!--tentar fazer um proflie na foto do ptroduto-->
                            </div>
                        </div>
                        <small><a href="#">Vazio</a></small> <!--achar uma func para isso pode ser qualquer coisa como caitar pedido, ou outra coisa-->
                    </div>

                    <div class="pedidos">
                        <span class="id-text">ID do pedido:</span>
                        <p class="Id-pedido">01</p>
                        <div class="middle">
                            <div class="left">
                                <p>17/03/2022</p>
                                <h1>R$ 37,00</h1>
                            </div>
                            <div class="product-photo">
                                <img src="../imgaes/—Pngtree—blue gradient birthday cake 3d_5378657.png" alt=""><!--tentar fazer um proflie na foto do ptroduto-->
                            </div>
                        </div>
                        <small><a href="#">Vazio</a></small> <!--achar uma func para isso pode ser qualquer coisa como caitar pedido, ou outra coisa-->
                    </div>

                    <div class="pedidos">
                        <span class="id-text">ID do pedido:</span>
                        <p class="Id-pedido">01</p>
                        <div class="middle">
                            <div class="left">
                                <p>17/03/2022</p>
                                <h1>R$ 37,00</h1>
                            </div>
                            <div class="product-photo">
                                <img src="../imgaes/—Pngtree—blue gradient birthday cake 3d_5378657.png" alt=""><!--tentar fazer um proflie na foto do ptroduto-->
                            </div>
                        </div>
                        <small><a href="#">Vazio</a></small> <!--achar uma func para isso pode ser qualquer coisa como caitar pedido, ou outra coisa-->
                    </div>
                </div>       
            </main>

            <!--**************************Sidebar right*********************************-->
            <div class="rightt">
                <div class="top">
                    <button id="menu-btn">
                        <i class='bx bx-menu'></i>
                    </button>
                    <div class="toogler">
                        <i class='bx bx-sun active'></i>
                        <i class='bx bxs-moon' ></i>
                    </div>
                    <div class="perfil-logado">
                        <div class="info">
                            <p>Logando com: <b>Npessoa</b></p>
                            <small class="text-muted">"Cargo"</small> 
                        </div>
                        <div class="notification">
                            <i class='bx bxs-bell'></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../ScriptFunc/dash.js"></script>
    </body> 
</html>
