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
        <link rel="stylesheet" href="EstilosFunc/TempDash.css">
        <link rel="stylesheet" href="EstilosFunc/produtos.css">
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
            <h1>Produtos</h1>
            <div class="products-action">
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <button >
                                
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
                            <p><a href="cadastrarProduto.jsp">Listar Produtos</a></p>
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

       
        </main>

        <!--**************************Sidebar right*********************************-->
        <%@include file="SideBarR.jsp" %>
    </div>
    <script src="ScriptFunc/dash.js"></script>
    <script src="ScriptFunc/modal.js"></script>
    <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
         <script src="${pageContext.request.contextPath}/Scripts/PesquisarPessoa.js"></script> 
</body> 
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
</html>