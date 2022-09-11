package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import model.Cargo;
import model.Funcionario;
import model.Pessoa;
import utils.Conexao;

public class PessoaDAO {

    private Connection conexao;

    public PessoaDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();
    }

    public Object PesquisarPessoa(String cpfPessoa) throws SQLException {
        String sql = "select codigopessoa, nomepessoa, datanascimento, rgPessoa, celularPessoa, telefonePessoa, emailPessoa from pessoa where cpfpessoa = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Pessoa pessoa = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, cpfPessoa);
            rs = stmt.executeQuery();
            while (rs.next()) {
               pessoa = new Pessoa(rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("dataNascimento")), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"));
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao buscar pessoa");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return pessoa;
    }
    
     public Object consultar(int codigo) throws SQLException {
        String sql = "select * from funcionario fu inner join pessoa pe on fu.codigoFuncionario = pe.codigoPessoa where pe.codigopessoa = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Funcionario funcionario = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            while (rs.next()) {
                funcionario = new Funcionario(rs.getString("obsFuncionario"), rs.getString("loginFuncionario"), rs.getString("senhaFuncionario"), (Cargo) new CargoDAO().consultar(rs.getInt("codigoCargo")), rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), rs.getString("dataNascimento"), rs.getString("cpfPessoa"), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"), rs.getString("enderecoPessoa"), rs.getString("estadoPessoa"), rs.getString("cepPessoa"), rs.getString("cidadePessoa"), rs.getString("bairroPessoa"));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new SQLException("Erro ao consultar Funcionario");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return funcionario;
    }
   

}