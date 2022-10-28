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
import utils.Conexao;

public class ClienteDAO implements DAOGenerica {

    private Connection conexao;

    public ClienteDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();
    }

    @Override
    public void cadastrar(Object objeto) throws SQLException {
        Cliente cliente = (Cliente) objeto;
        String sql = "call cadastrarCliente(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, cliente.getCodigoPessoa());
            stmt.setString(2, cliente.getNomePessoa());
            stmt.setDate(3, new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(cliente.getDataNascimento()).getTime()));
            stmt.setString(4, cliente.getCpfPessoa());
            stmt.setString(5, cliente.getRgPessoa());
            stmt.setString(6, cliente.getTelefonePessoa());
            stmt.setString(7, cliente.getCelularPessoa());
            stmt.setString(8, cliente.getEmailPessoa());
            stmt.setString(9, cliente.getEnderecoPessoa());
            stmt.setString(10, cliente.getEstadoPessoa());
            stmt.setString(11, cliente.getCepPessoa());
            stmt.setString(12, cliente.getCidadePessoa());
            stmt.setString(13, cliente.getBairroPessoa());
            stmt.setString(14, cliente.getNumeroCasa());

            stmt.setString(15, cliente.getObsCliente());
            stmt.setString(16, cliente.getLoginCliente());
            stmt.setString(17, cliente.getSenhaCliente());

            stmt.execute();
        } catch (SQLException | ParseException ex) {
            throw new SQLException("Erro ao gravar cliente");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

    @Override
    public Object consultar(int codigo) throws SQLException {
        String sql = "select * from Cliente cl inner join pessoa pe on cl.codigoCliente = pe.codigoPessoa where pe.codigopessoa = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cliente cliente = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            while (rs.next()) {
                cliente = new Cliente(rs.getString("obsCliente"), rs.getString("loginCliente"), rs.getString("senhaCliente"), rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("dataNascimento")), rs.getString("cpfPessoa"), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"), rs.getString("enderecoPessoa"), rs.getString("estadoPessoa"), rs.getString("numeroCasa"), rs.getString("cepPessoa"), rs.getString("cidadePessoa"), rs.getString("bairroPessoa"));
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao consultar cliente");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return cliente;
    }

    @Override
    public List<Object> listar() throws SQLException {
        String sql = "select * from cliente cl inner join pessoa pe on cl.codigoCliente = pe.codigoPessoa";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente(rs.getString("obsCliente"), rs.getString("loginCliente"), rs.getString("senhaCliente"), rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("dataNascimento")), rs.getString("cpfPessoa"), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"), rs.getString("enderecoPessoa"), rs.getString("estadoPessoa"), rs.getString("numeroCasa"), rs.getString("cepPessoa"), rs.getString("cidadePessoa"), rs.getString("bairroPessoa"));
                lista.add(cliente);
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao listar cliente");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }

    @Override
    public void excluir(int codigo) throws SQLException {
        String sql = "delete from cliente where codigoCliente = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir cliente");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

    public Cliente pesquisarCliente(String login, String senha) throws SQLException {
        String sql = "select * from cliente cl inner join pessoa pe on cl.codigoCliente = pe.codigoPessoa where loginCliente = ? and senhaCliente = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cliente cliente = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, login);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();
            while (rs.next()) {
                cliente = new Cliente(rs.getInt("codigoPessoa"), rs.getString("nomePessoa"), new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("dataNascimento")), rs.getString("rgPessoa"), rs.getString("telefonePessoa"), rs.getString("celularPessoa"), rs.getString("emailPessoa"));
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao buscar usuario");

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }

        return cliente;
    }

}
