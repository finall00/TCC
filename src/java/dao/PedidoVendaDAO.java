package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import model.PedidoVenda;
import utils.Conexao;

public class PedidoVendaDAO {

    private Connection conexao;

    public PedidoVendaDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();

    }
    //fazer todo a classe DAO

//    N sei se é nessesario fazer isso 
//    public int cadastrar(Object obj) throws SQLException {
//        PedidoVenda pedidoVenda = (PedidoVenda) obj;
//        if (pedidoVenda.getCodigoPedido() == 0){
//        return inserir(pedidoVenda);
//        }else{
//        return alterar(pedidoVenda);
//        }
//   }
    public int cadastrar(Object obj) throws SQLException {
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

    private int alterar(PedidoVenda pedidoVenda) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Object> listar() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        //select * from compra co inner join itenscompra ip on ip.codigovenda = co.codigopedido;
    }

    public Object consultar(int codigo) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        //select * from compra co inner join itenscompra ip on ip.codigovenda = co.codigopedido WHERE co.codigopedido = ?; 
    }

    public void excluir(int codigo) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody       
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
