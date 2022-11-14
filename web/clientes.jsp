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
    <title>Clientes</title>
    <link rel="stylesheet" href="EstilosFunc/TempDash.css">
    <link rel="stylesheet" href="EstilosFunc/cliente.css">


    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <a href="homeFuncionario.jsp" class="goWebpage">
    <i class='bx bxs-store-alt'></i>
    </a>
    
    <div class="containerrr">
     <!--***********************SideBar*************************************-->       
       <%@include file="SideBarL.jsp" %>
        <!--****************************Main********************************-->
        <main>
            <h1>Clientes</h1>
            <div class="products-action">
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <button type="button" data-bs-toggle="modal" data-bs-target="#modalCliente" data-bs-whatever="@mdo">
                                <i class='bx bxs-user-plus' ></i>
                            </button>
                        </div>
                        <div class="tittle">
                            <p>Cadastar Cliente</p>
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <i class='bx bxs-user-detail'></i>
                        </div>
                        <div class="tittle">
                            <p>Listar Clientes</p>
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

</body> 
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
</html>