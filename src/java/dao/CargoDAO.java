package dao;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cargo;
import utils.Conexao;

public class CargoDAO implements DAOGenerica {

    private Connection conexao;

    public CargoDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();

    }

    @Override
    public void cadastrar(Object objeto) throws SQLException {
       String sql = "call cadastrarCargo(?, ?, ?)";
        Cargo cargo = (Cargo) objeto;
        PreparedStatement stmt = null;

        try {
            stmt = conexao.prepareStatement(sql);          
            stmt.setInt(1, cargo.getCodigoCargo());
            stmt.setString(2, cargo.getNomeCargo());
            stmt.setString(3, cargo.getDescCargo());
            stmt.execute();

        } catch (SQLException ex) {
            throw new SQLException("Erro ao gravar Cargo");

        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }  
    }

    
   
    
    
    @Override
    public Object consultar(int codigo) throws SQLException {
        String sql = "select * from cargo where codigoCargo = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cargo cargo = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();

            while (rs.next()) {
                cargo = new Cargo(rs.getInt("codigoCargo"), rs.getString("nomeCargo"), rs.getString("descCargo"));
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao consultar Cargo");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return cargo;

    }

    @Override
    public List<Object> listar() throws SQLException {
        String sql = "select * From cargo";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();

        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Cargo cargo = new Cargo(rs.getInt("codigoCargo"), rs.getString("nomeCargo"), rs.getString("descCargo"));
                lista.add(cargo);

            }

        } catch (SQLException ex) {

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }

    @Override
    public void excluir(int codigo) throws SQLException {
        String sql = "delete from cargo where codigoCargo = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir Cargo");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

}
