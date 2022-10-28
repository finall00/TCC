package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Cargo;
import model.Funcionario;
import utils.Conexao;

public class FuncionarioDAO implements DAOGenerica {

    private Connection conexao;

    public FuncionarioDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();
    }

    @Override
    public void cadastrar(Object objeto) throws SQLException {
        Funcionario funcionario = (Funcionario) objeto;
        String sql = "call cadastrarFuncionario(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);

            stmt.setInt(1, funcionario.getCodigoPessoa());
            stmt.setString(2, funcionario.getNomePessoa());
            stmt.setDate(3, new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(funcionario.getDataNascimento()).getTime()));
            stmt.setString(4, funcionario.getCpfPessoa());
            stmt.setString(5, funcionario.getRgPessoa());
            stmt.setString(6, funcionario.getTelefonePessoa());
            stmt.setString(7, funcionario.getCelularPessoa());
            stmt.setString(8, funcionario.getEmailPessoa());
            stmt.setString(9, funcionario.getEnderecoPessoa());
            stmt.setString(10, funcionario.getEstadoPessoa());
            stmt.setString(11, funcionario.getCepPessoa());
            stmt.setString(12, funcionario.getCidadePessoa());
            stmt.setString(13, funcionario.getBairroPessoa());
            stmt.setString(14, funcionario.getNumeroCasa());
            
            stmt.setString(15, funcionario.getObsFuncionario());
            stmt.setString(16, funcionario.getLoginFuncionario());
            stmt.setString(17, funcionario.getSenhaFuncionario());
            stmt.setInt(18, funcionario.getCargo().getCodigoCargo());
            
            stmt.execute();

        } catch (SQLException | ParseException ex) {
            throw new SQLException("Erro ao gravar Funcionario");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

    @Override
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
                funcionario = new Funcionario(rs.getString("obsFuncionario"), rs.getString("loginFuncionario"), rs.getString("senhaFuncionario"), (Cargo) new CargoDAO().consultar(rs.getInt("codigoCargo")), rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), rs.getString("dataNascimento"), rs.getString("cpfPessoa"), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"), rs.getString("enderecoPessoa"), rs.getString("estadoPessoa"), rs.getString("numeroCasa"), rs.getString("cepPessoa"), rs.getString("cidadePessoa"), rs.getString("bairroPessoa"));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new SQLException("Erro ao consultar Funcionario");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return funcionario;
    }

    @Override
    public List<Object> listar() throws SQLException {
        String sql = "select * from funcionario fu inner join pessoa pe on fu.codigoFuncionario = pe.codigoPessoa";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario(rs.getString("obsFuncionario"), rs.getString("loginFuncionario"), rs.getString("senhaFuncionario"), (Cargo) new CargoDAO().consultar(rs.getInt("codigoCargo")), rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), rs.getString("dataNascimento"), rs.getString("cpfPessoa"), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"), rs.getString("enderecoPessoa"), rs.getString("estadoPessoa"), rs.getString("numeroCasa"), rs.getString("cepPessoa"), rs.getString("cidadePessoa"), rs.getString("bairroPessoa"));

                lista.add(funcionario);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new SQLException("Erro ao listar Funcionario");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }

    @Override
    public void excluir(int codigo) throws SQLException {
        String sql = "delete from funcionario where codigoFuncionario = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir funcionario");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

    public Funcionario pesquisarFuncionario(String login, String senha) throws SQLException {
        String sql = "select * from funcionario fu inner join pessoa pe on fu.codigoFuncionario = pe.codigoPessoa where loginFuncionario = ? and senhaFuncionario = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Funcionario funcionario = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, login);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();
            while (rs.next()) {
                funcionario = new Funcionario(rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("dataNascimento")), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"), (Cargo) new CargoDAO().consultar(rs.getInt("codigoCargo")));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new SQLException("Erro ao buscar usuario");

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }

        return funcionario;
    }

}
