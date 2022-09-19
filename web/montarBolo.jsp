<%@page import="model.Cliente"%>
<%@page import="model.FormatoBolo"%>
<%@page import="model.CoberturaBolo"%>
<%@page import="model.RecheioBolo"%>
<%@page import="model.SaborBolo"%>
<%@page import="model.MontaBolo"%>
<%@page import="model.PesoBolo"%>
<%@page import="model.Cargo"%>
<%@page import="java.util.List"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
<%
    Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("funcionario");
    Cliente cliente = (Cliente) request.getSession(false).getAttribute("cliente");
    if (funcionario != null || cliente != null) {
%>
-->
<jsp:include page="/cabecalho.jsp"/>

<div class="card">
    <div class="card-header text-center">
        <h3>Monte seu bolo</h3>
    </div>
    <div class="card-body">
        <form action="CadastrarBolo" method="post">
            <div class="row w-75 mx-auto">
                <div hidden="" class="form-group col-6">
                    <label for="codigoPessoa">Código:</label><!<!-- value="${cliente.codigoPessoa > 0 ? cliente.codigoPessoa : ""}" -->
                    <input class="form-control" type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${funcionario.codigoPessoa > 0 ? funcionario.codigoPessoa : ""}" />
                </div>
                
                <div hidden="">
                    <input type="text" name="codigoBolo" id="codigoBolo" readonly>
                </div>
                
                
                
                <div class="row w-75 mx-auto">  
                <div class="form-group col-12">
                    <label for="">Peso:</label>
                    <%
                        List<PesoBolo> listaP = (List<PesoBolo>) request.getAttribute("peso");
                        
                        MontaBolo montaBolo = (MontaBolo) request.getAttribute("montaBolo"); 
                    %>
                    <select id="codigoPeso" 
                            name="codigoPeso" class="form-control" required>
                        <option value="">Selecione...</option>
                        <%
                            for (PesoBolo pesoBolo : listaP) {
                        %>
                        <option value="<%= pesoBolo.getCodigoPeso()%>" <%= montaBolo.getPesoBolo().getCodigoPeso()== pesoBolo.getCodigoPeso()? "selected" : ""%> ><%= pesoBolo.getPesoB()%></option>
                        
                        <%
                            }
                        %>
                        <option value=""></option>
                    </select>
                </div>
                </div>
                <div class="row w-75 mx-auto">  
                <div class="form-group col-12">
                    <label for="">Sabor do Bolo:</label>
                    <%
                        List<SaborBolo> listaS = (List<SaborBolo>) request.getAttribute("sabor");
                        
                        
                    %>
                    <select id="codigoSabor" 
                            name="codigoSabor" class="form-control" required>
                        <option value="">Selecione...</option>
                        <%
                            for (SaborBolo saborBolo : listaS) {
                        %>
                        <option value="<%= saborBolo.getCodigoSabor()%>" <%= montaBolo.getSaborBolo().getCodigoSabor()== saborBolo.getCodigoSabor()? "selected" : ""%> ><%= saborBolo.getSaborB()%></option>
                       
                        <%
                            }
                        %>
                        
                    </select>
                </div>
                </div>
                <div class="row w-75 mx-auto">  
                <div class="form-group col-12">
                    <label for="">Recheio:</label>
                    <%
                        List<RecheioBolo> listaR = (List<RecheioBolo>) request.getAttribute("recheio");
                        
                        
                    %>
                    <select id="codigoSabor" 
                            name="codigoRecheio" class="form-control" required>
                        <option value="">Selecione...</option>
                        <%
                            for (RecheioBolo recheioBolo : listaR) {
                        %>
                        <option value="<%= recheioBolo.getCodigoRecheio()%>" <%= montaBolo.getRecheioBolo().getCodigoRecheio()== recheioBolo.getCodigoRecheio()? "selected" : ""%> ><%= recheioBolo.getRecheioB()%></option>
                       
                        <%
                            }
                        %>
                        
                    </select>
                </div>
                </div>
                      <div class="row w-75 mx-auto">  
                <div class="form-group col-12">
                    <label for="">Cobertura:</label>
                    <%
                        List<CoberturaBolo> listaC = (List<CoberturaBolo>) request.getAttribute("cobertura");
                        
                        
                    %>
                    <select id="codigoCobertura" 
                            name="codigoCobertura" class="form-control" required>
                        <option value="">Selecione...</option>
                        <%
                            for (CoberturaBolo coberturaBolo : listaC) {
                        %>
                        <option value="<%= coberturaBolo.getCodigoCobertura()%>" <%= montaBolo.getCoberturaBolo().getCodigoCobertura()== coberturaBolo.getCodigoCobertura()? "selected" : ""%> ><%= coberturaBolo.getCoberturaB()%></option>
                       
                        <%
                            }
                        %>
                        
                    </select>
                </div>
                </div>     <div class="row w-75 mx-auto">  
                <div class="form-group col-12">
                    <label for="">Formato:</label>
                    <%
                        List<FormatoBolo> listaF = (List<FormatoBolo>) request.getAttribute("formato");
                        
                        
                    %>
                    <select id="codigoFormato" 
                            name="codigoFormato" class="form-control" required>
                        <option value="">Selecione...</option>
                        <%
                            for (FormatoBolo formatoBolo : listaF) {
                        %>
                        <option value="<%= formatoBolo.getCodigoFormato()%>" <%= montaBolo.getFormatoBolo().getCodigoFormato()== formatoBolo.getCodigoFormato()? "selected" : ""%> ><%= formatoBolo.getFormatoB()%></option>

                        <%
                            }
                        %>
                        
                    </select>
                </div>
                </div>
                 <div class="form-group col-12">
                    <label for="">Descreva a decoracao:</label>
                    <input class="form-control" type="text" id="decoracao" name="decoracao" placeholder="Nome" />
                </div>     
                  
                        
                        <!<!-- falta descrição, e puxar o codigo do cliente -->
            </div>
                <div class="row mt-3">
                <div class="form-group col-12 text-center">
                    <button class="btn btn-success" type="submit">Gravar</button>
                    <a class="btn btn-secondary" href="homeFuncionario.jsp">Voltar</a>
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