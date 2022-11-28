<%@page import="model.Funcionario"%>
<%@page import="model.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>


<div class="card">
    <div class="card-header text-center" style="background: #ff968a;">
        <h3 style="color: white">Cadastrar fornecedor</h3>
    </div>
    <div class="card-body">
        <form action="CadastrarFornecedor" method="post">
            <div class="row w-75 mx-auto">
                <div  class="form-group col-6">
                    <label for="codigoPessoa">Código:</label>
                    <input class="form-control" type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${fornecedor.codigoPessoa > 0 ? fornecedor.codigoPessoa : ""}"/>
                </div>
                <div class="form-group col-6">
                    <label for="nomePessoa">Nome:</label>
                    <input class="form-control" type="text" id="nomePessoa" name="nomePessoa" placeholder="Nome" required value="${fornecedor.nomePessoa}"/>
                </div>
            </div> 

            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                    <label for="dataNascimento">Data do Contrato:</label>
                    <input class="form-control" type="date" id="dataNascimento" name="dataNascimento" required value="${fornecedor.dataNascimento}"/>
                </div>
                <div class="form-group col-6">
                    <label for="cpfPessoa">CPF:</label>
                    <input class="form-control" type="text" id="cpfPessoa" name="cpfPessoa" placeholder="CPF sem pontos e sem traços" required value="${fornecedor.cpfPessoa}"/>
                </div>
            </div>

            <div class="row w-75 mx-auto">
                <div class="form-group col-6">   
                    <label for="rgPessoa">RG</label>
                    <input   class="form-control" type="text" id="rgPessoa" name="rgPessoa" placeholder="RG sem pontos e sem traço" required value="${fornecedor.rgPessoa}" />
                </div> 
                <div class="form-group col-6">
                    <label for="telefonePessoa">Telefone</label>
                    <input  data-mask="(00) 00000-0000" class="form-control" type="text" id="telefonePessoa" name="telefonePessoa" placeholder="(**) *****-****" required value="${fornecedor.telefonePessoa}"/>
                </div>
            </div>


            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="celularPessoa">celular</label>
                    <input  data-mask="(00) 00000-0000" class="form-control" type="text" id="celularPessoa" name="celularPessoa" placeholder="(**) *****-****" required value="${fornecedor.celularPessoa}"/>
                </div>
                <div class="form-group col-6">
                    <label for="emailPessoa">Email</label>
                    <input class="form-control" type="text" id="emailPessoa" name="emailPessoa" placeholder="email@email.com" required value="${fornecedor.emailPessoa}" />
                </div>
            </div>


            <div class="row w-75 mx-auto">  
                <div class="form-group col-6">
                    <label for="cepPessoa">Cep</label>
                    <input class="form-control" data-mask="00000-000" type="text" id="cepPessoa" name="cepPessoa" required value="${fornecedor.cepPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="estadoPessoa">Estado</label>
                    <input class="form-control" type="text" id="estadoPessoa" name="estadoPessoa" required value="${fornecedor.estadoPessoa}" />
                </div>



            </div>


            <div class="row w-75 mx-auto">  
                <div class="form-group col-6">
                    <label for="enderecoPessoa">Endereco</label>
                    <input class="form-control" type="text" id="enderecoPessoa" name="enderecoPessoa" required value="${fornecedor.enderecoPessoa}" />
                </div>

                <div class="form-group col-6">
                    <label for="numeroCasa">Numero</label>
                    <input class="form-control"  type="text" id="numeroCasa" name="numeroCasa" required value="${fornecedor.numeroCasa}" />
                </div>


            </div>


            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                    <label for="cidadePessoa">Cidade</label>
                    <input class="form-control" type="text" id="cidadePessoa" name="cidadePessoa" required value="${fornecedor.cidadePessoa}" />
                </div>  
                <div class="form-group col-6">
                    <label for="bairroPessoa">Bairro</label>
                    <input class="form-control" type="text" id="bairroPessoa" name="bairroPessoa" required value="${fornecedor.bairroPessoa}" />
                </div>
            </div> 

            <div class="row w-75 mx-auto"> 
                <div class="form-group col-6">
                    <label for="obsFornecedor">Sobre</label>
                    <input class="form-control" type="text" id="obsFornecedor" name="obsFornecedor" required value="${fornecedor.obsFornecedor}" />
                </div>
                <div class="form-group col-6">
                    <label for="razaoSocial">Razão social</label>
                    <input  class="form-control"  id="razaoSocial" name="razaoSocial" required value="${fornecedor.razaoSocial}" />
                </div>

            </div>
            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                    <label for="contatoVendedor">Contato Vendedor</label>
                    <input  class="form-control"  id="contatoVendedor" name="contatoVendedor" required value="${fornecedor.contatoVendedor}" />
                </div>

            </div>


            <div class="row mt-3">
                <div class="form-group col-12 text-center">
                    <button style="background: #ff968a ; border: 1px solid #ff968a" class="btn btn-success" type="submit">Gravar</button>
                    <a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-secondary" href="ListarFornecedor">Voltar</a>
                </div>
            </div>     
        </form>
    </div>
</div>

<script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
<script>

    $(document).ready(function () {

        function limpa_formulário_cep() {
            $("#enderecoPessoa").val("");
            $("#bairroPessoa").val("");
            $("#cidadePessoa").val("");
            $("#estadoPessoa").val("");

        }

        $("#cepPessoa").blur(function () {


            var cep = $(this).val().replace(/\D/g, '');

            if (cep !== "") {

                var validacep = /^[0-9]{8}$/;


                if (validacep.test(cep)) {

                    $("#enderecoPessoa").val("");
                    $("#bairroPessoa").val("...");
                    $("#cidadePessoa").val("...");
                    $("#estadoPessoa").val("...");

                    $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                        if (!("erro" in dados)) {
                            //Atualiza os campos com os valores da consulta.
                            $("#enderecoPessoa").val(dados.logradouro);
                            $("#bairroPessoa").val(dados.bairro);
                            $("#cidadePessoa").val(dados.localidade);
                            $("#estadoPessoa").val(dados.uf);

                            $("#enderecoPessoa").removeAttr("disabled");
                            $("#bairroPessoa").removeAttr("disabled");


                        } else {

                            limpa_formulário_cep();
                            swal({
                                title: "Dados invalidos!",
                                text: "CEP não encontrado!!",
                                icon: "error",
                                button: "Ok"
                            });
                        }
                    });
                } else {

                    limpa_formulário_cep();
                    swal({
                        title: "Dados invalidos!",
                        text: "Formato do CEP invalido!!",
                        icon: "error",
                        button: "Voltar"
                    });
                }
            } else {

                limpa_formulário_cep();
            }
        });
    });


    var options = {
        onKeyPress: function (cpf, a, b, op) {
            var masks = ['000.000.000-000', '00.000.000/0000-00'];
            $('#cpfPessoa').mask((cpf.length > 14) ? masks[1] : masks[0], op);
        }
    };

    $('#cpfPessoa').length > 11 ? $('#cpfPessoa').mask('00.000.000/0000-00', options) : $('#cpfPessoa').mask('000.000.000-00#', options);

</script>              

<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>