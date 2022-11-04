package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CoberturaBolo;
import model.FormatoBolo;
import model.MontaBolo;
import model.PesoBolo;
import model.Pessoa;
import model.RecheioBolo;
import model.SaborBolo;
import utils.Conexao;

public class MontaBoloDAO implements DAOGenerica {

    private Connection conexao;

    public MontaBoloDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();
    }

    @Override
    public void cadastrar(Object objeto) throws SQLException {
        MontaBolo Bolo = (MontaBolo) objeto;
        String sql = "call cadastrarBolo(?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, Bolo.getCodigoBolo());
            stmt.setString(2, Bolo.getDecoracao());
            stmt.setInt(3, Bolo.getSaborBolo().getCodigoSabor());
            stmt.setInt(4, Bolo.getCoberturaBolo().getCodigoCobertura());
            stmt.setInt(5, Bolo.getRecheioBolo().getCodigoRecheio());
            stmt.setInt(6, Bolo.getPesoBolo().getCodigoPeso());
            stmt.setInt(7, Bolo.getFormatoBolo().getCodigoFormato());
            stmt.setInt(8, Bolo.getPessoa().getCodigoPessoa());
            stmt.execute();

        } catch (SQLException ex) {
            throw new SQLException("Erro ao montar o bolo");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }

    }

    @Override
    public Object consultar(int codigo) throws SQLException {
        String sql = "select * from Bolo where codigoBolo = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MontaBolo Bolo = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Bolo = new MontaBolo(rs.getInt("codigoBolo"), rs.getString("decoracaobolo"), (SaborBolo) new itensBoloDAO().consultarSabor(rs.getInt("saborbolo")), (CoberturaBolo) new itensBoloDAO().consultarCobertura(rs.getInt("coberturabolo")), (RecheioBolo) new itensBoloDAO().consultarRecheio(rs.getInt("recheiobolo")), (PesoBolo) new itensBoloDAO().consultarPeso(rs.getInt("pesobolo")), (FormatoBolo) new itensBoloDAO().consultarFormato(rs.getInt("formatobolo")), (Pessoa) new PessoaDAO().consultarF(rs.getInt("codigoPessoa")));
                  }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new SQLException("Erro consultar");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return Bolo;
    }


@Override
public List<Object> listar() throws SQLException {
        String sql = "select * from Bolo";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                MontaBolo Bolo = new MontaBolo(rs.getInt("codigoBolo"), rs.getString("decoracaobolo"), (SaborBolo) new itensBoloDAO().consultarSabor(rs.getInt("saborbolo")), (CoberturaBolo) new itensBoloDAO().consultarCobertura(rs.getInt("coberturabolo")), (RecheioBolo) new itensBoloDAO().consultarRecheio(rs.getInt("recheiobolo")), (PesoBolo) new itensBoloDAO().consultarPeso(rs.getInt("pesobolo")), (FormatoBolo) new itensBoloDAO().consultarFormato(rs.getInt("formatobolo")), (Pessoa) new PessoaDAO().consultarF(rs.getInt("codigoPessoa")));
                lista.add(Bolo);
            }                    
        } catch(SQLException | ClassNotFoundException ex){
            throw new SQLException("Erro ao listar o Bolo");
        } 
        finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }

    @Override
public void excluir(int codigo) throws SQLException {
     String sql = "delete from bolo where codigoBolo = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir Bolo");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    /*

*/
}
