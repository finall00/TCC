PGDMP     3    2            
    z            confeitaria    11.15    11.15 z    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    19879    confeitaria    DATABASE     �   CREATE DATABASE confeitaria WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE confeitaria;
             postgres    false            �            1255    20567 _   cadastrarbolo(integer, character varying, integer, integer, integer, integer, integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.cadastrarbolo(codigo_bolo integer, decoracao_bolo character varying, sabor_bolo integer, cobertura_bolo integer, recheio_bolo integer, peso_bolo integer, formato_bolo integer, codigo_pessoa integer)
    LANGUAGE plpgsql
    AS $$          
    begin
     
        if Codigo_Bolo > 0 then
           update bolo set codigo_Bolo = codigo_Bolo, decoracaobolo = Decoracao_Bolo, SaborBolo = Sabor_Bolo, CoberturaBolo = Cobertura_Bolo, recheioBolo = Recheio_Bolo, pesoBolo = Peso_Bolo, formatoBolo = Formato_Bolo, codigo_pessoa = Codigo_Pessoa where codigobolo = codigo_Bolo;
        else
            insert into bolo values(default, Decoracao_bolo, Sabor_Bolo, Cobertura_Bolo, Recheio_Bolo, Peso_Bolo, Formato_Bolo, Codigo_Pessoa);
        end if;
    end;
$$;
 �   DROP PROCEDURE public.cadastrarbolo(codigo_bolo integer, decoracao_bolo character varying, sabor_bolo integer, cobertura_bolo integer, recheio_bolo integer, peso_bolo integer, formato_bolo integer, codigo_pessoa integer);
       public       postgres    false            �            1255    19967 =   cadastrarcargo(integer, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.cadastrarcargo(codigo_cargo integer, nome_cargo character varying, desc_cargo character varying)
    LANGUAGE plpgsql
    AS $$
    begin
        if codigo_Cargo > 0 then
            update cargo set nomeCargo = nome_Cargo, descCargo = desc_Cargo where codigoCargo = codigo_Cargo;
        else
            insert into cargo values(default, nome_Cargo, desc_Cargo);
        end if;
    end;
$$;
 x   DROP PROCEDURE public.cadastrarcargo(codigo_cargo integer, nome_cargo character varying, desc_cargo character varying);
       public       postgres    false            �            1255    21124 <  cadastrarcliente(integer, character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.cadastrarcliente(codigo_pessoa integer, nome_pessoa character varying, data_nascimento date, cpf_pessoa character varying, rg_pessoa character varying, telefone_pessoa character varying, celular_pessoa character varying, email_pessoa character varying, endereco_pessoa character varying, estado_pessoa character varying, cep_pessoa character varying, cidade_pessoa character varying, bairro_pessoa character varying, numero_casa character varying, obs_cliente character varying, login_cliente character varying, senha_cliente character varying)
    LANGUAGE plpgsql
    AS $$
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
$$;
 8  DROP PROCEDURE public.cadastrarcliente(codigo_pessoa integer, nome_pessoa character varying, data_nascimento date, cpf_pessoa character varying, rg_pessoa character varying, telefone_pessoa character varying, celular_pessoa character varying, email_pessoa character varying, endereco_pessoa character varying, estado_pessoa character varying, cep_pessoa character varying, cidade_pessoa character varying, bairro_pessoa character varying, numero_casa character varying, obs_cliente character varying, login_cliente character varying, senha_cliente character varying);
       public       postgres    false            �            1255    20495 .   cadastrarcobertura(integer, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.cadastrarcobertura(codigo_cobertura integer, cobertura_b character varying)
    LANGUAGE plpgsql
    AS $$
    begin
        if codigo_Cobertura > 0 then
            update coberturabolo set  coberturaB = cobertura_B where codigoCobertura = codigo_Cobertura;
        else
            insert into coberturabolo values(default, cobertura_B);
        end if;
    end;
$$;
 c   DROP PROCEDURE public.cadastrarcobertura(codigo_cobertura integer, cobertura_b character varying);
       public       postgres    false            �            1255    20496 ,   cadastrarformato(integer, character varying) 	   PROCEDURE     s  CREATE PROCEDURE public.cadastrarformato(codigo_formato integer, formato_b character varying)
    LANGUAGE plpgsql
    AS $$
    begin
        if codigo_Formato > 0 then
            update formatobolo set formatoB = formato_B  where codigoFormato = codigo_Formato;
        else
            insert into formatobolo values(default, formato_B);
        end if;
    end;
$$;
 ]   DROP PROCEDURE public.cadastrarformato(codigo_formato integer, formato_b character varying);
       public       postgres    false            �            1255    21126 ?  cadastrarfornecedor(integer, character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.cadastrarfornecedor(codigo_pessoa integer, nome_pessoa character varying, data_nascimento date, cpf_pessoa character varying, rg_pessoa character varying, telefone_pessoa character varying, celular_pessoa character varying, email_pessoa character varying, endereco_pessoa character varying, estado_pessoa character varying, cep_pessoa character varying, cidade_pessoa character varying, bairro_pessoa character varying, numero_casa character varying, razao_social character varying, contato_vendedor character varying, obs_fornecedor character varying)
    LANGUAGE plpgsql
    AS $$
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
$$;
 @  DROP PROCEDURE public.cadastrarfornecedor(codigo_pessoa integer, nome_pessoa character varying, data_nascimento date, cpf_pessoa character varying, rg_pessoa character varying, telefone_pessoa character varying, celular_pessoa character varying, email_pessoa character varying, endereco_pessoa character varying, estado_pessoa character varying, cep_pessoa character varying, cidade_pessoa character varying, bairro_pessoa character varying, numero_casa character varying, razao_social character varying, contato_vendedor character varying, obs_fornecedor character varying);
       public       postgres    false            �            1255    21125 I  cadastrarfuncionario(integer, character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer) 	   PROCEDURE       CREATE PROCEDURE public.cadastrarfuncionario(codigo_pessoa integer, nome_pessoa character varying, data_nascimento date, cpf_pessoa character varying, rg_pessoa character varying, telefone_pessoa character varying, celular_pessoa character varying, email_pessoa character varying, endereco_pessoa character varying, estado_pessoa character varying, cep_pessoa character varying, cidade_pessoa character varying, bairro_pessoa character varying, numero_casa character varying, obs_funcionario character varying, login_funcionario character varying, senha_funcionario character varying, codigo_cargo integer)
    LANGUAGE plpgsql
    AS $$
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
$$;
 ^  DROP PROCEDURE public.cadastrarfuncionario(codigo_pessoa integer, nome_pessoa character varying, data_nascimento date, cpf_pessoa character varying, rg_pessoa character varying, telefone_pessoa character varying, celular_pessoa character varying, email_pessoa character varying, endereco_pessoa character varying, estado_pessoa character varying, cep_pessoa character varying, cidade_pessoa character varying, bairro_pessoa character varying, numero_casa character varying, obs_funcionario character varying, login_funcionario character varying, senha_funcionario character varying, codigo_cargo integer);
       public       postgres    false            �            1255    19966 *   cadastrarmarca(integer, character varying) 	   PROCEDURE     `  CREATE PROCEDURE public.cadastrarmarca(codigo_marca integer, nome_marca character varying)
    LANGUAGE plpgsql
    AS $$
    begin
        if codigo_Marca > 0 then
            update marca set nomeMarca = nome_Marca where codigoMarca = codigo_Marca;
        else
            insert into marca values(default, nome_Marca);
        end if;
    end;
$$;
 Z   DROP PROCEDURE public.cadastrarmarca(codigo_marca integer, nome_marca character varying);
       public       postgres    false            �            1255    20497 )   cadastrarpeso(integer, character varying) 	   PROCEDURE     T  CREATE PROCEDURE public.cadastrarpeso(codigo_peso integer, peso_b character varying)
    LANGUAGE plpgsql
    AS $$
    begin
        if codigo_Peso > 0 then
            update pesobolo set pesoB = peso_B  where codigoPeso = codigo_Peso;
        else
            insert into pesobolo values (default,peso_B  );
        end if;
    end;
$$;
 T   DROP PROCEDURE public.cadastrarpeso(codigo_peso integer, peso_b character varying);
       public       postgres    false            �            1255    20677   cadastrarpessoa(integer, character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.cadastrarpessoa(codigo_pessoa integer, nome_pessoa character varying, data_nascimento date, cpf_pessoa character varying, rg_pessoa character varying, telefone_pessoa character varying, celular_pessoa character varying, email_pessoa character varying, endereco_pessoa character varying, estado_pessoa character varying, cep_pessoa character varying, cidade_pessoa character varying, bairro_pessoa character varying, numero_casa character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare
        retornoPessoa int := 0;
    begin
        if codigo_Pessoa > 0 then
            update pessoa set  codigoPessoa  = codigo_Pessoa, nomePessoa = nome_Pessoa, dataNascimento = data_Nascimento, cpfPessoa = cpf_Pessoa, rgPessoa = rg_Pessoa, telefonePessoa = telefone_Pessoa, celularPessoa = celular_Pessoa, emailPessoa = email_Pessoa, enderecoPessoa = endereco_Pessoa, estadoPessoa = estado_Pessoa, cepPessoa = cep_Pessoa, cidadePessoa = cidade_Pessoa, bairroPessoa = bairro_Pessoa, numeroCasa = numero_Casa where codigoPessoa = codigo_Pessoa returning codigoPessoa into retornoPessoa;
        else
            insert into pessoa values(default, nome_Pessoa, data_Nascimento,  cpf_Pessoa, rg_Pessoa, telefone_Pessoa, celular_Pessoa, email_Pessoa, endereco_Pessoa, estado_Pessoa, cep_Pessoa, cidade_Pessoa, bairro_Pessoa, numero_Casa) returning codigoPessoa into retornoPessoa;
        end if;
        return retornoPessoa;
    end;	
$$;
 �  DROP FUNCTION public.cadastrarpessoa(codigo_pessoa integer, nome_pessoa character varying, data_nascimento date, cpf_pessoa character varying, rg_pessoa character varying, telefone_pessoa character varying, celular_pessoa character varying, email_pessoa character varying, endereco_pessoa character varying, estado_pessoa character varying, cep_pessoa character varying, cidade_pessoa character varying, bairro_pessoa character varying, numero_casa character varying);
       public       postgres    false            �            1255    20494 �   cadastrarproduto(integer, character varying, date, integer, double precision, double precision, character varying, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.cadastrarproduto(codigo_produto integer, nome_produto character varying, data_validade date, estoque_produto integer, vlr_custo double precision, vlr_venda double precision, codigo_barra character varying, descricao_produto character varying, imagem_produto character varying)
    LANGUAGE plpgsql
    AS $$          
    begin
     
        if codigo_Produto > 0 then
           update produto set codigoProduto = codigo_Produto, nomeProduto = nome_Produto, dataValidade = data_Validade, estoqueProduto = estoque_Produto, vlrCusto = vlr_Custo, vlrVenda = vlr_Venda, codigoBarra = codigo_Barra, descricaoProduto = descricao_Produto, imagem = imagem_Produto where codigoProduto = codigo_Produto;
        else
            insert into produto values(default, nome_Produto, data_Validade, estoque_Produto, vlr_Custo, vlr_Venda, codigo_Barra, descricao_Produto, imagem_Produto);
        end if;
    end;
$$;
 ,  DROP PROCEDURE public.cadastrarproduto(codigo_produto integer, nome_produto character varying, data_validade date, estoque_produto integer, vlr_custo double precision, vlr_venda double precision, codigo_barra character varying, descricao_produto character varying, imagem_produto character varying);
       public       postgres    false            �            1255    20498 ,   cadastrarrecheio(integer, character varying) 	   PROCEDURE     t  CREATE PROCEDURE public.cadastrarrecheio(codigo_recheio integer, recheio_b character varying)
    LANGUAGE plpgsql
    AS $$
    begin
        if codigo_Recheio > 0 then
            update recheiobolo set recheioB = recheio_B where codigoRecheio = codigo_Recheio;
        else
            insert into recheiobolo values (default, recheio_B );
        end if;
    end;
$$;
 ]   DROP PROCEDURE public.cadastrarrecheio(codigo_recheio integer, recheio_b character varying);
       public       postgres    false            �            1255    20522 *   cadastrarsabor(integer, character varying) 	   PROCEDURE     ^  CREATE PROCEDURE public.cadastrarsabor(codigo_sabor integer, sabor_b character varying)
    LANGUAGE plpgsql
    AS $$
    begin
        if codigo_Sabor > 0 then
            update saborbolo set saborB = sabor_B where codigoSabor = codigo_Sabor;
        else
            insert into saborbolo values (default, sabor_B );
        end if;
    end;
$$;
 W   DROP PROCEDURE public.cadastrarsabor(codigo_sabor integer, sabor_b character varying);
       public       postgres    false            �            1259    20525    bolo    TABLE     -  CREATE TABLE public.bolo (
    codigobolo integer NOT NULL,
    decoracaobolo character varying,
    saborbolo integer NOT NULL,
    coberturabolo integer NOT NULL,
    recheiobolo integer NOT NULL,
    pesobolo integer NOT NULL,
    formatobolo integer NOT NULL,
    codigopessoa integer NOT NULL
);
    DROP TABLE public.bolo;
       public         postgres    false            �            1259    20523    bolo_codigobolo_seq    SEQUENCE     �   CREATE SEQUENCE public.bolo_codigobolo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.bolo_codigobolo_seq;
       public       postgres    false    217            �           0    0    bolo_codigobolo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.bolo_codigobolo_seq OWNED BY public.bolo.codigobolo;
            public       postgres    false    216            �            1259    19890    cargo    TABLE     �   CREATE TABLE public.cargo (
    codigocargo integer NOT NULL,
    nomecargo character varying(40) NOT NULL,
    desccargo character varying(200) NOT NULL
);
    DROP TABLE public.cargo;
       public         postgres    false            �            1259    19888    cargo_codigocargo_seq    SEQUENCE     �   CREATE SEQUENCE public.cargo_codigocargo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cargo_codigocargo_seq;
       public       postgres    false    199            �           0    0    cargo_codigocargo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cargo_codigocargo_seq OWNED BY public.cargo.codigocargo;
            public       postgres    false    198            �            1259    19921    cliente    TABLE     �   CREATE TABLE public.cliente (
    codigocliente integer NOT NULL,
    obscliente character varying(500),
    logincliente character varying(22) NOT NULL,
    senhacliente character varying(16) NOT NULL
);
    DROP TABLE public.cliente;
       public         postgres    false            �            1259    20452    coberturabolo    TABLE     n   CREATE TABLE public.coberturabolo (
    codigocobertura integer NOT NULL,
    coberturab character varying
);
 !   DROP TABLE public.coberturabolo;
       public         postgres    false            �            1259    20450 !   coberturabolo_codigocobertura_seq    SEQUENCE     �   CREATE SEQUENCE public.coberturabolo_codigocobertura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.coberturabolo_codigocobertura_seq;
       public       postgres    false    209            �           0    0 !   coberturabolo_codigocobertura_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.coberturabolo_codigocobertura_seq OWNED BY public.coberturabolo.codigocobertura;
            public       postgres    false    208            �            1259    20773    compra    TABLE     �   CREATE TABLE public.compra (
    codigopedido integer NOT NULL,
    codigopessoa integer NOT NULL,
    data_venda date NOT NULL,
    vlrtotalvenda numeric,
    obsvenda character varying
);
    DROP TABLE public.compra;
       public         postgres    false            �            1259    20771    compra_codigopedido_seq    SEQUENCE     �   CREATE SEQUENCE public.compra_codigopedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.compra_codigopedido_seq;
       public       postgres    false    220            �           0    0    compra_codigopedido_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.compra_codigopedido_seq OWNED BY public.compra.codigopedido;
            public       postgres    false    219            �            1259    20463    formatobolo    TABLE     h   CREATE TABLE public.formatobolo (
    codigoformato integer NOT NULL,
    formatob character varying
);
    DROP TABLE public.formatobolo;
       public         postgres    false            �            1259    20461    formatobolo_codigoformato_seq    SEQUENCE     �   CREATE SEQUENCE public.formatobolo_codigoformato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.formatobolo_codigoformato_seq;
       public       postgres    false    211            �           0    0    formatobolo_codigoformato_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.formatobolo_codigoformato_seq OWNED BY public.formatobolo.codigoformato;
            public       postgres    false    210            �            1259    20663 
   fornecedor    TABLE     �   CREATE TABLE public.fornecedor (
    codigofornecedor integer NOT NULL,
    razaosocial character varying(40),
    contatovendedor character varying(30) NOT NULL,
    obsfornecedor character varying(500)
);
    DROP TABLE public.fornecedor;
       public         postgres    false            �            1259    19934    funcionario    TABLE       CREATE TABLE public.funcionario (
    codigofuncionario integer NOT NULL,
    obsfuncionario character varying(500),
    loginfuncionario character varying(22) NOT NULL,
    senhafuncionario character varying(16) NOT NULL,
    codigocargo integer NOT NULL
);
    DROP TABLE public.funcionario;
       public         postgres    false            �            1259    20787    itenscompra    TABLE     �   CREATE TABLE public.itenscompra (
    codigoproduto integer NOT NULL,
    codigovenda integer NOT NULL,
    qtdproduto numeric NOT NULL,
    vlrproduto numeric NOT NULL
);
    DROP TABLE public.itenscompra;
       public         postgres    false            �            1259    19882    marca    TABLE     n   CREATE TABLE public.marca (
    codigomarca integer NOT NULL,
    nomemarca character varying(50) NOT NULL
);
    DROP TABLE public.marca;
       public         postgres    false            �            1259    19880    marca_codigomarca_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_codigomarca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.marca_codigomarca_seq;
       public       postgres    false    197            �           0    0    marca_codigomarca_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.marca_codigomarca_seq OWNED BY public.marca.codigomarca;
            public       postgres    false    196            �            1259    20385    pesobolo    TABLE     _   CREATE TABLE public.pesobolo (
    codigopeso integer NOT NULL,
    pesob character varying
);
    DROP TABLE public.pesobolo;
       public         postgres    false            �            1259    20383    pesobolo_codigopeso_seq    SEQUENCE     �   CREATE SEQUENCE public.pesobolo_codigopeso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.pesobolo_codigopeso_seq;
       public       postgres    false    205            �           0    0    pesobolo_codigopeso_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.pesobolo_codigopeso_seq OWNED BY public.pesobolo.codigopeso;
            public       postgres    false    204            �            1259    19909    pessoa    TABLE     �  CREATE TABLE public.pessoa (
    codigopessoa integer NOT NULL,
    nomepessoa character varying(60) NOT NULL,
    datanascimento date NOT NULL,
    cpfpessoa character varying(19) NOT NULL,
    rgpessoa character varying(14) NOT NULL,
    telefonepessoa character varying(17),
    celularpessoa character varying(17) NOT NULL,
    emailpessoa character varying(40) NOT NULL,
    enderecopessoa character varying(100) NOT NULL,
    estadopessoa character varying(2) NOT NULL,
    ceppessoa character varying(20) NOT NULL,
    cidadepessoa character varying(20) NOT NULL,
    bairropessoa character varying(30) NOT NULL,
    numerocasa character varying(5)
);
    DROP TABLE public.pessoa;
       public         postgres    false            �            1259    19907    pessoa_codigopessoa_seq    SEQUENCE     �   CREATE SEQUENCE public.pessoa_codigopessoa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.pessoa_codigopessoa_seq;
       public       postgres    false    201            �           0    0    pessoa_codigopessoa_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.pessoa_codigopessoa_seq OWNED BY public.pessoa.codigopessoa;
            public       postgres    false    200            �            1259    20441    produto    TABLE       CREATE TABLE public.produto (
    codigoproduto integer NOT NULL,
    nomeproduto character varying(40) NOT NULL,
    datavalidade date NOT NULL,
    estoqueproduto integer NOT NULL,
    vlrcusto numeric NOT NULL,
    vlrvenda numeric NOT NULL,
    codigobarra character varying(40) NOT NULL,
    descricaoproduto character varying(800) NOT NULL,
    imagem character varying(80)
);
    DROP TABLE public.produto;
       public         postgres    false            �            1259    20439    produto_codigoproduto_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_codigoproduto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.produto_codigoproduto_seq;
       public       postgres    false    207            �           0    0    produto_codigoproduto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.produto_codigoproduto_seq OWNED BY public.produto.codigoproduto;
            public       postgres    false    206            �            1259    20474    recheiobolo    TABLE     h   CREATE TABLE public.recheiobolo (
    codigorecheio integer NOT NULL,
    recheiob character varying
);
    DROP TABLE public.recheiobolo;
       public         postgres    false            �            1259    20472    recheiobolo_codigorecheio_seq    SEQUENCE     �   CREATE SEQUENCE public.recheiobolo_codigorecheio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.recheiobolo_codigorecheio_seq;
       public       postgres    false    213            �           0    0    recheiobolo_codigorecheio_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.recheiobolo_codigorecheio_seq OWNED BY public.recheiobolo.codigorecheio;
            public       postgres    false    212            �            1259    20485 	   saborbolo    TABLE     b   CREATE TABLE public.saborbolo (
    codigosabor integer NOT NULL,
    saborb character varying
);
    DROP TABLE public.saborbolo;
       public         postgres    false            �            1259    20483    saborbolo_codigosabor_seq    SEQUENCE     �   CREATE SEQUENCE public.saborbolo_codigosabor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.saborbolo_codigosabor_seq;
       public       postgres    false    215            �           0    0    saborbolo_codigosabor_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.saborbolo_codigosabor_seq OWNED BY public.saborbolo.codigosabor;
            public       postgres    false    214            �
           2604    20528    bolo codigobolo    DEFAULT     r   ALTER TABLE ONLY public.bolo ALTER COLUMN codigobolo SET DEFAULT nextval('public.bolo_codigobolo_seq'::regclass);
 >   ALTER TABLE public.bolo ALTER COLUMN codigobolo DROP DEFAULT;
       public       postgres    false    216    217    217            �
           2604    19893    cargo codigocargo    DEFAULT     v   ALTER TABLE ONLY public.cargo ALTER COLUMN codigocargo SET DEFAULT nextval('public.cargo_codigocargo_seq'::regclass);
 @   ALTER TABLE public.cargo ALTER COLUMN codigocargo DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    20455    coberturabolo codigocobertura    DEFAULT     �   ALTER TABLE ONLY public.coberturabolo ALTER COLUMN codigocobertura SET DEFAULT nextval('public.coberturabolo_codigocobertura_seq'::regclass);
 L   ALTER TABLE public.coberturabolo ALTER COLUMN codigocobertura DROP DEFAULT;
       public       postgres    false    209    208    209            �
           2604    20776    compra codigopedido    DEFAULT     z   ALTER TABLE ONLY public.compra ALTER COLUMN codigopedido SET DEFAULT nextval('public.compra_codigopedido_seq'::regclass);
 B   ALTER TABLE public.compra ALTER COLUMN codigopedido DROP DEFAULT;
       public       postgres    false    220    219    220            �
           2604    20466    formatobolo codigoformato    DEFAULT     �   ALTER TABLE ONLY public.formatobolo ALTER COLUMN codigoformato SET DEFAULT nextval('public.formatobolo_codigoformato_seq'::regclass);
 H   ALTER TABLE public.formatobolo ALTER COLUMN codigoformato DROP DEFAULT;
       public       postgres    false    211    210    211            �
           2604    19885    marca codigomarca    DEFAULT     v   ALTER TABLE ONLY public.marca ALTER COLUMN codigomarca SET DEFAULT nextval('public.marca_codigomarca_seq'::regclass);
 @   ALTER TABLE public.marca ALTER COLUMN codigomarca DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    20388    pesobolo codigopeso    DEFAULT     z   ALTER TABLE ONLY public.pesobolo ALTER COLUMN codigopeso SET DEFAULT nextval('public.pesobolo_codigopeso_seq'::regclass);
 B   ALTER TABLE public.pesobolo ALTER COLUMN codigopeso DROP DEFAULT;
       public       postgres    false    204    205    205            �
           2604    19912    pessoa codigopessoa    DEFAULT     z   ALTER TABLE ONLY public.pessoa ALTER COLUMN codigopessoa SET DEFAULT nextval('public.pessoa_codigopessoa_seq'::regclass);
 B   ALTER TABLE public.pessoa ALTER COLUMN codigopessoa DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    20444    produto codigoproduto    DEFAULT     ~   ALTER TABLE ONLY public.produto ALTER COLUMN codigoproduto SET DEFAULT nextval('public.produto_codigoproduto_seq'::regclass);
 D   ALTER TABLE public.produto ALTER COLUMN codigoproduto DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    20477    recheiobolo codigorecheio    DEFAULT     �   ALTER TABLE ONLY public.recheiobolo ALTER COLUMN codigorecheio SET DEFAULT nextval('public.recheiobolo_codigorecheio_seq'::regclass);
 H   ALTER TABLE public.recheiobolo ALTER COLUMN codigorecheio DROP DEFAULT;
       public       postgres    false    213    212    213            �
           2604    20488    saborbolo codigosabor    DEFAULT     ~   ALTER TABLE ONLY public.saborbolo ALTER COLUMN codigosabor SET DEFAULT nextval('public.saborbolo_codigosabor_seq'::regclass);
 D   ALTER TABLE public.saborbolo ALTER COLUMN codigosabor DROP DEFAULT;
       public       postgres    false    215    214    215            �          0    20525    bolo 
   TABLE DATA               �   COPY public.bolo (codigobolo, decoracaobolo, saborbolo, coberturabolo, recheiobolo, pesobolo, formatobolo, codigopessoa) FROM stdin;
    public       postgres    false    217   ��       �          0    19890    cargo 
   TABLE DATA               B   COPY public.cargo (codigocargo, nomecargo, desccargo) FROM stdin;
    public       postgres    false    199   �       �          0    19921    cliente 
   TABLE DATA               X   COPY public.cliente (codigocliente, obscliente, logincliente, senhacliente) FROM stdin;
    public       postgres    false    202   l�       �          0    20452    coberturabolo 
   TABLE DATA               D   COPY public.coberturabolo (codigocobertura, coberturab) FROM stdin;
    public       postgres    false    209   ��       �          0    20773    compra 
   TABLE DATA               a   COPY public.compra (codigopedido, codigopessoa, data_venda, vlrtotalvenda, obsvenda) FROM stdin;
    public       postgres    false    220   ��       �          0    20463    formatobolo 
   TABLE DATA               >   COPY public.formatobolo (codigoformato, formatob) FROM stdin;
    public       postgres    false    211   �       �          0    20663 
   fornecedor 
   TABLE DATA               c   COPY public.fornecedor (codigofornecedor, razaosocial, contatovendedor, obsfornecedor) FROM stdin;
    public       postgres    false    218   J�       �          0    19934    funcionario 
   TABLE DATA               y   COPY public.funcionario (codigofuncionario, obsfuncionario, loginfuncionario, senhafuncionario, codigocargo) FROM stdin;
    public       postgres    false    203   ��       �          0    20787    itenscompra 
   TABLE DATA               Y   COPY public.itenscompra (codigoproduto, codigovenda, qtdproduto, vlrproduto) FROM stdin;
    public       postgres    false    221   ��       �          0    19882    marca 
   TABLE DATA               7   COPY public.marca (codigomarca, nomemarca) FROM stdin;
    public       postgres    false    197   �       �          0    20385    pesobolo 
   TABLE DATA               5   COPY public.pesobolo (codigopeso, pesob) FROM stdin;
    public       postgres    false    205   $�       �          0    19909    pessoa 
   TABLE DATA               �   COPY public.pessoa (codigopessoa, nomepessoa, datanascimento, cpfpessoa, rgpessoa, telefonepessoa, celularpessoa, emailpessoa, enderecopessoa, estadopessoa, ceppessoa, cidadepessoa, bairropessoa, numerocasa) FROM stdin;
    public       postgres    false    201   H�       �          0    20441    produto 
   TABLE DATA               �   COPY public.produto (codigoproduto, nomeproduto, datavalidade, estoqueproduto, vlrcusto, vlrvenda, codigobarra, descricaoproduto, imagem) FROM stdin;
    public       postgres    false    207   z�       �          0    20474    recheiobolo 
   TABLE DATA               >   COPY public.recheiobolo (codigorecheio, recheiob) FROM stdin;
    public       postgres    false    213   P�       �          0    20485 	   saborbolo 
   TABLE DATA               8   COPY public.saborbolo (codigosabor, saborb) FROM stdin;
    public       postgres    false    215   ��       �           0    0    bolo_codigobolo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.bolo_codigobolo_seq', 4, true);
            public       postgres    false    216            �           0    0    cargo_codigocargo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cargo_codigocargo_seq', 7, true);
            public       postgres    false    198            �           0    0 !   coberturabolo_codigocobertura_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.coberturabolo_codigocobertura_seq', 2, true);
            public       postgres    false    208            �           0    0    compra_codigopedido_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.compra_codigopedido_seq', 83, true);
            public       postgres    false    219            �           0    0    formatobolo_codigoformato_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.formatobolo_codigoformato_seq', 2, true);
            public       postgres    false    210            �           0    0    marca_codigomarca_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.marca_codigomarca_seq', 1, false);
            public       postgres    false    196            �           0    0    pesobolo_codigopeso_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pesobolo_codigopeso_seq', 3, true);
            public       postgres    false    204            �           0    0    pessoa_codigopessoa_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.pessoa_codigopessoa_seq', 23, true);
            public       postgres    false    200            �           0    0    produto_codigoproduto_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.produto_codigoproduto_seq', 22, true);
            public       postgres    false    206            �           0    0    recheiobolo_codigorecheio_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.recheiobolo_codigorecheio_seq', 3, true);
            public       postgres    false    212            �           0    0    saborbolo_codigosabor_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.saborbolo_codigosabor_seq', 2, true);
            public       postgres    false    214            
           2606    20533    bolo bolo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.bolo
    ADD CONSTRAINT bolo_pkey PRIMARY KEY (codigobolo);
 8   ALTER TABLE ONLY public.bolo DROP CONSTRAINT bolo_pkey;
       public         postgres    false    217            �
           2606    19895    cargo cargo_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (codigocargo);
 :   ALTER TABLE ONLY public.cargo DROP CONSTRAINT cargo_pkey;
       public         postgres    false    199            �
           2606    19928    cliente cliente_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (codigocliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public         postgres    false    202                       2606    20460     coberturabolo coberturabolo_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.coberturabolo
    ADD CONSTRAINT coberturabolo_pkey PRIMARY KEY (codigocobertura);
 J   ALTER TABLE ONLY public.coberturabolo DROP CONSTRAINT coberturabolo_pkey;
       public         postgres    false    209                       2606    20781    compra compra_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (codigopedido);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public         postgres    false    220                       2606    20471    formatobolo formatobolo_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.formatobolo
    ADD CONSTRAINT formatobolo_pkey PRIMARY KEY (codigoformato);
 F   ALTER TABLE ONLY public.formatobolo DROP CONSTRAINT formatobolo_pkey;
       public         postgres    false    211                       2606    20670    fornecedor fornecedor_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (codigofornecedor);
 D   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT fornecedor_pkey;
       public         postgres    false    218            �
           2606    19941    funcionario funcionario_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (codigofuncionario);
 F   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
       public         postgres    false    203                       2606    20794    itenscompra itenscompra_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.itenscompra
    ADD CONSTRAINT itenscompra_pkey PRIMARY KEY (codigovenda);
 F   ALTER TABLE ONLY public.itenscompra DROP CONSTRAINT itenscompra_pkey;
       public         postgres    false    221            �
           2606    19887    marca marca_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (codigomarca);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public         postgres    false    197            �
           2606    20393    pesobolo pesobolo_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.pesobolo
    ADD CONSTRAINT pesobolo_pkey PRIMARY KEY (codigopeso);
 @   ALTER TABLE ONLY public.pesobolo DROP CONSTRAINT pesobolo_pkey;
       public         postgres    false    205            �
           2606    21707    pessoa pessoa_cpfpessoa_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_cpfpessoa_key UNIQUE (cpfpessoa);
 E   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_cpfpessoa_key;
       public         postgres    false    201            �
           2606    19920    pessoa pessoa_emailpessoa_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_emailpessoa_key UNIQUE (emailpessoa);
 G   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_emailpessoa_key;
       public         postgres    false    201            �
           2606    19914    pessoa pessoa_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (codigopessoa);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public         postgres    false    201            �
           2606    19918    pessoa pessoa_rgpessoa_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_rgpessoa_key UNIQUE (rgpessoa);
 D   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_rgpessoa_key;
       public         postgres    false    201                        2606    20449    produto produto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (codigoproduto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public         postgres    false    207                       2606    20482    recheiobolo recheiobolo_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.recheiobolo
    ADD CONSTRAINT recheiobolo_pkey PRIMARY KEY (codigorecheio);
 F   ALTER TABLE ONLY public.recheiobolo DROP CONSTRAINT recheiobolo_pkey;
       public         postgres    false    213                       2606    20493    saborbolo saborbolo_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.saborbolo
    ADD CONSTRAINT saborbolo_pkey PRIMARY KEY (codigosabor);
 B   ALTER TABLE ONLY public.saborbolo DROP CONSTRAINT saborbolo_pkey;
       public         postgres    false    215                       2606    20539    bolo bolo_coberturabolo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bolo
    ADD CONSTRAINT bolo_coberturabolo_fkey FOREIGN KEY (coberturabolo) REFERENCES public.coberturabolo(codigocobertura);
 F   ALTER TABLE ONLY public.bolo DROP CONSTRAINT bolo_coberturabolo_fkey;
       public       postgres    false    217    2818    209                       2606    20559    bolo bolo_codigopessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bolo
    ADD CONSTRAINT bolo_codigopessoa_fkey FOREIGN KEY (codigopessoa) REFERENCES public.pessoa(codigopessoa);
 E   ALTER TABLE ONLY public.bolo DROP CONSTRAINT bolo_codigopessoa_fkey;
       public       postgres    false    2806    217    201                       2606    20554    bolo bolo_formatobolo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bolo
    ADD CONSTRAINT bolo_formatobolo_fkey FOREIGN KEY (formatobolo) REFERENCES public.formatobolo(codigoformato);
 D   ALTER TABLE ONLY public.bolo DROP CONSTRAINT bolo_formatobolo_fkey;
       public       postgres    false    211    217    2820                       2606    20549    bolo bolo_pesobolo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bolo
    ADD CONSTRAINT bolo_pesobolo_fkey FOREIGN KEY (pesobolo) REFERENCES public.pesobolo(codigopeso);
 A   ALTER TABLE ONLY public.bolo DROP CONSTRAINT bolo_pesobolo_fkey;
       public       postgres    false    205    217    2814                       2606    20544    bolo bolo_recheiobolo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bolo
    ADD CONSTRAINT bolo_recheiobolo_fkey FOREIGN KEY (recheiobolo) REFERENCES public.recheiobolo(codigorecheio);
 D   ALTER TABLE ONLY public.bolo DROP CONSTRAINT bolo_recheiobolo_fkey;
       public       postgres    false    213    217    2822                       2606    20534    bolo bolo_saborbolo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bolo
    ADD CONSTRAINT bolo_saborbolo_fkey FOREIGN KEY (saborbolo) REFERENCES public.saborbolo(codigosabor);
 B   ALTER TABLE ONLY public.bolo DROP CONSTRAINT bolo_saborbolo_fkey;
       public       postgres    false    2824    217    215                       2606    19929 "   cliente cliente_codigocliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_codigocliente_fkey FOREIGN KEY (codigocliente) REFERENCES public.pessoa(codigopessoa);
 L   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_codigocliente_fkey;
       public       postgres    false    2806    202    201                       2606    20782    compra compra_codigopessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_codigopessoa_fkey FOREIGN KEY (codigopessoa) REFERENCES public.pessoa(codigopessoa);
 I   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_codigopessoa_fkey;
       public       postgres    false    220    2806    201                       2606    20671 +   fornecedor fornecedor_codigofornecedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_codigofornecedor_fkey FOREIGN KEY (codigofornecedor) REFERENCES public.pessoa(codigopessoa);
 U   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT fornecedor_codigofornecedor_fkey;
       public       postgres    false    218    2806    201                       2606    19947 (   funcionario funcionario_codigocargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_codigocargo_fkey FOREIGN KEY (codigocargo) REFERENCES public.cargo(codigocargo);
 R   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_codigocargo_fkey;
       public       postgres    false    199    203    2800                       2606    19942 .   funcionario funcionario_codigofuncionario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_codigofuncionario_fkey FOREIGN KEY (codigofuncionario) REFERENCES public.pessoa(codigopessoa);
 X   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_codigofuncionario_fkey;
       public       postgres    false    203    2806    201                       2606    20795 *   itenscompra itenscompra_codigoproduto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itenscompra
    ADD CONSTRAINT itenscompra_codigoproduto_fkey FOREIGN KEY (codigoproduto) REFERENCES public.produto(codigoproduto);
 T   ALTER TABLE ONLY public.itenscompra DROP CONSTRAINT itenscompra_codigoproduto_fkey;
       public       postgres    false    221    207    2816                       2606    20800 (   itenscompra itenscompra_codigovenda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itenscompra
    ADD CONSTRAINT itenscompra_codigovenda_fkey FOREIGN KEY (codigovenda) REFERENCES public.compra(codigopedido);
 R   ALTER TABLE ONLY public.itenscompra DROP CONSTRAINT itenscompra_codigovenda_fkey;
       public       postgres    false    220    2830    221            �   $   x�3�,M-�W�WH���W�4�4c ����� ��      �   T   x�3�,I-.I�J-�/�<����|��T�����Ғ�b.3΀������Ĕ�"�����T.s�XZjq1P$-�J!/1%Q�+F��� �wq      �      x�3���,�/N�442����� -��      �   '   x�3�L�OJ-*)-J�2��I�,IU���������� ��	(      �   8   x�33�4�4202�54�54�4�tturq�s��0@�4�4�3C�6�+���� |)�      �   $   x�3�L�/�M,��2�)�L�K/�I,����� �(C      �   9   x�34�L� �Ĕ�Ĕ��(�@ĸ�9���R�S9s2�S9��R�b���� ��      �   G   x�3�,�/U�-�,�WHM�L�L�+IU()JLJ��H�K����O���442�4�2� �<(5/�ܘ+F��� wd      �      x������ � �      �      x������ � �      �      x�3�,H-������ Q�      �   "  x��S�n�0<��BG�@Z�|�_Z (���1�\�HN����I�c���8E�!�W��ÙYv�wCCR���2H���X6���,;�X2�Y�,ƱӜE���p?�7�C���uw���.�|70��7����wt�qƞ�a��	���|�6�d�4���}B�|2>���/
��<�j�����zC}��z�6�l�@A*X�M�<���(��ͫjQT:�N$���%`҇���,g�"����
�>���C!pҒ�E#�~��
*B<��E�r"�#��^w~���=���;lǈA�1� ���\T9`'p�4O �}�9����W���B�ՙ>t���K3�3�����Xji�I�s�!�f����,���	F+˒n�����]�u�T�P!gH�#�	;Y� ^�����+2�N}�1��"��?7mݞ�ġM����>L<MDA��̪C��Re�	MG�&U,�@Q^�����5�ᬓ�l���T�� A=�@�:1Q"�\W��@�T�]�&�v6���      �   �   x�U�M� ��p
`	���{7�NZ��n����bN�+$$d��=0�J�T��:_� .36�\8�?�@;aa��
5J��]�j�:�xb%�7����2����h+\!�t��ΚC�l�5�YԨF�kc[�i��vzl������+J���l��A���F�,�aǞ\.�ӹ���r `��o��9��w-����e�      �   !   x�3�,JM�H���2���/J�K������ b(�      �   !   x�3�,NL�/�2�t��O��I,I����� _��     