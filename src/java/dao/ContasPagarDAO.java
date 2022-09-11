package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
import model.ComprarProduto;
import model.Produto;
import utils.Conexao;

public class ContasPagarDAO implements DAOGenerica {

    private Connection conexao;

    public ContasPagarDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();
    }

    @Override
    public void cadastrar(Object objeto) throws SQLException {
        ComprarProduto contasPagar = (ComprarProduto) objeto;
        String sql = "call cadastrarContas(?, ?, ?, ?)";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);

            stmt.setInt(1, contasPagar.getCodigoConta());
            stmt.setDate(3, new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(contasPagar.getDataVencimento()).getTime()));
            //Data de espedição
            stmt.setDouble(3, contasPagar.getVlrPagar());
            stmt.setInt(4, contasPagar.getProduto().getCodigoProduto());

            stmt.execute();
        } catch (SQLException | ParseException ex) {
            throw new SQLException("Erro ao gravar Contas");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }

    }

    @Override
    public Object consultar(int codigo) throws SQLException {
        String sql = "select * from contasPagar where codigoContasPagar = ? ";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ComprarProduto contasPagar = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            while (rs.next()) {
               contasPagar = new ComprarProduto(rs.getInt("codigoContasPagar"), rs.getString("dataVencimento"), rs.getDouble("vlrPagar"), (Produto) new ProdutoDAO().consultar(rs.getInt("codigoProduto")), (Cliente) new ClienteDAO().consultar(rs.getInt("codigoCliente")));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new SQLException("Erro ao consultar");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }

        return contasPagar;
    }

    @Override
    public List<Object> listar() throws SQLException {
        String sql = "selec * from contasPagar ";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ComprarProduto   contasPagar = new ComprarProduto(rs.getInt("codigoContasPagar"), rs.getString("dataVencimento"), rs.getDouble("vlrPagar"), (Produto) new ProdutoDAO().consultar(rs.getInt("codigoProduto")), (Cliente) new ClienteDAO().consultar(rs.getInt("codigoCliente")));
            lista.add(contasPagar);
            }

        } catch (SQLException | ClassNotFoundException ex) {
            throw new SQLException("Erro ao listar");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }

        return lista;
    }

    @Override
    public void excluir(int codigo) throws SQLException {
        String sql = "delete from contasPagar where codigoContasPagar";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir contasPagar");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

}
