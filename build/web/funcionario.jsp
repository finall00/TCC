<%@page import="java.sql.SQLException"%>
<%@page import="model.Cargo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="pt-br">
    <%

        Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
        if (funcionario != null) {
    %>  


    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Funcionario</title>

        <link href="https://fonts.googleapis.com/css?family=Poppins:400,600&display=swap" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="EstilosFunc/TempDash.css">
        <link rel="stylesheet" href="EstilosFunc/funcionario.css">


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
                
                <h1>Funcionario</h1>
                <div class="products-action">
                    <div class="actions">
                        <div class="i">
                            <div class="action-icon">                                
                                <a href="NovoFuncionario">
                                        <i class='bx bxs-user-plus' ></i>
                                </a>
                               

                            </div>
                            <div class="tittle">
                                <p>Cadastar Funcionario</p>
                            </div>
                        </div>
                    </div>
                    <div class="actions">
                        <div class="i">
                            <div class="action-icon">
                                <a href="ListarFuncionario" ><i class='bx bxs-user-detail'></i></a>
                            </div>
                            <div class="tittle">
                                <p>Listar Funcionario</p>
                            </div>
                        </div>
                    </div>
                    <div class="actions">
                        <div class="i">
                            <div class="action-icon">
                                <a href="NovoCargo">
                                    <i class='bx bx-id-card' ></i>
                                </a>
                            </div>
                            <div class="tittle">
                                <p>Cadastrar cargo</p>
                            </div>
                        </div>
                    </div>
                </div>

                

            </main>

            <!--**************************Sidebar right*********************************-->
            <%@include file="SideBarR.jsp" %>
        </div>
        <script src="ScriptFunc/dash.js"></script>
        <script src="ScriptFunc/funcionario.js"></script>
      
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
<script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    %>
</html>