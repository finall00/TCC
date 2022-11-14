<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="rightt">
    <div class="top">
        <button id="menu-btn">
            <i class='bx bx-menu'></i>
        </button>

        <div class="perfil-logado">
            <div class="icons">
                <div class="action">
                    <div id="divU" class="profile" onclick="menuToggle();">
                        <a id="login-btn" class="bx bxs-user"></a>
                    </div>
                    <div class="menu">                   
                        <%
                        if (funcionario != null) {%>

                        <h3><%= funcionario.getNomePessoa()%><br/><span><%= funcionario.getCargo().getNomeCargo()%></span></h3>

                        <ul>
                            <li>
                                <a href="ConsultarFuncionario?codigoFuncionario=<%=funcionario.getCodigoPessoa()%>">
                                    <span class="icon">
                                        <ion-icon class="bx bxs-user"></ion-icon>
                                    </span>
                                    <span style="font-size: 2rem">perfil</span>
                                </a>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <a href="ListarProduto"> <!-- mudar para ListarCompra -->
                                    <span class="icon">
                                        <ion-icon class="bx bx-menu"></ion-icon>
                                    </span>
                                    <span style="font-size: 1.78rem">Home</span>
                                </a>
                            </li>
                        </ul>

                        <a href="Logout" class="login"><h3>logout</h3></a>
                        <%}%>         

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function menuToggle() {
        const toggleMenu = document.querySelector(".menu");
        toggleMenu.classList.toggle("active");
    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>

<style>
    /*dropMenu*/
body::-webkit-scrollbar {
    width: 4px;
    /* width of the entire scrollbar */
}

body::-webkit-scrollbar-track {
    background: none;
    /* color of the tracking area */
}

body::-webkit-scrollbar-thumb {
    background-color: none;
    border: none;
}




.navigation.active {
    width: 100px;
}

.navigation ul {
    position: absolute;
    top: 0;
    left: 0;
    width: 300%;
}




.navigation ul li:nth-child(1) {
    margin-bottom: 30px;
    pointer-events: none;
}



.navigation ul li:hover a,
.navigation ul li.hovered a {
    color: red;
}

.navigation ul li a .icon {
    position: relative;
    display: block;
    min-width: 60px;
    height: 60px;
    text-align: center;
    padding-top: 13px;
}


.Text {
    position: relative;
    top: -40px;
    text-decoration: none;
    right: 15px;
    color: white;
}

.navigation ul li a .icon ion-icon {
    font-size: 1.75em;
}

.navigation ul li a .title {
    position: relative;
    display: block;
    padding: 0 10px;
    height: 60px;
    line-height: 60px;
    text-align: start;
    white-space: nowrap;
    margin-top: 10px;
}


/* main */
.action {
    margin-top: 15px;
    padding-right: 40px;
    top: 20px;
    right: 30px;
}

.action .profile {
    position: relative;
    font-size: 2.75rem;
    width: 40px;
    height: 45px;
    border-radius: 50%;
    overflow: hidden;
    cursor: pointer;
 
}


.action ul li a .icon ion-icon {
    font-size: 2rem;
}

.action ul li a .icon {
    margin-right: 10px;
}

/* estilo do menu pra mudar onde fica o menu */
.action .menu {
    position: absolute;
    top: 120px;
    right: +5px;
    padding: 20px 20px;
    background: #e5e1cd;
    width: 180px;
    transition: 0.2s;
    visibility: hidden;
    opacity: 0;
    z-index: 11;
    margin-right: 40px;
    border-radius: 18px;
}

.action .menu.active {
    top: 90px;
    visibility: visible;
    opacity: 1;
    margin-right: 40px;
}

.action .menu::before {
    content: "";
    position: absolute;
    top: -5px;
    right: 40px;
    width: 20px;
    height: 20px;
    /* tem que ser a mesma cor la do .action .menu */
    background: #e5e1cd;
    transform: rotate(45deg);
}

.action .menu h3 {
    width: 100%;
    text-align: center;
    font-size: 18px;
    padding: 20px 0;
    font-weight: 500;
    color: rgb(46, 45, 45);
    line-height: 1.5em;
}

.action .menu h3 span {
    font-size: 18px;
    color: #7a7777;
    font-weight: 300;
}

.action .menu ul li {
    list-style: none;
    padding: 16px 0;
    border-top: 1px solid rgba(0, 0, 0, 0.05);
    display: flex;
    align-items: center;
}


.action .menu ul li a {
    display: flex;
    align-items: center;
    text-decoration: none;
    color: #555;
    font-weight: 500;
    transition: 0.5s;
}



@media (max-width: 991px) {
    .navigation {
        left: -300px;
    }

    .navigation.active {
        width: 300px;
        left: 0px;
    }

    .main {
        width: 100%;
        left: 0;
    }

    .main.active {
        left: 300px;
    }

}

@media (max-width: 768px) {
}

@media (max-width: 480px) {


    .navigation {
        width: 100%;
        left: -100%;
        z-index: 1000;
    }

    .navigation.active {
        width: 100%;
        left: 0;
    }

    .toggle {
        z-index: 10001;
    }

    .home {
        text-decoration: none;

    }


    .main.active {
        left: 0;
    }

    .main.active .toggle {
        color: #fff;
        position: fixed;
        right: 0;

    }

}
</style>
