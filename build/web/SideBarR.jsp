<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="rightt">
    <div class="action">
        <div class="profile" onclick="menuToggle();">
            <i id="dropIcon" class='bx bxs-user'></i>
        </div>
        <div class="menu">

            <%if (funcionario != null) {%>
            <h3>
                <%=funcionario.getNomePessoa()%>
                <div>
                    <%=funcionario.getCargo().getNomeCargo()%>
                </div>
            </h3>
            <ul>
                <li>
                    <i class='bx bx-user'></i>
                    <a href="ConsultarFuncionario?codigoFuncionario=<%=funcionario.getCodigoPessoa()%>">Perfil</a>
                </li>
                <li>
                    <i class='bx bx-menu' ></i>
                    <a href="ListarCompra">Menu Funcionario</a>
                </li>
                <li>
                    <i class='bx bx-log-out' ></i>
                    <a href="Logout">Logout</a>
                </li>
            </ul>
            <%}%>

        </div>
    </div>
</div>
<script>
    function menuToggle() {
        const toggleMenu = document.querySelector('.menu');
        toggleMenu.classList.toggle('active');
    }
</script>

<style>
    .icons-size {
        color: #333;
        font-size: 14px;
    }

    .action {
        position: absolute;
        right: 20px;
        top: 20px
    }

    .action ul {
        display: block;
        list-style-type: disc;
        margin-block-start: 0.58em;
        margin-block-end: 0.75em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
    }


    .action .profile {
        cursor: pointer;
        height: 40px;
        overflow: hidden;
        position: relative;
        width: 40px;
        top: 15px;
        margin-right: 50px;
    }

    .action .profile #dropIcon {
        font-size: 3rem;
        top: auto;
        position: absolute;
        left: 0;
    }

    .action .menu {
        background-color: #FFF;
        box-sizing: 0 5px 25px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        padding: 10px 20px;
        position: absolute;
        right: -10px;
        width: 200px;
        transition: 0.5s;
        top: 120px;
        visibility: hidden;
        opacity: 0;
        z-index: 1;
    }

    .action .menu.active {
        opacity: 1;
        top: 80px;
            right: 25px;
        visibility: visible;
        z-index: 1;
    }

    .action .menu::before {
        background-color: #fff;
        content: '';
        height: 20px;
        position: absolute;
        right: 30px;
        transform: rotate(45deg);
        top: -5px;
        width: 20px;
    }

    .action .menu h3 {
        color: #555;
        font-size: 20px;
        font-weight: 600;
        line-height: 1.3em;
        padding: 20px 0px;
        text-align: center;
        width: 100%;
    }

    .action .menu h3 div {
        color: #818181;
        font-size: 14px;
        font-weight: 400;
    }

    .action .menu ul li {
        align-items: center;
        border-top: 1px solid rgba(0, 0, 0, 0.05);
        display: flex;
        justify-content: left;
        list-style: none;
        padding: 10px 5px;
    }

    .action .menu ul li img {
        max-width: 20px;
        margin-right: 10px;
        opacity: 0.5;
        transition: 0.5s
    }

    .action .menu ul li i{
        font-size: 1.8rem;
        margin-right: 15px;
    }

    .action .menu ul li a {
        display: inline-block;
        color: #555;
        font-size: 14px;
        font-weight: 600;
        padding-left: 1px;
        text-decoration: none;
        text-transform: uppercase;
        transition: 0.5s;
    }

    .action .menu ul li:hover img {
        opacity: 1;
    }

    .action .menu ul li:hover a {
        color: orangered;
    }

    @media (max-width:799px) {
        .action {
            position: absolute;
            right: 30px;
            top: -1px;
        }
    }

    @media (max-width:477px) {
        .action {
            position: absolute;
            right: 30px;
            top: -1px;
        }
    }</style>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>

