package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Fornecedor;
import utils.Conexao;

public class FornecedorDAO implements DAOGenerica {

    private Connection conexao;

    public FornecedorDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();
    }

    @Override
    public void cadastrar(Object objeto) throws SQLException {
        Fornecedor fornecedor = (Fornecedor) objeto;
        String sql = "call cadastrarFornecedor(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, fornecedor.getCodigoPessoa());
            stmt.setString(2, fornecedor.getNomePessoa());
            stmt.setDate(3, new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(fornecedor.getDataNascimento()).getTime()));
            stmt.setString(4, fornecedor.getCpfPessoa());
            stmt.setString(5, fornecedor.getRgPessoa());
            stmt.setString(6, fornecedor.getTelefonePessoa());
            stmt.setString(7, fornecedor.getCelularPessoa());
            stmt.setString(8, fornecedor.getEmailPessoa());
            stmt.setString(9, fornecedor.getEnderecoPessoa());
            stmt.setString(10, fornecedor.getEstadoPessoa());
            stmt.setString(11, fornecedor.getCepPessoa());
            stmt.setString(12, fornecedor.getCidadePessoa());
            stmt.setString(13, fornecedor.getBairroPessoa());
            stmt.setString(14, fornecedor.getRazaoSocial());
            stmt.setString(15, fornecedor.getContatoVendedor());
            stmt.setDouble(16, fornecedor.getVlrPedido());
            stmt.setString(17, fornecedor.getObsFornecedor());
            stmt.executeQuery();

        } catch (SQLException | ParseException ex) {
            throw new SQLException("Erro ao gravar Fornecedor"+ ex);
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

    @Override
    public Object consultar(int codigo) throws SQLException {
        String sql = "select * from fornecedor fo inner join pessoa pe on fo.codigoFornecedor = pe.codigoPessoa where pe.codigopessoa = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Fornecedor fornecedor = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            while (rs.next()) {
                fornecedor = new Fornecedor(rs.getString("razaoSocial"), rs.getString("contatoVendedor"), rs.getDouble("vlrPedido"), rs.getString("obsFornecedor"), rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), rs.getString("dataNascimento"), rs.getString("cpfPessoa"), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"), rs.getString("enderecoPessoa"), rs.getString("estadoPessoa"), rs.getString("cepPessoa"), rs.getString("cidadePessoa"), rs.getString("bairroPessoa"));

            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao consultar Funcionario");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return fornecedor;

    }

    @Override
    public List<Object> listar() throws SQLException {
        String sql = "select * from fornecedor fo inner join pessoa pe on fo.codigoFornecedor = pe.codigoPessoa";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Fornecedor fornecedor = new Fornecedor(rs.getString("razaoSocial"), rs.getString("contatoVendedor"), rs.getDouble("vlrPedido"), rs.getString("obsFornecedor"), rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), rs.getString("dataNascimento"), rs.getString("cpfPessoa"), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"), rs.getString("enderecoPessoa"), rs.getString("estadoPessoa"), rs.getString("cepPessoa"), rs.getString("cidadePessoa"), rs.getString("bairroPessoa"));
                lista.add(fornecedor);
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao listar Fornecedor");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }

    @Override
    public void excluir(int codigo) throws SQLException {
        String sql = "delete from fornecedor where codigoFornecedor = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir fornecedor");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

}
