<%@page import="model.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center">
        <h3>Cadastrar cliente</h3>
    </div>
    <div class="card-body">
        <form action="CadastrarCliente" method="post">
            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                    <label for="codigoPessoa">Código:</label>
                    <input class="form-control" type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${cliente.codigoPessoa > 0 ? cliente.codigoPessoa : ""}"/>
                </div>
                <div class="form-group col-6">
                    <label for="nomePessoa">Nome:</label>
                    <input class="form-control" type="text" id="nomePessoa" name="nomePessoa" placeholder="Nome" required value="${cliente.nomePessoa}"/>
                </div>
            </div>         
            <div class="row w-75 mx-auto">
                <div class="form-group col-6">
                    <label for="dataNascimento">Data de nascimento:</label>
                    <input class="form-control" type="date" id="dataNascimento" name="dataNascimento" required value="${cliente.dataNascimento}"/>
                </div>
                <div class="form-group col-6">
                    <label for="cpfPessoa">CPF:</label>
                    <input data-mask="000.000.000-00" class="form-control" type="text" id="cpfPessoa" name="cpfPessoa" placeholder="CPF sem pontos e sem traços" required value="${cliente.cpfPessoa}"/>
                </div>
            </div>
            <div class="row w-75 mx-auto">              
                <div class="form-group col-6">
                    <label for="rgPessoa">RG</label>
                    <input   class="form-control" type="text" id="rgPessoa" name="rgPessoa" placeholder="RG sem pontos e sem traço"  required value="${cliente.rgPessoa}" />
                </div> 
                <div class="form-group col-6">
                    <label for="telefonePessoa">Telefone</label>
                    <input  data-mask="(00) 00000-0000" class="form-control" type="text" id="telefonePessoa" name="telefonePessoa" placeholder="(**) *****-****" required value="${cliente.telefonePessoa}"/>
                </div>
            </div>
            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="celularPessoa">celular</label>
                    <input  data-mask="(00) 00000-0000" class="form-control" type="text" id="celularPessoa" name="celularPessoa" placeholder="(**) *****-****" required value="${cliente.celularPessoa}"/>
                </div>
                <div class="form-group col-6">
                    <label for="emailPessoa">Email</label>
                    <input class="form-control" type="text" id="emailPessoa" name="emailPessoa" placeholder="email@email.com" required value="${cliente.emailPessoa}" />
                </div>
            </div>
            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="enderecoPessoa">Endereco</label>
                    <input class="form-control" type="text" id="enderecoPessoa" name="enderecoPessoa" required value="${cliente.enderecoPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="numeroCasa">Numero</label>
                    <input class="form-control" type="text" id="numeroCasa" name="numeroCasa" required value="${cliente.numeroCasa}" />
                </div>
                <div class="form-group col-6">
                    <label for="estadoPessoa">Estado</label>
                    <input class="form-control" type="text" id="estadoPessoa" name="estadoPessoa" required value="${cliente.estadoPessoa}" />

                </div>
            </div>
            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="cepPessoa">Cep</label>
                    <input class="form-control" type="text" id="cepPessoa" name="cepPessoa" required value="${cliente.cepPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="cidadePessoa">Cidade</label>
                    <input class="form-control" type="text" id="cidadePessoa" name="cidadePessoa" required value="${cliente.cidadePessoa}" />
                </div>
            </div>
            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="bairroPessoa">Bairro</label>
                    <input class="form-control" type="text" id="bairroPessoa" name="bairroPessoa" required value="${cliente.bairroPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="obsCliente">Sobre</label>
                    <input class="form-control" type="text" id="obsCliente" name="obsCliente" required value="${cliente.obsCliente}" />
                </div>
            </div>    
            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="loginCliente">Login</label>
                    <input class="form-control" type="text" id="loginCliente" name="loginCliente" required value="${cliente.loginCliente}" />                
                </div>
                <div class="form-group col-6">
                    <label for="senhaCliente">Senha</label>
                    <input minlength="3" maxlength="8" class="form-control" type="password" id="senhaCliente" name="senhaCliente" required value="${cliente.senhaCliente}" />
                </div>
            </div>   
            <div class="row mt-3">
                <div class="form-group col-12 text-center">
                    <button class="btn btn-success" type="submit">Gravar</button>
                    <a class="btn btn-secondary" href="homeCliente.jsp">Voltar</a>
                </div>
            </div>     
        </form>
    </div>           
</div>
<jsp:include page="/rodape.jsp"/>