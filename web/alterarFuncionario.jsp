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
        <h3>alterar funcionario</h3>
    </div>
    <div class="card-body">
        <form action="CadastrarFuncionario" method="post">
            <div class="row w-75 mx-auto">
                <div  class="form-group col-6">
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
                    <label for="enderecoPessoa">Endereco</label>
                    <input class="form-control" type="text" id="enderecoPessoa" name="enderecoPessoa" required value="${funcionario.enderecoPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="numeroCasa">Numero Casa</label>
                    <input type="text" name="numeroCasa" id="numeroCasa" placeholder="Numero" required>
                </div>
                <div class="form-group col-6">
                    <label for="estadoPessoa">Estado</label>
                    <input class="form-control" type="text" id="estadoPessoa" name="estadoPessoa" required value="${funcionario.estadoPessoa}" />

                </div>
            </div>


            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="cepPessoa">Cep</label>
                    <input class="form-control" type="text" id="cepPessoa" name="cepPessoa" required value="${funcionario.cepPessoa}" />
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
                    <label for="numeroCasa">Numero</label>
                    <input class="form-control" type="text" id="numeroCasa" name="numeroCasa" required value="${funcionario.numeroCasa}" />
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
                    
                    <input class="btn btn-secondary"  type="button" value="Voltar" onclick="history.go(-1)">
                    <a class="btn btn-danger" href="ExcluirFuncionario?codigoFuncionario=<%= funcionario.getCodigoPessoa()%>">Excluir</a>
                </div>
            </div>     
        </form>
    </div>
</div>
<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>