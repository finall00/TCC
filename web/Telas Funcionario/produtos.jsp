<%-- 
    Document   : produtos
    Created on : 02/10/2022, 14:51:32
    Author     : smili08
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Produtos</title>
        <link rel="stylesheet" href="../EstilosFunc/TempDash.css">
        <link rel="stylesheet" href="../EstilosFunc/produtos.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    </head>
    <body>
        <a href="../homeFuncionario.jsp" class="goWebpage">
            <i class='bx bxs-store-alt'></i>
        </a>

        <div class="containerrr">
            <aside>
                <div class="top">
                    <div class="logo">
                        <img src="../imgaes/—Pngtree—blue gradient birthday cake 3d_5378657.png" alt="">
                        <h2>Nlogo</h2>
                    </div>
                    <div class="close" id="btn-close">
                        <i class='bx bx-x'></i>
                    </div>
                </div>
                <!--***********************SideBar*************************************-->    
                <div class="sidebar">
                    <nav>
                        <a href="dashboard.jsp">
                            <i class='bx bxs-dashboard' ></i>
                            <h3>Painel de Controle</h3>
                        </a>
                        <a href="produtos.jsp">
                            <i class='bx bxs-package'></i>
                            <h3>Produtos</h3>
                        </a>
                        <a href="clientes.jsp">
                            <i class='bx bxs-user-pin ' ></i>
                            <h3>Cliente</h3>
                        </a>
                        <a href="Logout">
                            <i class='bx bx-log-out'></i>
                            <h3>logout</h3>
                        </a>
                    </nav>
                </div>
            </aside>
            <!--****************************Main********************************-->
            <main>
                <h1>Produtos</h1>
                <div class="products-action">
                    <div class="actions">
                        <div class="i">
                            <div class="action-icon">
                                <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
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

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content" style="background-color:var(--color-white)">
                            <div class="modal-header">
                                <h1 class="modal-title" id="exampleModalLabel">Cadastar produto:</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <form action="../CadastrarProduto" method="post" enctype="multipart/form-data" >
                                    <div class="row">
                                        <div hidden="">     <input class="form-control" type="text" id="codigoProduto"  name="codigoProduto" readonly /></div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail">Nome</label>
                                            <input class="form-control"  type="text" id="nomeProduto" name="nomeProduto" placeholder="Nome" required />
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="inputData">Data</label>
                                            <input class="form-control" placeholder="Data Validade" type="date" id="dataValidade" name="dataValidade" required />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="inputEstoque">Estoque</label>
                                            <input  class="form-control" placeholder="Estoque" min="0" type="number" id="estoqueProduto" name="estoqueProduto" required />
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="inputState">Codigo de barra</label>
                                            <input class="form-control" type="text" placeholder="codigo de Barra" id="codigoBarra" name="codigoBarra" required />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="inputvlrCusto">Valor de custo</label>
                                            <input class="form-control"   placeholder="valor de Custo" type="text" id="vlrCusto" name="vlrCusto" required />
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="inputvlrVenda">Valor de venda</label>
                                            <input class="form-control"  placeholder="valor da venda" type="text" id="vlrVenda" name="vlrVenda"  required/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="img">Imagem</label>
                                        <input type="file" name="file" id="file">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="inputDesc">Descrição</label>
                                        <input class="form-control" placeholder="Descrição" type="text" id="descricaoProduto" name="descricaoProduto" required />
                                    </div>
                                    <div class="modal-footer"> <button type="submit" class="btn btn-outline-success" data-bs-dismiss="modal" aria-label="Cadastrar">Cadastrar</button></div>
                                </form>
                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal" aria-label="Cancelar">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <!--**************************Sidebar right*********************************-->
            <div class="rightt">
                <div class="top">
                    <button id="menu-btn">
                        <i class='bx bx-menu'></i>
                    </button>
                    <div class="toogler">
                        <i class='bx bx-sun active'></i>
                        <i class='bx bxs-moon' ></i>
                    </div>
                    <div class="perfil-logado">
                        <div class="info">
                            <p>Logando com: <b>Npessoa</b></p>
                            <small class="text-muted">"Cargo"</small> 
                        </div>
                        <div class="notification">
                            <i class='bx bxs-bell'></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../ScriptFunc/dash.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
    </body> 
</html>