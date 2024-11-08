
<%@page import="model.Funcionario"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confeitaria</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link rel="stylesheet" href="Estilo/index.css">
        
    </head>

    <%
        Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    %>
    <body>
        <section>
            <div class="circle"></div>
            <header>
                <a href="#"><img src="imgSistema/logo.png" alt="" class="logo"></a>
                <nav>
                    <ul>
                        <li><a href="ListarProduto">Produtos</a></li>
                        <% if(cliente == null || funcionarios == null){%>
                        <li><a href="paginaLogin.jsp">Login</a></li>
                        <%}%>
                    </ul>
                </nav>
            </header>        
            <div class="content">
                <div class="txt">
                    <h2>Confeitaria Web<br>Veja os melhores <span>Doces</span></h2>
                    <p>Confira aqui os melhores preços do mercado, e se deslembre com a maravilhosa esposição de bolos e doces que oferecemos à você <strong>Venha conferir!</strong> .</p>
                    <a href="ListarProduto">Veja mais</a>
                </div>
                <div class="imgBox">
                    <img src="imagens/imgIndex.png" alt="" class="img-imgBox">
                </div>
            </div>
        </section>
    </body>
</html>
