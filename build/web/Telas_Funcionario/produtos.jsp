<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>  
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Produtos</title>
        <link rel="stylesheet" href="../EstilosFunc/TempDash.css">
        <link rel="stylesheet" href="../EstilosFunc/produtos.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>


    </head>
    <body>
        <a href="../homeFuncionario.jsp" class="goWebpage">
            <i class='bx bxs-store-alt'></i>
        </a>

        <div class="containerrr">
            <!--***********************SideBar*************************************-->     
            <%@include file="../Telas_Funcionario/SideBarL.jsp" %>
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
                            <form action="">
                                <div class="input-group">
                                    <div class="input-box">
                                        <label for="nome">Nome produto</label>
                                        <input type="text" name="nome" id="Formatar" placeholder="Nome" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="data">Data do prodruto  </label>
                                        <input type="number" name="data" id="Formatar" placeholder="Data" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="estoque">Estoque do produto</label>
                                        <input type="number" name="estoque" id="Formatar" placeholder="Quantidade" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="codigo">Codigo de barra</label>
                                        <input type="number" name="codigo" id="Formatar" placeholder="Codigo  " required>
                                    </div>
                                    <div class="input-box">
                                        <label for="vlrCusto">Valor de custo  </label>
                                        <input type="number" name="vlrCusto" id="Formatar" placeholder="Custo" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="vlrVenda">Valor de venda  </label>
                                        <input type="number" name="vlrVenda" id="Formatar" placeholder="Venda" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="modalBtn">
                                        <button type="button">Cadastrar</button>
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
            <%@include file="../Telas_Funcionario/SideBarR.jsp" %>

        </div>
   
    <script src="../ScriptFunc/dash.js"></script>
    <script src="../EstilosFunc/modal.js"></script>
</body> 
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
</html>