<%@page import="model.Funcionario"%>
<%@page import="dao.itensBoloDAO"%>
<%@page import="model.Produto"%>    
<%@page import="java.util.List"%>
<%

    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionarios != null) {
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Produtos</title>
        <link rel="stylesheet" href="Estilos/style.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

    </head>

    <form action="PesquisarProduto">
        <label for="nomeProduto">nome Produto:</label>
        <input class="form-control" type="text" id="pesquisaProduto" name="nomeProduto" placeholder="Nome" />

        <input type="submit" value="Pesquisar">
    </form>  
    <%
        List<Produto> lista = (List<Produto>) request.getAttribute("produto");

        if (lista == null) {
    %>

    <div class="alert alert-primary" role="alert">
        <br>
        <br>
        <br>  
        ${mensagem}
    </div>
    <%
    } else {
    %>

    <body>
        <div class="button-form">
        </div>
        <h2>${erro}</h2>
        <%            for (Produto produto : lista) {
        %>
        <div class="card">
            <div class="carrinho-logo">
                <img src="" alt="logo teste ">
                <i class='bx bxs-cart-add'></i> 
            </div>
            <div class="produto">

                <img src="<%= (String) request.getContextPath() + "/imagems/" + produto.getImagem()%>">
            </div>

            <div class="detalhes">
                <span hidden="" class="nome" ><%= produto.getCodigoProduto()%></span>
                <span class="nome" ><%= produto.getNomeProduto()%></span>
                <p class="obsProduto"><%= produto.getDescricaoProduto()%></p>
            </div>

            <div class="preco">
                <span class="num-preco">R$<%= produto.getVlrVenda()%></span>
                <span class="num-letra"><%= produto.getDataValidade()%></span>
            </div>
            <div class="button"><a href="ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>" class="btn btn-primary">Fazer Pedido</a> </div>
            <div class="button">
                
                <a href="ConsultarProduto?codigoProduto=<%= produto.getCodigoProduto()%>" class="btn btn-primary">mais info</a>
            </div>
        </div>
        <%
                }
            }
        %>

        <div class="card">
            <div class="plus-icon">
                <button id="myBtn">
                    <a href="NovoProduto"></a>
                    <i class='bx bx-plus'></i>
                </button>
            </div>
        </div>


        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-conteudo">
                <span class="close">&times;</span>
                <span class="title">Cadastar Produto</span>

                <div class="container-form">
                    <form action="CadastrarProduto" method="post" enctype="multipart/form-data" >
                        <div class="register-details">

                            <div hidden="" class="input-box">

                                <input class="form-control" type="text" id="codigoProduto"  name="codigoProduto" readonly />
                            </div>

                            <div class="input-box">

                                <input class="form-control"  type="text" id="nomeProduto" name="nomeProduto" placeholder="Nome" required />
                            </div>

                            <div class="input-box">

                                <input class="form-control" placeholder="Data Validade" type="date" id="dataValidade" name="dataValidade" required />
                            </div>

                            <div class="input-box">

                                <input  class="form-control" placeholder="Estoque" min="0" type="number" id="estoqueProduto" name="estoqueProduto" required />
                            </div>

                            <div class="input-box">

                                <input class="form-control"   placeholder="valor de Custo" type="text" id="vlrCusto" name="vlrCusto" required />
                            </div>

                            <div class="input-box">

                                <input class="form-control"  placeholder="valor da venda" type="text" id="vlrVenda" name="vlrVenda"  required/>

                            </div>

                            <div class="input-box">

                                <input class="form-control" placeholder="Descrição" type="text" id="descricaoProduto" name="descricaoProduto" required />
                            </div>
                            <div class="input-box">

                                <input class="form-control" type="text" placeholder="codigo de Barra" id="codigoBarra" name="codigoBarra" required />
                            </div>
                            <div>                               
                                <input type="file" name="file" id="file">
                            </div>



                            <div class="button-form">
                                <input type="submit" value="Cadastrar">
                            </div>
                        </div>
                    </form>
                </div>
            </div>      
        </div>
        <script src="Scripts/script.js"></script>

        <div class="button">
            <a href="homeFuncionario.jsp">Menu</a>            
        </div>

    </body>
    <script src="Scripts/PesquisarProduto.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    %>
</html>