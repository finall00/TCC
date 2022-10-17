package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.ItensVenda;
import utils.Conexao;

/**
 *
 * @author smili08
 */
public class ItensVendaDAO {

    //fazer todo o classe DAO
    //coloquei isso so pra parar de dar erro
    private Connection conexao;

    public ItensVendaDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();

    }
    //fazer todo a classe DAO

    public void cadastrar(Object obj) throws SQLException {
        ItensVenda itensVenda = (ItensVenda) obj;

        if (itensVenda.getCodigoItenV() == 0) {
            inserir(itensVenda);
        } else {
            alterar(itensVenda);
        }
    }

    public void inserir(Object obj) throws SQLException {
        ItensVenda itensVenda = (ItensVenda) obj;
        String sql = "insert into itensVenda value(default,?,?,?,?)";
        PreparedStatement stmt = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, itensVenda.getProduto().getCodigoProduto());
            stmt.setInt(2, itensVenda.getPedidoVenda().getCodigoPedido());
            stmt.setDouble(3, itensVenda.getQtdProduto());
            stmt.setDouble(4, itensVenda.getVlrProduto());
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao inserir os Itens da Compra");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

    private void alterar(ItensVenda itensVenda) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Object consultar(int codigo) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Object> listar() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void excluir(int codigo) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
