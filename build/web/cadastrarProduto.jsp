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
                <form action="CadastrarProduto" method="post" enctype="multipart/form-data">
                    <input type="text" hidden="" id="codigoProduto" name="codigoProduto" readonly value="${produto.codigoProduto > 0 ? produto.codigoProduto : ""}"/>
                    
                    <div class="details">
                        <div class="input-box">
                            <label for="nomeProduto">Nome produto</label>
                            <input type="text" id="nomeProduto" name="nomeProduto" placeholder="Nome" required/>
                        </div>

                        <div class="input-box">
                            <label for="dataValidade">Data do produto </label>
                            <input type="date" id="dataValidade" name="dataValidade" placeholder="Data" required/>
                        </div>

                        <div class="input-box">
                            <label for="estoqueProduto">Estoque do produto</label>
                            <input type="number" id="estoqueProduto" name="estoqueProduto"  placeholder="Quantidade" required/>
                        </div>

                        <div class="input-box">
                            <label for="codigoBarra">Codigo de barra</label>
                            <input type="number" id="codigoBarra" name="codigoBarra" placeholder="Codigo" required/>
                        </div>

                        <div class="input-box">
                            <label for="vlrCusto">Valor de custo </label>
                            <input type="text" id="vlrCusto" name="vlrCusto" placeholder="Custo" required/>
                        </div>

                        <div class="input-box">
                            <label for="vlrVenda">Valor de venda </label>
                            <input type="text" id="vlrVenda" name="vlrVenda" placeholder="Venda" required/>
                        </div>

                        <div class="input-box">
                            <label for="descricaoProduto">Descricao do produto</label>
                            <input type="text" id="descricaoProduto" name="descricaoProduto"  placeholder="Descricao" required/>
                        </div>

                        <div class="input-box">
                            <label for="file" class="custom-file-upload">Selecione foto do produto</label>
                            <input type="file" name="file" id="file" placeholder="" required />
                        </div>
                    </div>

                    <div class="button">
                        <button type="submit">Cadastrar</button>
                        <input type="button" value="Voltar" onclick="history.go(-1)">
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