<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%  
    Funcionario func = (Funcionario) request.getSession(false).getAttribute("funcionario");   
%>  
<div class="rightt">
            <div class="top">
                <button id="menu-btn">
                    <i class='bx bx-menu'></i>
                </button>
                <div class="toogler">
                    <i class='bx bx-sun active'></i>
                    <i class='bx bxs-moon' ></i>
                </div>
                <div class="perfil-logado">
                    <div class="info">
                        <p>Logando com: <b><%=funcionario.getNomePessoa()%></b></p>
                        <small class="text-muted"><%= funcionario.getCargo().getNomeCargo()%></small> 
                    </div>
                    <div class="notification">
                        <i class='bx bxs-bell'></i>
                    </div>
                </div>
            </div>
        </div>