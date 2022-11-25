//
//--> colocar em todas as paginas
//<%
//    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
//    if (cliente != null) {
//%>
//
//<%
//    } else {
//        response.sendRedirect(request.getContextPath() + "/");
//    }
//%>
//

//
//<div class="pedidos-recentes">
//                        <%
//                            if (lista != null) {
//                                for (PedidoVenda compra : lista) {
//                        %>
//
//                        <div class="pedidos">
//                            <div class="tittle" style="margin-bottom: 20px;">
//                                <span class="id-text">ID do pedido:</span>
//                                <p class="Id-pedido"><%=compra.getCodigoPedido()%></p>
//                            </div>
//                         
//                            <div class="middle">
//                                <div class="left">
//                                    <p style="font-size: 1.30rem;"><strong>Cliente:</strong> <%= compra.getPessoa().getNomePessoa()%></p>
//                                    <h3 style="margin-left: -1.5px; font-size: 1rem;"><%=compra.getDataVenda()%></h3>
//                                    <h1>R$ <%= compra.getVlrTotalVenda()%></h1>
//                                                                        
//                                </div>
//                                <div class="product-photo" >
//                                    <img src="<%= (String) request.getContextPath() + "/imagens/" + compra.getProduto().getImagem()%>" alt="">
//                                </div>
//                            </div>
//                            <h3 style="margin-bottom: 0.60rem; margin-left: -2px;"><strong><%=compra.getObsVenda()%></strong></h3>
//                            <a href="ConsultarCompra?codigoP=<%=compra.getCodigoPedido()%>"><h2>Detalhes</h2></a>
//                        </div>
//                        <%  }
//                        } else {
//                        %>
//                        <div class="pedidos">
//                            <div class="tittle">
//                                <span class="id-text">Não há pedidos</span>
//                            </div>
//                        </div>
//                        <%
//                            }%>
//
//                    </div>

//
//
//<form action="CadastrarFuncionario" method="post">
//            <div class="row w-75 mx-auto">
//                <div hidden="" class="form-group col-6">
//                    <label for="codigoPessoa">Código:</label>
//                    <input class="form-control" type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${funcionario.codigoPessoa > 0 ? funcionario.codigoPessoa : ""}"/>
//                </div>
//                <div class="form-group col-6">
//                    <label for="nomePessoa">Nome:</label>
//                    <input class="form-control" type="text" id="nomePessoa" name="nomePessoa" placeholder="Nome" required value="${funcionario.nomePessoa}"/>
//                </div>
//            </div> 
//            <div class="row w-75 mx-auto">  
//                <div class="form-group col-6">
//                    <label for="codigoCargo">Cargo:</label>
//                    <%
//                        List<Cargo> lista = (List<Cargo>) request.getAttribute("cargo");
//                        Funcionario funcionario = (Funcionario) request.getAttribute("funcionario");
//                    %>
//                    <select id="codigoCargo" 
//                            name="codigoCargo" class="form-control" required>
//                        <option value="">Selecione...</option>
//                        <%
//                            for (Cargo cargo : lista) {
//                        %>
//                        <option value="<%= cargo.getCodigoCargo()%>" <%= funcionario.getCargo().getCodigoCargo() == cargo.getCodigoCargo() ? "selected" : ""%> ><%= cargo.getNomeCargo()%></option>
//                        <%
//                            }
//                        %>
//                    </select>
//                </div>
//            </div>
//            <div class="row w-75 mx-auto">
//                <div class="form-group col-6">
//                    <label for="dataNascimento">Data de nascimento:</label>
//                    <input class="form-control" type="date" id="dataNascimento" name="dataNascimento" required value="${funcionario.dataNascimento}"/>
//                </div>
//                <div class="form-group col-6">
//                    <label for="cpfPessoa">CPF:</label>
//                    <input data-mask="000.000.000-00" class="form-control" type="text" id="cpfPessoa" name="cpfPessoa" placeholder="CPF sem pontos e sem traços" required value="${funcionario.cpfPessoa}"/>
//                </div>
//            </div>
//
//            <div class="row w-75 mx-auto">
//
//                <div class="form-group col-6">
//                    <label for="rgPessoa">RG</label>
//                    <input   class="form-control" type="text" id="rgPessoa" name="rgPessoa" placeholder="RG sem pontos e sem traço" data-mask="000.000.000/0" required value="${funcionario.rgPessoa}" />
//                </div> 
//                <div class="form-group col-6">
//                    <label for="telefonePessoa">Telefone</label>
//                    <input  data-mask="(00) 00000-0000" class="form-control" type="text" id="telefonePessoa" name="telefonePessoa" placeholder="(**) *****-****" required value="${funcionario.telefonePessoa}"/>
//                </div>
//            </div>
//
//
//            <div class="row w-75 mx-auto">                  
//                <div class="form-group col-6">
//                    <label for="celularPessoa">celular</label>
//                    <input  data-mask="(00) 00000-0000" class="form-control" type="text" id="celularPessoa" name="celularPessoa" placeholder="(**) *****-****" required value="${funcionario.celularPessoa}"/>
//                </div>
//                <div class="form-group col-6">
//                    <label for="emailPessoa">Email</label>
//                    <input class="form-control" type="text" id="emailPessoa" name="emailPessoa" placeholder="email@email.com" required value="${funcionario.emailPessoa}" />
//                </div>
//            </div>
//
//
//            <div class="row w-75 mx-auto">
//                <div class="form-group col-6">
//                    <label for="cepPessoa">Cep</label>
//                    <input class="form-control" type="text" id="cepPessoa" name="cepPessoa" required value="${funcionario.cepPessoa}" />
//                </div>
//
//                <div class="form-group col-6">
//                    <label for="estadoPessoa">Estado</label>
//                    <input class="form-control" type="text" id="estadoPessoa" name="estadoPessoa" required value="${funcionario.estadoPessoa}" />
//
//                </div>
//            </div>
//
//
//            <div class="row w-75 mx-auto">                  
//                <div class="form-group col-6">
//                    <label for="enderecoPessoa">Endereco</label>
//                    <input class="form-control" type="text" id="enderecoPessoa" name="enderecoPessoa" required value="${funcionario.enderecoPessoa}" />
//                </div>
//                <div class="form-group col-6">
//                    <label for="numeroCasa">Numero</label>
//                    <input class="form-control" type="number" id="numeroCasa" name="numeroCasa" required value="${funcionario.numeroCasa}" />
//                </div>
//                <div class="form-group col-6">
//                    <label for="cidadePessoa">Cidade</label>
//                    <input class="form-control" type="text" id="cidadePessoa" name="cidadePessoa" required value="${funcionario.cidadePessoa}" />
//                </div>
//            </div>
//
//
//            <div class="row w-75 mx-auto">                  
//                <div class="form-group col-6">
//                    <label for="bairroPessoa">Bairro</label>
//                    <input class="form-control" type="text" id="bairroPessoa" name="bairroPessoa" required value="${funcionario.bairroPessoa}" />
//                </div>
//                <div class="form-group col-6">
//                    <label for="obsFuncionario">Sobre</label>
//                    <input class="form-control" type="text" id="obsFuncionario" name="obsFuncionario" required value="${funcionario.obsFuncionario}" />
//                </div>
//            </div> 
//
//
//            <div class="row w-75 mx-auto">                  
//                <div class="form-group col-6">
//                    <label for="loginFuncionario">Login</label>
//                    <input class="form-control" type="text" id="loginFuncionario" name="loginFuncionario" required value="${funcionario.loginFuncionario}" />                
//                </div>
//                <div class="form-group col-6">
//                    <label for="senhaFuncionario">Senha</label>
//                    <input minlength="3" maxlength="8" class="form-control" type="password" id="senhaFuncionario" name="senhaFuncionario" required value="${funcionario.senhaFuncionario}" />
//                </div>
//            </div> 
//
//
//            <div class="row mt-3">
//                <div class="form-group col-12 text-center">
//                    <button class="btn btn-success" type="submit">Gravar</button>
//                  
//                    <input  class="btn btn-secondary" type="button" value="Voltar" onclick="history.go(-1)">
//                </div>
//            </div>     
//        </form>
//
//
