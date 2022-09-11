<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Estilos/login.css">
        <title>teste login </title>
    </head>
    <body>
        <div class="main-login">
            <div class="left-login">
                <h1>Faça login <br> entre para o nosso time </h1>
                <img src="Estilos/animate.svg" class="left-login-image" alt="animate">
            </div>
            <div class="right-login">
                <div class="card-login">
                    <h1>LOGIN</h1>
                    <form method="post" action="Login">
                        <a href="index.jsp">voltar</a>
                        <div class="textfield">
                            <label for="login">Usuario</label>
                            <input type="text" id="loginCliente" name="login" placeholder="Usuario" required="" >
                            <div class="textfield">
                                <label for="senha">Senha</label>
                                <input type="password" id="senhaCliente" name="senha" placeholder="Senha" required="">
                            </div> 
                            <a href="NovoCliente">cadastrar</a>
                            <button class="btn-login" type="submit">Login</button>
                        </div>
                    </form>
                    <div class="">
                        <span class="text-danger">${mensagem}</span>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
