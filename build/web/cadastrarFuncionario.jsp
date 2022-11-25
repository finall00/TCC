<%@page import="model.Cargo"%>
<%@page import="model.Funcionario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Cadastrar Funcionario</title>
        <link rel="stylesheet" href="EstilosFunc/dash.css">
        <!-- <link rel="stylesheet" href="../css/dash.css"> -->
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>

    <body>
        <a href="ListarProduto" class="goWebpage">
            <i class='bx bxs-store-alt'></i>
        </a>

        <div class="containerrr">
            <aside>
                <div class="top">
                    <div class="logo">
                        <img src="imgSistema/logo.png" alt="">
                        <h2>Nlogo</h2>
                    </div>
                    <div class="close" id="btn-close">
                        <i class='bx bx-x'></i>
                    </div>
                </div>
                <!--***********************SideBar*************************************-->
                <div class="sidebar">
                    <nav>
                        <a  href="ListarCompra">
                            <i class='bx bxs-dashboard'></i>
                            <h3>Painel de Controle</h3>
                        </a>
                        <a   href="produtos.jsp">
                            <i class='bx bxs-package'></i>
                            <h3>Produtos</h3>
                        </a>
                        <a href="clientes.jsp">
                            <i class='bx bxs-user-pin '></i>
                            <h3>Cliente</h3>
                        </a>
                        <a  class="active" href="funcionario.jsp">
                            <i class='bx bx-male'></i>
                            <h3>Funcionario</h3>
                        </a>
                    </nav>
                </div>
            </aside>
            <!--****************************Main********************************-->
            <main>

                <section id="cadastroFuncionario">
                    <div class="form-header">
                        <div class="title">
                            <h1>Cadastrar Funcionario</h1>
                        </div>
                    </div>
                    <form action="#">
                        <div class="details">
                            <div class="input-box">
                                <input hidden="" class="form-control" type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${funcionario.codigoPessoa > 0 ? funcionario.codigoPessoa : ""}"/>              
                                <label for="nome">Nome</label>
                                <input type="text" name="nomePessoa" id="nomePessoa" placeholder="Nome funcionario" required value="${funcionario.nomePessoa}">
                            </div>
                            <div class="input-box">
                                <label for="dataNascimento">Data de nascimento</label>
                                <input type="date" name="dataNascimento" id="dataNascimento" placeholder="data" required>
                            </div>
                            <div class="input-box">
                                <label for="cpfPessoa">CPF</label>
                                <input type="text" data-mask="000.000.000-00" name="cpfPessoa" id="cpfPessoa" placeholder="CPF sem pontos e traços" required>
                            </div>
                            <div class="input-box">
                                <label for="rgPessoa">RG</label>
                                <input type="number" name="rgPessoa" id="rgPessoa" placeholder="Rg sem pontos e traços" required>
                            </div>
                            <div class="input-box">
                                <label for="telefonePessoa">Telefone</label>
                                <input type="text" data-mask="(00) 00000-0000" name="telefonePessoa" id="telefonePessoa" placeholder="(**) *****-****" required>
                            </div>
                            <div class="input-box">
                                <label for="celularPessoa">Celular</label>
                                <input type="text" data-mask="(00) 00000-0000" name="celularPessoa" id="celularPessoa" placeholder="(**) *****-****" required>
                            </div>
                            <div class="input-box">
                                <label for="emailPessoa">Email</label>
                                <input type="text" name="emailPessoa" id="emailPessoa" placeholder="email@email.com" required>
                            </div>
                            <div class="input-box">
                                <label for="cepPessoa">CEP</label>
                                <input type="text" data-masck="00000-000" name="cepPessoa" id="cepPessoa" placeholder="Cep" required>
                            </div>
                            <div class="input-box">
                                <label for="enderecoPessoa">Endereco</label>
                                <input type="text" name="enderecoPessoa" id="enderecoPessoa" placeholder="Insira seu endereço" required>
                            </div>
                            <div class="input-box">
                                <label for="estadoPessoa">Estado</label>
                                <input type="text" name="estadoPessoa" id="estadoPessoa" placeholder="Insira seu estado" required>
                            </div>
                            <div class="input-box">
                                <label for="cidadePessoa">Cidade</label>
                                <input type="text" name="cidadePessoa" id="cidadePessoa" placeholder="Insira sua cidade" required>
                            </div>
                            <div class="input-box">
                                <label for="bairroPessoa">Bairro</label>
                                <input type="text" name="bairroPessoa" id="bairroPessoa" placeholder="Nome do bairro" required>
                            </div>
                            <div class="input-box">
                                <label for="loginFuncionario">Login</label>
                                <input type="text" name="loginFuncionario" id="loginFuncionario" placeholder="Insira seu login" required>
                            </div>
                            <div class="input-box">
                                <label for="senhaFuncionario">Senha</label>
                                <input type="password" minlength="3" maxlength="8" name="senhaFuncionario" id="senhaFuncionario" placeholder="Insira sua senha" required>
                            </div>
                            <div class="input-box">
                                <label for="obsFuncionario">Sobre</label>
                                <input type="text" maxlength="150" name="obsFuncionario" id="obsFuncionario" placeholder="" required>
                            </div>

                            <div class="cargo">
                              
                                <%
                                    List<Cargo> lista = (List<Cargo>) request.getAttribute("cargo");
                                    Funcionario funcionario = (Funcionario) request.getAttribute("funcionario");
                                %>
                                <select id="codigoCargo" 
                                        name="codigoCargo" class="form-control" required>
                                    <option value="">Cargo</option>
                                    <%
                                        for (Cargo cargo : lista) {
                                    %>
                                    <option value="<%= cargo.getCodigoCargo()%>" <%= funcionario.getCargo().getCodigoCargo() == cargo.getCodigoCargo() ? "selected" : ""%> ><%= cargo.getNomeCargo()%></option>
                                    <%
                                        }
                                    %>
                                </select>

                                <button id="opencargo">
                                    <i class='bx bx-plus'></i>
                                </button>
                            </div>

                        </div>

                        <div class="button">
                            <button type="submit">Cadastrar</button>
                        </div>
                    </form>

                    <div class="modal-container-cargo" id="modalcargo">
                        <div class="modal-content-cargo">
                            <div class="form-header">
                                <div class="modal-title">
                                    <h1>Cadastre um novo cargo</h1>
                                    <button id="closecargo">
                                        <i class='bx bx-x'></i>
                                    </button>
                                </div>

                                <div class="details">
                                    <form action="CadastrarCargo" method="POST">

                                        <div class="input-box">
                                            <input type="text" hidden="" name="codigoCargo" id="codigoCargo">
                                            <input type="text" hidden="" name="out" id="out" value="novo">
                                      
                                            <label for="nomeCargo">Cargo</label>
                                            <input type="text" name="nomeCargo" id="nomeCargo" placeholder="Nome do cargo" required>
                                        </div>
                                        <div class="input-box">
                                            <label for="descCargo">Cargo</label>
                                            <input type="text" name="descCargo" id="descCargo" placeholder="Descrição do cargo" required>
                                        </div>
                                        
                                        <div class="button">
                                            <button type="submit">Cadastrar</button>
                                        </div>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>


                </section>

            </main>     
            <!--**************************Sidebar right*********************************-->

        </div>
        <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
        
        <script src="Scripts/PesquisarPessoa.js"></script>
        <script src="Scripts/modalCargo.js"></script>
    </body>
    <script>
        //ViaCep
        $(document).ready(function () {

            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.
                $("#enderecoPessoa").val("");
                $("#bairroPessoa").val("");
                $("#cidadePessoa").val("");
                $("#estadoPessoa").val("");

            }

            //Quando o campo cep perde o foco.
            $("#cepPessoa").blur(function () {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep !== "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#enderecoPessoa").val("");
                        $("#bairroPessoa").val("...");
                        $("#cidadePessoa").val("...");
                        $("#estadoPessoa").val("...");


                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#enderecoPessoa").val(dados.logradouro);
                                $("#bairroPessoa").val(dados.bairro);
                                $("#cidadePessoa").val(dados.localidade);
                                $("#estadoPessoa").val(dados.uf);

                                $("#enderecoPessoa").removeAttr("disabled");
                                $("#bairroPessoa").removeAttr("disabled");


                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                swal({
                                    title: "Dados invalidos!",
                                    text: "CEP não encontrado!!",
                                    icon: "error",
                                    button: "Ok"
                                });
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        swal({
                            title: "Dados invalidos!",
                            text: "Formato do CEP invalido!!",
                            icon: "error",
                            button: "Voltar"
                        });
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });

        // post form
        $body = $("body");

        $(document).ready(function () {

            $('#enviar').click(function () {
                var frm = $("#form");

                frm.submit(function (e) {

                    e.preventDefault();
                    $body.addClass("loading");
                    $.ajax({
                        type: frm.attr('method'),
                        url: frm.attr('action'),
                        data: frm.serialize(),
                        dataType: "json",

                        success: function (retorno) {
                            $body.removeClass("loading");
                            console.log(retorno);
                            if (retorno.erro === undefined) {
                                swal({
                                    title: "Good job!",
                                    text: "You clicked the button!",
                                    icon: "success",
                                    timer: 2000,
                                    showConfirmButton: false
                                });
                            } else {
                                swal({
                                    title: "Dados Invalidos!",
                                    text: retorno.erro,
                                    icon: "success",
                                    timer: 2000,
                                    showConfirmButton: false
                                });
                            }

                        },
                        error: function (resp) {
                            $body.removeClass("loading");
                            var erro = resp.erro;
                            alert(erro);
                        }
                    });
                });
            });
        });
    </script>

    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    %>
</html>