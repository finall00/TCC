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
        <link rel="stylesheet" href="../EstilosFunc/TempDash.css">
        <link rel="stylesheet" href="../EstilosFunc/produtos.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>
    <body>
          <a href="../homeFuncionario.jsp" class="goWebpage">
    <i class='bx bxs-store-alt'></i>
    </a>

    <div class="containerrr">
        <!--***********************SideBar Left*************************************-->     
        <%@include file="SideBarL.jsp" %>
        <!--****************************Main********************************-->
        <main>
            <h1>Produtos</h1>
            <div class="products-action">
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <button id="open">
                                <i class='bx bx-plus'></i>
                            </button>
                        </div>
                        <div class="tittle">
                            <p>Cadastrar Produto</p>
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <i class='bx bx-list-check'></i>
                        </div>
                        <div class="tittle">
                            <p>Listar Produtos</p>
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <i class='bx bx-plus'></i>
                        </div>
                        <div class="tittle">
                            <p>Sem ideia doque colocar aqui</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-container" id="modalC">
                <div class="modal">
                    <div class="modal-header">
                        <h2>Cadastrar Produto</h2>
                        <button id="close">
                            <i class='bx bx-x'></i>
                        </button>
                    </div>
                    <div class="modal-body">                       
                        <div class="form">

                            <form action="../CadastrarProduto" method="post" enctype="multipart/form-data"><!-- Form pa cadastrar eeee-->
                                <div class="input-group">
                                    <div class="input-box">
                                        <div hidden="">
                                            <input class="form-control" type="text" id="codigoProduto"  name="codigoProduto" readonly />
                                        </div>
                                        <label for="nome">Nome produto</label>
                                        <input type="text" name="nomeProduto" id="nomeProduto" placeholder="Nome" required>
                                    </div>
                                    <div id="data" class="input-box">
                                        <label for="data">Data Validade   </label>
                                        <input type="date" name="dataValidade" id="dataValidade" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="estoque">Estoque do produto</label>
                                        <input type="number" name="estoqueProduto" id="estoqueProduto" placeholder="Quantidade" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="codigo">Codigo de barra</label>
                                        <input type="text" name="codigoBarra" id="codigoBarra" placeholder="Codigo" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="vlrCusto">Valor de custo  </label>
                                        <input type="text" name="vlrCusto" id="vlrCusto" placeholder="Custo" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="vlrVenda">Valor de venda  </label>
                                        <input type="text" name="vlrVenda" id="vlrVenda" placeholder="Venda" required>
                                    </div>
                                    <div class="input-box">                                        
                                        <input type="file" name="imagem" id="imagem">
                                    </div>
                                    <div class="input-box">
                                        <label for="descricaoProduto">Descrição  </label>
                                        <input type="text" name="descricaoProduto" id="descricaoProduto" placeholder="Sobre o produto" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="modalBtn">
                                        <button type="submit">Cadastrar</button>
                                        <button type="button" id="cancel">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </main>

        <!--**************************Sidebar right*********************************-->
        <%@include file="SideBarR.jsp" %>
    </div>
    <script src="../ScriptFunc/dash.js"></script>
    <script src="../ScriptFunc/modal.js"></script>
    <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
         <script src="${pageContext.request.contextPath}/Scripts/PesquisarPessoa.js"></script> 
</body> 
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
</html>