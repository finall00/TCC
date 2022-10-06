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
    <title>Funcionario</title>
    <link rel="stylesheet" href="../EstilosFunc/TempDash.css">
    <link rel="stylesheet" href="../EstilosFunc/funcionario.css">


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
            <h1>Funcionario</h1>
            <div class="products-action">
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <button id="openF">
                                <i class='bx bxs-user-plus' ></i>
                            </button>
                        </div>
                        <div class="tittle">
                            <p>Cadastar Funcionario</p>
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <i class='bx bxs-user-detail'></i>
                        </div>
                        <div class="tittle">
                            <p>Listar Funcionario</p>
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <div class="i">
                        <div class="action-icon">
                            <button id="opencar">
                            <i class='bx bx-id-card' ></i>
                            </button>
                        </div>
                        <div class="tittle">
                            <p>Cadastar cargo</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-container" id="modalCc">
                <div class="modal">
                    <div class="modal-header">
                        <h2>Cadastrar Funcionario</h2>
                        <button id="closee">
                            <i class='bx bx-x'></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form">
                            <form action="">
                                <div class="input-group">
                                    <div class="input-box">
                                        <label for="nome">Nome</label>
                                        <input type="text" name="nome" id="Formatar" placeholder="Nome funcionario" required>
                                    </div>
                                    
                                    <div class="input-box">
                                        <label for="data">Cargo</label>
                                        <select name="formata" id="formata">
                                            <option value="">Selecione</option>
                                        </select>
                                    </div>
                                    
                                    <div class="input-box">
                                        <label for="dataNasc">Data de nascimento</label>
                                        <input type="number" name="dataNasc" id="Formatar" placeholder="data" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="cpf">CPF</label>
                                        <input type="number" name="cpf" id="Formatar" placeholder="CPF sem pontos e traços" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="rg">RG</label>
                                        <input type="number" name="rg" id="Formatar" placeholder="Rg sem pontos e traços" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="telefone">Telefone</label>
                                        <input type="number" data-mask="(00) 00000-0000" name="telefone" id="Formatar" placeholder="(**) *****-****" >
                                    </div>
                                    <div class="input-box">
                                        <label for="celular">Celular</label>
                                        <input type="number" data-mask="(00) 00000-0000" name="celular" id="Formatar" placeholder="(**) *****-****" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="email">Email</label>
                                        <input type="text" name="email" id="Formatar" placeholder="email@email.com" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="endereco">Endereco</label>
                                        <input type="text" name="endereco" id="Formatar" placeholder="Insira seu endereço" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="estado">Estado</label>
                                        <input type="text" name="estado" id="Formatar" placeholder="" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="cep">CEP</label>
                                        <input type="text" name="cep" id="Formatar" placeholder="Silga do estado" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="cidade">Cidade</label>
                                        <input type="text" name="cidade" id="Formatar" placeholder="Insira sua cidade" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="bairro">Bairro</label>
                                        <input type="text" name="bairro" id="Formatar" placeholder="Nome do bairro" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="sobre">Sobre</label>
                                        <input type="text" name="sobre" id="Formatar" placeholder="" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="login">Login</label>
                                        <input type="text" name="login" id="Formatar" placeholder="Insira seu login" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="senha">Senha</label>
                                        <input type="text" name="senha" id="Formatar" placeholder="Insira sua senha" required>
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

            
            <div class="modal-containerc" id="modalcargo">
                <div class="modalcargo">
                    <div class="modal-header">
                        <h2>Cadastrar Cargo</h2>
                        <button id="closec">                            
                            <i class='bx bx-x'></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form">
                            <form action="">
                                <div class="input-group">
                                    <div class="input-box">
                                        <label for="nome">Nome Cargo</label>
                                        <input type="text" name="nome" id="Formatar" placeholder="Nome" required>
                                    </div>
                                    <div class="input-box">
                                        <label for="funcao">Função</label>
                                        <input type="text" name="funcao" id="Formatar" placeholder="Data" required>
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
    <script src="../ScriptFunc/funcionario.js"></script>
</body> 
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
</html>