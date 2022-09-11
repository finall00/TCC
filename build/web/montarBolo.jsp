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
    Funcionario funcionarios = (Funcionario) request.getSession(false).getAttribute("funcionario");
    if (funcionarios != null) {
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
                    <label for="codigoPessoa">Código:</label>
                    <input class="form-control" type="text" id="codigoPessoa" name="codigoPessoa" readonly value="${funcionario.codigoPessoa > 0 ? funcionario.codigoPessoa : ""}"/>
                </div>
                
                
                
                <div class="row w-75 mx-auto">  
                <div class="form-group col-6">
                    <label for="codigoPeso">Peso:</label>
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
                        
                    </select>
                </div>
                </div>
                <div class="row w-75 mx-auto">  
                <div class="form-group col-6">
                    <label for="codigoCargo">Cargo:</label>
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
                <div class="form-group col-6">
                    <label for="codigoCargo">Cargo:</label>
                    <%
                        List<RecheioBolo> listaR = (List<RecheioBolo>) request.getAttribute("recheio");
                        
                        
                    %>
                    <select id="codigoSabor" 
                            name="codigoSabor" class="form-control" required>
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
                        <!<!-- falta cobertura, formato, descrição, e puxar o codigo do cliente -->
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