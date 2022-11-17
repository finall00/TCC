package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.PedidoVenda;
import model.Pessoa;
import model.Produto;
import utils.Conexao;

public class PedidoVendaDAO {

    private Connection conexao;

    public PedidoVendaDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();

    }
//    fazer todo a classe DAO
//    N sei se é nessesario fazer isso 
    public int cadastrar(Object obj) throws SQLException {
        PedidoVenda pedidoVenda = (PedidoVenda) obj;
        if (pedidoVenda.getCodigoPedido() == 0){
        return inserir(pedidoVenda);
        }else{
        return alterar(pedidoVenda);
        }
   }
    public int inserir(Object obj) throws SQLException {
        PedidoVenda pedidoVenda = (PedidoVenda) obj;
        String sql = "insert into compra(codigopessoa, data_venda, vlrtotalvenda, obsvenda) values (?, ?, ?, ?) returning codigoPedido";
        int codigoPedido = 0;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, pedidoVenda.getPessoa().getCodigoPessoa());
            stmt.setDate(2, new java.sql.Date(pedidoVenda.getDataVenda().getTime()));
            stmt.setDouble(3, pedidoVenda.getVlrTotalVenda());
            stmt.setString(4, pedidoVenda.getObsVenda());
            rs = stmt.executeQuery();
            while (rs.next()) {
                codigoPedido = rs.getInt("codigopedido");
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao inserir pedido da venda");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }

        return codigoPedido;
    }

    private int alterar(PedidoVenda pedidoVenda) throws SQLException {
    String sql = "update compra set codigopessoa = ?, data_venda = ?, vlrtotalvenda = ?, obsvenda = ? where codigoPedido = ? returning codigoPedido";
        int codigoPedido = 0;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, pedidoVenda.getPessoa().getCodigoPessoa());
            stmt.setDate(2, new java.sql.Date(pedidoVenda.getDataVenda().getTime()));
            stmt.setDouble(3, pedidoVenda.getVlrTotalVenda());
            stmt.setString(4, pedidoVenda.getObsVenda());
            stmt.setInt(5, pedidoVenda.getCodigoPedido());
            rs = stmt.executeQuery();
            while (rs.next()) {
                codigoPedido = rs.getInt("codigopedido");
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao inserir pedido da venda");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }

        return codigoPedido;
    }

  public List<Object> listar() throws SQLException {
   String sql = "select * from compra co inner join itenscompra ip on ip.codigovenda = co.codigopedido;";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                PedidoVenda pedidoVenda = new PedidoVenda(rs.getInt("codigoPedido"), (Pessoa) new PessoaDAO().consultarP(rs.getInt("codigoPessoa")), rs.getDate("data_Venda"), rs.getString("obsVenda"), rs.getDouble("vlrTotalVenda"), rs.getInt("codigoVenda"), (Produto) new ProdutoDAO().consultar(rs.getInt("codigoProduto")), rs.getDouble("qtdProduto"), rs.getDouble("vlrProduto"));
               
                lista.add(pedidoVenda);
            }
        } catch (SQLException| ClassNotFoundException ex) {
            throw new SQLException("Erro ao Listar usuario");

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }

        return lista;
    }
    

    public List<Object> consultar(int codigo) throws SQLException {
        //select * from compra co inner join itenscompra ip on ip.codigovenda = co.codigopedido WHERE co.codigopedido = ?;  
        String sql = "select * from compra co inner join itenscompra ip on ip.codigovenda = co.codigopedido where co.codigoPessoa = ?;";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            while (rs.next()) {
                PedidoVenda pedidoVenda = new PedidoVenda(rs.getInt("codigoPedido"), (Pessoa) new PessoaDAO().consultarP(rs.getInt("codigoPessoa")), rs.getDate("data_Venda"), rs.getString("obsVenda"), rs.getDouble("vlrTotalVenda"), rs.getInt("codigoVenda"), (Produto) new ProdutoDAO().consultar(rs.getInt("codigoProduto")), rs.getDouble("qtdProduto"), rs.getDouble("vlrProduto"));
                lista.add(pedidoVenda);
            }
        } catch (SQLException| ClassNotFoundException ex) {
            throw new SQLException("Erro ao Listar usuario");

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }

        return lista;
    }
    
    public Object consultarP(int codigo) throws SQLException {
        String sql = "select * from compra co inner join itenscompra ip on ip.codigovenda = co.codigopedido where co.codigoPedido = ?;";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            while (rs.next()) {
                PedidoVenda pedidoVenda = new PedidoVenda(rs.getInt("codigoPedido"), (Pessoa) new PessoaDAO().consultarP(rs.getInt("codigoPessoa")), rs.getDate("data_Venda"), rs.getString("obsVenda"), rs.getDouble("vlrTotalVenda"), rs.getInt("codigoVenda"), (Produto) new ProdutoDAO().consultar(rs.getInt("codigoProduto")), rs.getDouble("qtdProduto"), rs.getDouble("vlrProduto"));
                lista.add(pedidoVenda);
            }
        } catch (SQLException| ClassNotFoundException ex) {
            throw new SQLException("Erro ao Listar usuario");

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }

        return lista;
    }

    
    
    
    
    public void excluir(int codigo) throws SQLException {
    String sql = "delete from compra where codigopedido = ?";
        PreparedStatement stmt = null;
        try {
            ItensVendaDAO v = new ItensVendaDAO();
            boolean B = v.excluir(codigo);
            if(B == true){
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            stmt.execute();
            }
        } catch (SQLException |ClassNotFoundException ex) {
            throw new SQLException("Erro ao excluir produto");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

}

/* charlie Brown- ceu Azul 
 
   Tão natural quanto a luz do dia
    Mas que preguiça boa
    Me deixa aqui à toa
    Hoje ninguém vai estragar meu dia
    Só vou gastar energia pra beijar sua boca

    Fica comigo então
    Não me abandona, não
    Alguém te perguntou como é que foi seu dia?
    Uma palavra amiga, uma notícia boa`
    Isso faz falta no dia a dia
    A gente nunca sabe quem são essas pessoas

    Eu só queria te lembrar
    Que aquele tempo eu não podia fazer mais por nós
    Eu estava errado e você não tem que me perdoar

    Mas também quero te mostrar
    Que existe um lado bom nessa história
    Tudo que ainda temos a compartilhar

    E viver
    E cantar
    Não importa qual seja o dia
    Vamos viver
    Vadiar
    O que importa é nossa alegria

    Vamos viver
    E cantar
    Não importa qual seja o dia
    Vamos viver
    Vadiar
    O que importa é nossa alegria

    Tão natural quanto a luz do dia
    Mas que preguiça boa
    Me deixa aqui à toa
    Hoje ninguém vai estragar meu dia
    Só vou gastar energia pra beijar sua boca

    Eu só queria te lembrar
    Que aquele tempo eu não podia fazer mais por nós
    Eu estava errado e você não tem que me perdoar

    Mas também quero te mostrar
    Que existe um lado bom nessa história
    Tudo que ainda temos a compartilhar

    E viver
    E cantar
    Não importa qual seja o dia
    Vamos viver
    Vadiar
    O que importa é nossa alegria

    Vamos viver
    E cantar
    Não importa qual seja o dia
    Vamos viver
    Vadiar
    O que importa é nossa alegria

    Tão natural quanto a luz do dia
 */
