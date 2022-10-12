<%@page import="model.Cargo"%>
<%@page import="model.Funcionario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionarios != null) {
%>
<jsp:include page="/cabecalho.jsp"/>

<div class="card">
    <div class="card-header text-center">
        <h3>Cadastrar funcionario</h3>
    </div>
    <div class="card-body">
        <form action="CadastrarFuncionario" method="post">
            <div class="row w-75 mx-auto">
                <div hidden="" class="form-group col-6">
                    <label for="codigoPessoa">Código:</label>
                    <input class="form-control" type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${funcionario.codigoPessoa > 0 ? funcionario.codigoPessoa : ""}"/>
                </div>
                <div class="form-group col-6">
                    <label for="nomePessoa">Nome:</label>
                    <input class="form-control" type="text" id="nomePessoa" name="nomePessoa" placeholder="Nome" required value="${funcionario.nomePessoa}"/>
                </div>
            </div> 
            <div class="row w-75 mx-auto">  
                <div class="form-group col-6">
                    <label for="codigoCargo">Cargo:</label>
                    <%
                        List<Cargo> lista = (List<Cargo>) request.getAttribute("cargo");
                        Funcionario funcionario = (Funcionario) request.getAttribute("funcionario");
                    %>
                    <select id="codigoCargo" 
                            name="codigoCargo" class="form-control" required>
                        <option value="">Selecione...</option>
                        <%
                            for (Cargo cargo : lista) {
                        %>
                        <option value="<%= cargo.getCodigoCargo()%>" <%= funcionario.getCargo().getCodigoCargo() == cargo.getCodigoCargo() ? "selected" : ""%> ><%= cargo.getNomeCargo()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                    <label for="dataNascimento">Data de nascimento:</label>
                    <input class="form-control" type="date" id="dataNascimento" name="dataNascimento" required value="${funcionario.dataNascimento}"/>
                </div>
                <div class="form-group col-6">
                    <label for="cpfPessoa">CPF:</label>
                    <input data-mask="000.000.000-00" class="form-control" type="text" id="cpfPessoa" name="cpfPessoa" placeholder="CPF sem pontos e sem traços" required value="${funcionario.cpfPessoa}"/>
                </div>
            </div>

            <div class="row w-75 mx-auto">

                <div class="form-group col-6">
                    <label for="rgPessoa">RG</label>
                    <input   class="form-control" type="text" id="rgPessoa" name="rgPessoa" placeholder="RG sem pontos e sem traço" data-mask="000.000.000/0" required value="${funcionario.rgPessoa}" />
                </div> 
                <div class="form-group col-6">
                    <label for="telefonePessoa">Telefone</label>
                    <input  data-mask="(00) 00000-0000" class="form-control" type="text" id="telefonePessoa" name="telefonePessoa" placeholder="(**) *****-****" required value="${funcionario.telefonePessoa}"/>
                </div>
            </div>


            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="celularPessoa">celular</label>
                    <input  data-mask="(00) 00000-0000" class="form-control" type="text" id="celularPessoa" name="celularPessoa" placeholder="(**) *****-****" required value="${funcionario.celularPessoa}"/>
                </div>
                <div class="form-group col-6">
                    <label for="emailPessoa">Email</label>
                    <input class="form-control" type="text" id="emailPessoa" name="emailPessoa" placeholder="email@email.com" required value="${funcionario.emailPessoa}" />
                </div>
            </div>


            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                    <label for="cepPessoa">Cep</label>
                    <input class="form-control" type="text" id="cepPessoa" name="cepPessoa" required value="${funcionario.cepPessoa}" />
                </div>

                <div class="form-group col-6">
                    <label for="estadoPessoa">Estado</label>
                    <input class="form-control" type="text" id="estadoPessoa" name="estadoPessoa" required value="${funcionario.estadoPessoa}" />

                </div>
            </div>


            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="enderecoPessoa">Endereco</label>
                    <input class="form-control" type="text" id="enderecoPessoa" name="enderecoPessoa" required value="${funcionario.enderecoPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="cidadePessoa">Cidade</label>
                    <input class="form-control" type="text" id="cidadePessoa" name="cidadePessoa" required value="${funcionario.cidadePessoa}" />
                </div>
            </div>


            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="bairroPessoa">Bairro</label>
                    <input class="form-control" type="text" id="bairroPessoa" name="bairroPessoa" required value="${funcionario.bairroPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="obsFuncionario">Sobre</label>
                    <input class="form-control" type="text" id="obsFuncionario" name="obsFuncionario" required value="${funcionario.obsFuncionario}" />
                </div>
            </div> 


            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="loginFuncionario">Login</label>
                    <input class="form-control" type="text" id="loginFuncionario" name="loginFuncionario" required value="${funcionario.loginFuncionario}" />                
                </div>
                <div class="form-group col-6">
                    <label for="senhaFuncionario">Senha</label>
                    <input minlength="3" maxlength="8" class="form-control" type="password" id="senhaFuncionario" name="senhaFuncionario" required value="${funcionario.senhaFuncionario}" />
                </div>
            </div> 


            <div class="row mt-3">
                <div class="form-group col-12 text-center">
                    <button class="btn btn-success" type="submit">Gravar</button>
                    <a class="btn btn-secondary" href="ListarFuncionario">Voltar</a>
                </div>
            </div>     
        </form>
    </div>               
</div>


<jsp:include page="/rodape.jsp"/>


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