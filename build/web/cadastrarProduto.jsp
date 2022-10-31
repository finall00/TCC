<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
    <%

        Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
        if (funcionario != null) {
    %>  
    <head ThemaEscuro()>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Produtos</title>
        <link rel="stylesheet" href="EstilosFunc/cadastroProd.css">
        <link rel="stylesheet" href="EstilosFunc/TempDash.css">

        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    </head>
    <body>
        <a href="homeFuncionario.jsp" class="goWebpage">
            <i class='bx bxs-store-alt'></i>
        </a>

        <div class="containerrr">
            <!--***********************SideBar Left*************************************-->     
            <%@include file="SideBarL.jsp" %>
            <!--****************************Main********************************-->
            <main>
                <div class="form-header">
                    <div class="title">
                        <h1>Cadastrar Produto</h1>
                    </div>
                </div>
                <form action="#">
                    <div class="details">
                        <div class="input-box">
                            <label for="nome">Nome produto</label>
                            <input
                                type="text"
                                name="nome"
                                id="Formatar"
                                placeholder="Nome"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <label for="data">Data do prodruto </label>
                            <input
                                type="number"
                                name="data"
                                id="Formatar"
                                placeholder="Data"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <label for="estoque">Estoque do produto</label>
                            <input
                                type="number"
                                name="estoque"
                                id="Formatar"
                                placeholder="Quantidade"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <label for="codigo">Codigo de barra</label>
                            <input
                                type="number"
                                name="codigo"
                                id="Formatar"
                                placeholder="Codigo  "
                                required
                                />
                        </div>
                        <div class="input-box">
                            <label for="vlrCusto">Valor de custo </label>
                            <input
                                type="number"
                                name="vlrCusto"
                                id="Formatar"
                                placeholder="Custo"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <label for="vlrVenda">Valor de venda </label>
                            <input
                                type="number"
                                name="vlrVenda"
                                id="Formatar"
                                placeholder="Venda"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <label for="descricao">Descricao do produto</label>
                            <input
                                type="text"
                                name="descricao"
                                id="Formatar"
                                placeholder="Descricao"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <label for="foto" class="custom-file-upload"
                                   >Selecione foto do produto</label
                            >
                            <input type="file" name="foto" id="foto" placeholder="" required />
                        </div>
                    </div>
                    <div class="button">
                        <button type="submit">Cadastrar</button>

                        <a class="btn btn-secondary" href="produtos.jsp">Voltar</a>
                    </div>

                </form>

            </main>
            <!--**************************Sidebar right*********************************-->
            <%@include file="SideBarR.jsp" %>
        </div>
        <script src="ScriptFunc/dash.js"></script>
        <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
       
    </body> 
    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    %>
</html>