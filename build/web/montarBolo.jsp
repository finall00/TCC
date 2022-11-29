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

<body>
    <div class="card">
        <div style="background: #ff968a;" class="card-header text-center">
            <h3 style="color: white" >Monte seu bolo</h3>
        </div>
        <div class="card-body ">


            <form action="CadastrarBolo" method="post">

                <div hidden="" class="form-group col-6">
                    <label for="codigoPessoa">Código:</label>
                    <input class="form-control" type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${cliente.codigoPessoa > 0 ? cliente.codigoPessoa : ""}" />
                </div>

                <div hidden="">
                    <input type="text" name="codigoBolo" id="codigoBolo" readonly>
                </div>

                <div class="row w-50 mx-auto">

                    <div class="form-group col-6"> 
                        <%if (funcionario != null) {%>
                        <a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-primary" href="NovoPesoB">+</a>
                        <%}%>
                        <label for="">Peso:</label>
                        <%
                            List<PesoBolo> listaP = (List<PesoBolo>) request.getAttribute("peso");

                            MontaBolo montaBolo = (MontaBolo) request.getAttribute("montaBolo");
                        %>
                        <select id="codigoPeso" name="codigoPeso"   class="form-control" required>
                            <option value="">Selecione...</option>
                            <%
                                for (PesoBolo pesoBolo : listaP) {
                            %>
                            <option value="<%= pesoBolo.getCodigoPeso()%>" <%= montaBolo.getPesoBolo().getCodigoPeso() == pesoBolo.getCodigoPeso() ? "selected" : ""%> ><%= pesoBolo.getPesoB()%></option>

                            <%
                                }
                            %>                        

                        </select>

                    </div>
                </div>
                <div class="row w-50 mx-auto">  

                    <div class="form-group col-6">
                        <%if (funcionario != null) {%>
                        <a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-primary" href="NovoSaborB">+</a>
                        <%}%>
                        <label for="">Sabor do Bolo:</label>
                        <%
                            List<SaborBolo> listaS = (List<SaborBolo>) request.getAttribute("sabor");


                        %>
                        <select id="codigoSabor" name="codigoSabor" class="form-control" required>
                            <option value="">Selecione...</option>
                            <%                            for (SaborBolo saborBolo : listaS) {
                            %>
                            <option value="<%= saborBolo.getCodigoSabor()%>" <%= montaBolo.getSaborBolo().getCodigoSabor() == saborBolo.getCodigoSabor() ? "selected" : ""%> ><%= saborBolo.getSaborB()%></option>

                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="row w-50 mx-auto">  
                    <div class="form-group col-6">
                        <%if (funcionario != null) {%>
                        <a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-primary" href="NovoRecheioB">+</a>
                        <%}%>
                        <label for="">Recheio:</label>
                        <%
                            List<RecheioBolo> listaR = (List<RecheioBolo>) request.getAttribute("recheio");


                        %>
                        <select id="codigoSabor" name="codigoRecheio"  class="form-control" required>
                            <option value="">Selecione...</option>
                            <%                            for (RecheioBolo recheioBolo : listaR) {
                            %>
                            <option value="<%= recheioBolo.getCodigoRecheio()%>" <%= montaBolo.getRecheioBolo().getCodigoRecheio() == recheioBolo.getCodigoRecheio() ? "selected" : ""%> ><%= recheioBolo.getRecheioB()%></option>

                            <%
                                }
                            %>

                        </select>
                    </div>
                </div>
                <div class="row w-50 mx-auto">  
                    <div class="form-group col-6">
                        <%if (funcionario != null) {%>
                        <a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-primary" href="NovaCoberturaB">+</a>
                        <%}%>
                        <label for="">Cobertura:</label>
                        <%
                            List<CoberturaBolo> listaC = (List<CoberturaBolo>) request.getAttribute("cobertura");


                        %>
                        <select id="codigoCobertura" name="codigoCobertura" class="form-control" required>
                            <option value="">Selecione...</option>
                            <%                            for (CoberturaBolo coberturaBolo : listaC) {
                            %>
                            <option value="<%= coberturaBolo.getCodigoCobertura()%>" <%= montaBolo.getCoberturaBolo().getCodigoCobertura() == coberturaBolo.getCodigoCobertura() ? "selected" : ""%> ><%= coberturaBolo.getCoberturaB()%></option>

                            <%
                                }
                            %>

                        </select>
                    </div>
                </div> 
                <div class="row w-50 mx-auto">  
                    <div class="form-group col-6">
                        <%if (funcionario != null) {%>
                        <a style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-primary" href="NovoFormatoB">+</a> 
                        <%}%>
                        <label for="">Formato:</label>

                        <%
                            List<FormatoBolo> listaF = (List<FormatoBolo>) request.getAttribute("formato");
                        %>

                        <select id="codigoFormato" name="codigoFormato" class="form-control" required>                     
                            <option value="">Selecione...</option>
                            <%
                                for (FormatoBolo formatoBolo : listaF) {
                            %>
                            <option value="<%= formatoBolo.getCodigoFormato()%>" <%= montaBolo.getFormatoBolo().getCodigoFormato() == formatoBolo.getCodigoFormato() ? "selected" : ""%> ><%= formatoBolo.getFormatoB()%></option>

                            <%
                                }
                            %>              
                        </select>
                    </div>

                </div>

                <div class="row w-50 mx-auto">  
                    <div class="col-6" >
                        <label for="">Descreva a decoracao:</label>
                        <input class="form-control row-3" rows="3" type="text" id="decoracao" name="decoracao" placeholder="Nome" />
                    </div> 

                    <div class="row mt-3">
                        <div class="form-group col-6 text-center">
                            <button style="background: #ff968a ; border: 1px solid #ff968a" class="btn btn-success" type="submit">Gravar</button>
                            <a class="btn btn-secondary" href="ListarBolo" > Bolos Montados</a>
                            <input style="background: #6c757d ; border: 1px solid #6c757d; color: white" class="btn btn-secondary" type="button" value="Voltar" onclick="history.go(-1)">
                        </div>
                    </div>
                </div>

            </form>


        </div>
    </div>
</body>

<jsp:include page="/rodape.jsp"/>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>