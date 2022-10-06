<%@page import="model.Funcionario"%>
<%@page import="model.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
   
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if ( funcionario != null) {
%>
<jsp:include page="/cabecalho.jsp"/>


<div class="card">
    <div class="card-header text-center">
        <h3>Cadastrar fornecedor</h3>
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
                    <label for="dataNascimento">Data de nascimento:</label>
                    <input class="form-control" type="date" id="dataNascimento" name="dataNascimento" required value="${fornecedor.dataNascimento}"/>
                </div>
                <div class="form-group col-6">
                    <label for="cpfPessoa">CPF:</label>
                    <input data-mask="000.000.000-00" class="form-control" type="text" id="cpfPessoa" name="cpfPessoa" placeholder="CPF sem pontos e sem traços" required value="${fornecedor.cpfPessoa}"/>
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
                    <label for="enderecoPessoa">Endereco</label>
                    <input class="form-control" type="text" id="enderecoPessoa" name="enderecoPessoa" required value="${fornecedor.enderecoPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="estadoPessoa">Estado</label>
                    <input class="form-control" type="text" id="estadoPessoa" name="estadoPessoa" required value="${fornecedor.estadoPessoa}" />

                </div>
            </div>
                    
                    
            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="cepPessoa">Cep</label>
                    <input class="form-control" type="text" id="cepPessoa" name="cepPessoa" required value="${fornecedor.cepPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="cidadePessoa">Cidade</label>
                    <input class="form-control" type="text" id="cidadePessoa" name="cidadePessoa" required value="${fornecedor.cidadePessoa}" />
                </div>
            </div>
                
                
            <div class="row w-75 mx-auto">                  
                <div class="form-group col-6">
                    <label for="bairroPessoa">Bairro</label>
                    <input class="form-control" type="text" id="bairroPessoa" name="bairroPessoa" required value="${fornecedor.bairroPessoa}" />
                </div>
                <div class="form-group col-6">
                    <label for="obsFornecedor">Sobre</label>
                    <input class="form-control" type="text" id="obsFornecedor" name="obsFornecedor" required value="${fornecedor.obsFornecedor}" />
                </div>
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
                    <button class="btn btn-success" type="submit">Gravar</button>
                    <a class="btn btn-secondary" href="ListarFornecedor">Voltar</a>
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