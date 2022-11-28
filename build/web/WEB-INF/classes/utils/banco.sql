create table cargo(
    codigoCargo serial not null primary key,
    nomeCargo varchar(40) not null,	
    descCargo varchar(200) not null	
);

create table produto(
     codigoProduto serial not null primary key,
     nomeProduto varchar(40) not null,
     dataValidade Date not null,
     estoqueProduto int not null,
     vlrCusto decimal not null,
     vlrVenda decimal not null,
     codigoBarra varchar(40) not null,
     descricaoProduto varchar(800) not null,
     imagem varchar(80)
   
);



create table pessoa(
    codigoPessoa serial not null primary key,
    nomePessoa varchar(60) not null,
    dataNascimento date not null,
    cpfPessoa varchar(25) not null unique,
    rgPessoa varchar(14) not null unique,
    telefonePessoa varchar(17),
    celularPessoa varchar(17) not null,
    emailPessoa varchar(40) not null unique,
    enderecoPessoa varchar(200) not null,
    estadoPessoa varchar(2) not null,
    cepPessoa  varchar(20) not null,
    cidadePessoa varchar(30) not null,
    bairroPessoa varchar(50) not null,
    numeroCasa varchar(5) not null
);

create table cliente(
    codigoCliente int not null primary key references pessoa(codigoPessoa),
    obsCliente varchar(500),
    loginCliente varchar(22) not null,
    senhaCliente varchar(16) not null
);

create table funcionario(
    codigoFuncionario int not null primary key references pessoa(codigoPessoa),
    obsFuncionario varchar(500),
    loginFuncionario varchar(22) not null,
    senhaFuncionario varchar(16) not null,
    codigoCargo int not null references cargo(codigoCargo)
);

create table Fornecedor(
    codigoFornecedor int not null primary key references pessoa(codigoPessoa),
    razaoSocial varchar(40),
    contatoVendedor varchar(30) not null,
    obsFornecedor varchar(500)
);

-- itens bolo -->

create table CoberturaBolo(
codigoCobertura serial not null primary key,
coberturaB varchar
);

create table FormatoBolo (
 codigoFormato  serial not null primary key,
  formatoB varchar   
);

create table PesoBolo(
 codigoPeso  serial not null primary key,
  pesoB varchar   
);

create table RecheioBolo(
 codigoRecheio  serial not null primary key,
  recheioB varchar   
);

create table Saborbolo (
 codigoSabor  serial not null primary key,
  saborB varchar   
);



create table Bolo(
	codigoBolo serial not null primary key,
    decoracaobolo varchar,
    saborBolo int not null references saborbolo(codigoSabor),
    coberturaBolo int not null references coberturabolo(codigoCobertura),
    recheioBolo int not null references recheioBolo(codigoRecheio),
    pesoBolo int not null references pesoBolo(codigoPeso),
    formatoBolo int not null references formatoBolo(codigoFormato),
    codigopessoa int not null references pessoa(codigoPessoa)
);


create Table compra(
codigoPedido serial not null primary key,
    codigoPessoa int not null references pessoa(codigoPessoa),
    data_venda date not null,
    vlrTotalVenda DECIMAL,
    obsVenda varchar
);

create Table itenscompra(
	codigoProduto int not null,
	codigoVenda int not null primary key references compra(codigopedido),
	qtdProduto decimal not null, 
	vlrProduto decimal not null
);



 -- functions

create or replace function cadastrarPessoa(codigo_Pessoa int, nome_Pessoa varchar, data_Nascimento date, cpf_Pessoa varchar, rg_Pessoa varchar, telefone_Pessoa varchar, celular_Pessoa varchar, email_Pessoa varchar, endereco_Pessoa varchar, estado_Pessoa varchar, cep_Pessoa varchar, cidade_Pessoa varchar, bairro_Pessoa varchar, numero_Casa varchar) Returns int as $$
    declare
        retornoPessoa int := 0;
    begin
        if codigo_Pessoa > 0 then
            update pessoa set  codigoPessoa = codigo_Pessoa, nomePessoa = nome_Pessoa, dataNascimento = data_Nascimento, cpfPessoa = cpf_Pessoa, rgPessoa = rg_Pessoa, telefonePessoa = telefone_Pessoa, celularPessoa = celular_Pessoa, emailPessoa = email_Pessoa, enderecoPessoa = endereco_Pessoa, estadoPessoa = estado_Pessoa, cepPessoa = cep_Pessoa, cidadePessoa = cidade_Pessoa, bairroPessoa = bairro_Pessoa, numeroCasa = numero_Casa where codigoPessoa = codigo_Pessoa returning codigoPessoa into retornoPessoa;
        else
            insert into pessoa values(default, nome_Pessoa, data_Nascimento,  cpf_Pessoa, rg_Pessoa, telefone_Pessoa, celular_Pessoa, email_Pessoa, endereco_Pessoa, estado_Pessoa, cep_Pessoa, cidade_Pessoa, bairro_Pessoa, numero_Casa) returning codigoPessoa into retornoPessoa;
        end if;
        return retornoPessoa;
    end;	
$$ language plpgsql;

--Procedures 
create or replace procedure cadastrarMarca(codigo_Marca int, nome_Marca varchar) as $$
    begin
        if codigo_Marca > 0 then
            update marca set nomeMarca = nome_Marca where codigoMarca = codigo_Marca;
        else
            insert into marca values(default, nome_Marca);
        end if;
    end;
$$ language plpgsql;


create or replace procedure cadastrarCargo(codigo_Cargo int, nome_Cargo varchar, desc_Cargo varchar) as $$
    begin
        if codigo_Cargo > 0 then
            update cargo set nomeCargo = nome_Cargo, descCargo = desc_Cargo where codigoCargo = codigo_Cargo;
        else
            insert into cargo values(default, nome_Cargo, desc_Cargo);
        end if;
    end;
$$ language plpgsql;


create or replace procedure cadastrarProduto(codigo_Produto int, nome_Produto varchar, data_Validade Date, estoque_Produto int, vlr_Custo float, vlr_Venda float, codigo_Barra varchar, descricao_Produto varchar, imagem_Produto varchar) as $$          
    begin
     
        if codigo_Produto > 0 then
           update produto set codigoProduto = codigo_Produto, nomeProduto = nome_Produto, dataValidade = data_Validade, estoqueProduto = estoque_Produto, vlrCusto = vlr_Custo, vlrVenda = vlr_Venda, codigoBarra = codigo_Barra, descricaoProduto = descricao_Produto, imagem = imagem_Produto where codigoProduto = codigo_Produto;
        else
            insert into produto values(default, nome_Produto, data_Validade, estoque_Produto, vlr_Custo, vlr_Venda, codigo_Barra, descricao_Produto, imagem_Produto);
        end if;
    end;
$$ language plpgsql;


create or replace procedure cadastrarFornecedor(codigo_Pessoa int, nome_Pessoa varchar, data_Nascimento date, cpf_Pessoa varchar, rg_Pessoa varchar, telefone_Pessoa varchar, celular_Pessoa varchar, email_Pessoa varchar, endereco_Pessoa varchar, estado_Pessoa varchar, cep_Pessoa varchar, cidade_Pessoa varchar, bairro_Pessoa varchar, numero_Casa varchar,  razao_Social varchar, contato_Vendedor varchar, obs_Fornecedor varchar) as $$
    declare
        idFornec int := 0;
        idPessoa int := 0;
    begin
       select into  idFornec codigoFornecedor from fornecedor where codigoFornecedor = codigo_Pessoa;
       select into idPessoa codigopessoa from pessoa where codigoPessoa = codigo_Pessoa;
       if idFornec > 0 and idPessoa > 0 then
           update fornecedor set codigoFornecedor = (select cadastrarPessoa(codigo_Pessoa, nome_Pessoa, data_Nascimento, cpf_Pessoa, rg_Pessoa, telefone_Pessoa, celular_Pessoa, email_Pessoa, endereco_Pessoa, estado_Pessoa, cep_Pessoa, cidade_Pessoa, bairro_Pessoa, numero_Casa)),  razaoSocial= razao_Social, contatoVendedor = contato_Vendedor, obsFornecedor = obs_Fornecedor where codigoFornecedor = codigo_Pessoa;
       else
           
           insert into fornecedor values((SELECT cadastrarPessoa(codigo_Pessoa, nome_Pessoa, data_Nascimento, cpf_Pessoa, rg_Pessoa, telefone_Pessoa, celular_Pessoa, email_Pessoa, endereco_Pessoa, estado_Pessoa, cep_Pessoa, cidade_Pessoa, bairro_Pessoa, numero_Casa )), razao_Social, contato_Vendedor, obs_Fornecedor );
         end if;
    end;
$$ language plpgsql;



create or replace procedure cadastrarFuncionario(codigo_Pessoa int, nome_Pessoa varchar, data_Nascimento date, cpf_Pessoa varchar, rg_Pessoa varchar, telefone_Pessoa varchar, celular_Pessoa varchar, email_Pessoa varchar, endereco_Pessoa varchar, estado_Pessoa varchar, cep_Pessoa varchar, cidade_Pessoa varchar, bairro_Pessoa varchar, numero_Casa varchar,  obs_Funcionario varchar, login_Funcionario varchar, senha_Funcionario varchar, codigo_Cargo int ) as $$
    declare
        idFunc int := 0;
        idPessoa int := 0;
    begin
       select into  idFunc codigoFuncionario from funcionario where codigoFuncionario = codigo_Pessoa;
       select into idPessoa codigopessoa from pessoa where codigoPessoa = codigo_Pessoa;
       if idFunc > 0 and idPessoa > 0 then
           update funcionario set codigoFuncionario = (select cadastrarPessoa(codigo_Pessoa, nome_Pessoa, data_Nascimento, cpf_Pessoa, rg_Pessoa, telefone_Pessoa, celular_Pessoa, email_Pessoa, endereco_Pessoa, estado_Pessoa, cep_Pessoa, cidade_Pessoa, bairro_Pessoa, numero_Casa)),  obsFuncionario = obs_Funcionario, loginFuncionario = login_Funcionario, senhaFuncionario = senha_Funcionario, codigoCargo = codigo_Cargo where codigoFuncionario = codigo_Pessoa;
       else
           
           insert into funcionario values((SELECT cadastrarPessoa(codigo_Pessoa, nome_Pessoa, data_Nascimento, cpf_Pessoa, rg_Pessoa, telefone_Pessoa, celular_Pessoa, email_Pessoa, endereco_Pessoa, estado_Pessoa, cep_Pessoa, cidade_Pessoa, bairro_Pessoa, numero_Casa )), obs_Funcionario, login_Funcionario, senha_Funcionario, codigo_Cargo );
         end if;
    end;
$$ language plpgsql;




create or replace procedure cadastrarCliente(codigo_Pessoa int, nome_Pessoa varchar, data_Nascimento date, cpf_Pessoa varchar, rg_Pessoa varchar, telefone_Pessoa varchar, celular_Pessoa varchar, email_Pessoa varchar, endereco_Pessoa varchar, estado_Pessoa varchar, cep_Pessoa varchar, cidade_Pessoa varchar, bairro_Pessoa varchar, numero_Casa varchar,  obs_Cliente varchar, login_Cliente varchar, senha_Cliente varchar) as $$
    declare
        idCliente int := 0;
        idPessoa int := 0;
    begin
       select into  idCliente codigoCliente from cliente where codigoCliente = codigo_Pessoa;
       select into idPessoa codigopessoa from pessoa where codigoPessoa = codigo_Pessoa;
       if idCliente > 0 and idPessoa > 0 then
           update cliente set codigoCliente = (select cadastrarPessoa(codigo_Pessoa, nome_Pessoa, data_Nascimento, cpf_Pessoa, rg_Pessoa, telefone_Pessoa, celular_Pessoa, email_Pessoa, endereco_Pessoa, estado_Pessoa, cep_Pessoa, cidade_Pessoa, bairro_Pessoa, numero_Casa)),  obsCliente = obs_Cliente, loginCliente = login_Cliente, senhaCliente = senha_Cliente where codigoCliente = codigo_Pessoa;
       else
           
           insert into cliente values((SELECT cadastrarPessoa(codigo_Pessoa, nome_Pessoa, data_Nascimento, cpf_Pessoa, rg_Pessoa, telefone_Pessoa, celular_Pessoa, email_Pessoa, endereco_Pessoa, estado_Pessoa, cep_Pessoa, cidade_Pessoa, bairro_Pessoa, numero_Casa)), obs_Cliente, login_Cliente, senha_Cliente );
         end if;
    end;
$$ language plpgsql;

-- procedure de itens Bolo

create or replace procedure cadastrarCobertura(codigo_Cobertura int, cobertura_B varchar) as $$
    begin
        if codigo_Cobertura > 0 then
            update coberturabolo set  coberturaB = cobertura_B where codigoCobertura = codigo_Cobertura;
        else
            insert into coberturabolo values(default, cobertura_B);
        end if;
    end;
$$ language plpgsql;

create or replace procedure cadastrarFormato (codigo_Formato int, formato_B varchar) as $$
    begin
        if codigo_Formato > 0 then
            update formatobolo set formatoB = formato_B  where codigoFormato = codigo_Formato;
        else
            insert into formatobolo values(default, formato_B);
        end if;
    end;
$$ language plpgsql;

create or replace procedure cadastrarPeso(codigo_Peso int, peso_B varchar) as $$
    begin
        if codigo_Peso > 0 then
            update pesobolo set pesoB = peso_B  where codigoPeso = codigo_Peso;
        else
            insert into pesobolo values (default,peso_B);
        end if;
    end;
$$ language plpgsql;

create or replace procedure cadastrarRecheio(codigo_Recheio int, recheio_B varchar) as $$
    begin
        if codigo_Recheio > 0 then
            update recheiobolo set recheioB = recheio_B where codigoRecheio = codigo_Recheio;
        else
            insert into recheiobolo values (default, recheio_B );
        end if;
    end;
$$ language plpgsql;

create or replace procedure cadastrarSabor(codigo_Sabor int, sabor_B varchar) as $$
    begin
        if codigo_Sabor > 0 then
            update saborbolo set saborB = sabor_B where codigoSabor = codigo_Sabor;
        else
            insert into saborbolo values (default, sabor_B );
        end if;
    end;
$$ language plpgsql;

create or replace procedure cadastrarBolo(Codigo_Bolo int , Decoracao_bolo varchar, Sabor_Bolo  int, Cobertura_Bolo int, Recheio_Bolo int, Peso_Bolo int, Formato_Bolo int, Codigo_Pessoa int) as $$          
    begin
     
        if Codigo_Bolo > 0 then
           update bolo set codigo_Bolo = codigo_Bolo, decoracaobolo = Decoracao_Bolo, SaborBolo = Sabor_Bolo, CoberturaBolo = Cobertura_Bolo, recheioBolo = Recheio_Bolo, pesoBolo = Peso_Bolo, formatoBolo = Formato_Bolo, codigo_pessoa = Codigo_Pessoa where codigobolo = codigo_Bolo;
        else
            insert into bolo values(default, Decoracao_bolo, Sabor_Bolo, Cobertura_Bolo, Recheio_Bolo, Peso_Bolo, Formato_Bolo, Codigo_Pessoa);
        end if;
    end;
$$ language plpgsql;


--> teste

call caddastrarCargo(0, 'Admin', 'Administra'); 

call cadastrarfuncionario(0, 'ADM', '1000-01-01', '0', '88', '0000000', '0000', 'adm@email.com', '0', '0', '0', '0', '0', '0','0', 'Admin', 'admin', 1);

