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
        <title>Controle</title>
        <link rel="stylesheet" href="EstilosFunc/TempDash.css">
        <link rel="stylesheet" href="EstilosFunc/dash.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>


    </head>
    <body>   
        <div class="card">

            <a href="homeFuncionario.jsp" class="goWebpage">
                <i class='bx bxs-store-alt'></i>
            </a>

            <div class="containerrr">
                <!--***********************SideBar*************************************-->         

                <%@include file="SideBarL.jsp" %>
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
                                    <img src="../imgaes/âPngtreeâblue gradient birthday cake 3d_5378657.png" alt=""><!--tentar fazer um proflie na foto do ptroduto-->
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
                                    <img src="../imgaes/âPngtreeâblue gradient birthday cake 3d_5378657.png" alt=""><!--tentar fazer um proflie na foto do ptroduto-->
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
                                    <img src="../imgaes/âPngtreeâblue gradient birthday cake 3d_5378657.png" alt=""><!--tentar fazer um proflie na foto do ptroduto-->
                                </div>
                            </div>
                            <small><a href="#">Vazio</a></small> <!--achar uma func para isso pode ser qualquer coisa como caitar pedido, ou outra coisa-->
                        </div>
                    </div>

                </main>
            </div>
            <!--**************************Sidebar right*********************************-->
            <%@include file="SideBarR.jsp" %>
        </div>
        <script src="ScriptFunc/dash.js"></script>
    </body> 
    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    %>
</html>