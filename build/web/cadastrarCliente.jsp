<%@page import="model.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <link rel="stylesheet" href="Estilo/cadastroCliente.css">
    </head>

    <body>
        <div class="login-root">
            <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
                <div class="loginbackground box-background--white padding-top--64">
                    <div class="loginbackground-gridContainer">
                        <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
                            <div class="box-root"
                                 style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
                            </div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
                            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;">
                            </div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
                            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
                            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
                            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;">
                            </div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
                            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;">
                            </div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
                            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
                            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;">
                            </div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
                            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;">
                            </div>
                        </div>
                    </div>
                </div>


                <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
                    <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
                        <h1>Faça parte do nosso time !</h1>
                    </div>
                    <div class="a">
                        <div class="formbg">
                            <div class="formbg-inner padding-horizontal--48">
                                <span class="padding-bottom--15">Cadastre-se</span>

                                <form action="CadastrarCliente" method="post" id="stripe-login">
                                    <div class="details">

                                        <div hidden="">
                                            <input type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${cliente.codigoPessoa > 0 ? cliente.codigoPessoa : ""}"/>
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="nomePessoa">Nome</label>
                                            <input type="text" id="nomePessoa" name="nomePessoa" placeholder="Nome" required value="${cliente.nomePessoa}"/>
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="dataNascimento">Data de nascimento</label>
                                            <input type="date" id="dataNascimento" name="dataNascimento" required value="${cliente.dataNascimento}"/>
                                        </div>
                                        <div class="input-box field padding-bottom--24">
                                            <label for="cpfPessoa">CPF</label>
                                            <input data-mask="000.000.000-00" type="text" id="cpfPessoa" name="cpfPessoa" placeholder="Sem pontos e sem traços" required value="${cliente.cpfPessoa}"/>
                                        </div>
                                        <div class="input-box field padding-bottom--24">
                                            <label for="rgPessoa">RG</label>
                                            <input   type="text" id="rgPessoa" name="rgPessoa" placeholder="Sem pontos e sem traço"  required value="${cliente.rgPessoa}" />
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="telefonePessoa">Telefone</label>
                                            <input  data-mask="(00) 00000-0000" type="text" id="telefonePessoa" name="telefonePessoa" placeholder="(**) *****-****" required value="${cliente.telefonePessoa}"/>
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="celularPessoa">Celular</label>
                                            <input  data-mask="(00) 00000-0000" type="text" id="celularPessoa" name="celularPessoa" placeholder="(**) *****-****" required value="${cliente.celularPessoa}"/>
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="emailPessoa">Email</label>
                                            <input type="text" id="emailPessoa" name="emailPessoa" placeholder="email@email.com" required value="${cliente.emailPessoa}" />
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="cepPessoa">CEP</label>
                                            <input data-mask="00000-000" type="text" id="cepPessoa" name="cepPessoa" required value="${cliente.cepPessoa}" />
                                        </div>
                                        
                                        

                                        <div class="input-box field padding-bottom--24">
                                            <label for="enderecoPessoa">Endereco</label>
                                            <input type="text" id="enderecoPessoa" name="enderecoPessoa" required value="${cliente.enderecoPessoa}" />
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="numeroPessoa">Numero</label>
                                            <input type="text" id="numeroCasa" name="numeroCasa" required value="${cliente.numeroCasa}" />
                                        </div>
                                        
                                        <div class="input-box field padding-bottom--24">
                                            <label for="estadoPessoa">Estado</label>
                                            <input type="text" id="estadoPessoa" name="estadoPessoa" required value="${cliente.estadoPessoa}" />
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="cidadePessoa">Cidade</label>
                                            <input type="text" id="cidadePessoa" name="cidadePessoa" required value="${cliente.cidadePessoa}" />
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="bairroPessoa">Bairro</label>
                                            <input type="text" id="bairroPessoa" name="bairroPessoa" required value="${cliente.bairroPessoa}" />
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="loginCliente">Login</label>
                                            <input type="text" id="loginCliente" name="loginCliente" required value="${cliente.loginCliente}" />                
                                        </div>

                                        <div class="input-box field padding-bottom--24">
                                            <label for="senhaCliente">Senha</label>
                                            <input minlength="3" maxlength="8" type="password" id="senhaCliente" name="senhaCliente" required value="${cliente.senhaCliente}" />
                                        </div>


                                        <div class="field padding-bottom--24">
                                            <input type="submit" name="submit" value="Cadastrar">
                                        </div>
                                        <div class="field">
                                            <span class="erro">${mensagem}</span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="footer-link padding-top--24">
                            <span>Já tém um conta? <a href="login.html">Entre</a></span>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
        <script src="${pageContext.request.contextPath}/Scripts/PesquisarPessoa.js"></script> 

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
                    $("#bairroPessoa").val("...");
                    $("#cidadePessoa").val("...");
                    $("#estadoPessoa").val("...");


                    //Consulta o webservice viacep.com.br/
                    $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                        if (!("erro" in dados)) {
                            //Atualiza os campos com os valores da consulta.
                            
                            $("#bairroPessoa").val(dados.bairro);
                            $("#cidadePessoa").val(dados.localidade);
                            $("#estadoPessoa").val(dados.uf);                     
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

</script>

        
    </body>
</html>
