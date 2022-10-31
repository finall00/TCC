<%@page import="java.util.List"%>
<%@page import="model.PedidoVenda"%>

<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
    <%

        Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
        if (funcionario != null) {
            List<PedidoVenda> lista = (List<PedidoVenda>) request.getAttribute("compra");
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
                        <%
                            if (lista != null) {

                                for (PedidoVenda compra : lista) {
                        %>


                        <div class="pedidos">
                            <div class="tittle">
                                <span class="id-text">ID do pedido:</span>
                                <p class="Id-pedido"><strong><%=compra.getCodigoPedido()%></strong></p>
                            </div>
                            <div class="middle">
                                <div class="left">
                                    <p><%=compra.getDataVenda()%></p>
                                    <h1>R$ <%= compra.getVlrTotalVenda()%></h1>
                                </div>
                                <div class="product-photo">
                                    <img src="<%= (String) request.getContextPath() + "/imagens/" + compra.getProduto().getImagem()%>" alt=""><!--tentar fazer um proflie na foto do ptroduto-->
                                </div>
                            </div>
                            <small><a href="/detalhesVenda">Detalhes</a></small> <!--achar uma func para isso pode ser qualquer coisa como caitar pedido, ou outra coisa-->
                        </div>
                        <%  }
                        } else {
                        %>
                        <div class="pedidos">
                            <div class="tittle">
                                <span class="id-text">Não há pedidos</span>
                            </div>
                        </div>
                        <%
                            }%>

                    </div>   


                </main>


                <!--**************************Sidebar right*********************************-->
                <%@include file="SideBarR.jsp" %>

            </div>
        </div>
        <script src="ScriptFunc/dash.js"></script>
    </body> 
    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    %>
</html>