<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="rightt">
    <div class="top">
        <button id="menu-btn">
            <i class='bx bx-menu'></i>
        </button>
       
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