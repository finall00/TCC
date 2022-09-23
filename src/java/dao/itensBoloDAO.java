package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.RecheioBolo;
import model.SaborBolo;
import model.CoberturaBolo;
import model.FormatoBolo;
import model.PesoBolo;
import utils.Conexao;

public class itensBoloDAO {

    private Connection conexao;

    public itensBoloDAO() throws SQLException, ClassNotFoundException {
        this.conexao = Conexao.abrirConexao();

    }

    //Sabor
    public void cadastrarSabor(Object objeto) throws SQLException {
        String sql = "call cadastrarSabor(?, ?)";
        SaborBolo saborBolo = (SaborBolo) objeto;
        PreparedStatement stmt = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, saborBolo.getCodigoSabor());
            stmt.setString(2, saborBolo.getSaborB());
            stmt.execute();

        } catch (SQLException ex) {
            throw new SQLException("Erro ao gravar o Sabor do Bolo");

        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
    public Object consultarSabor(int codigoS) throws SQLException {
        String sql = "select * from saborBolo where codigoSabor = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        SaborBolo sabor = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoS);
            rs = stmt.executeQuery();

            while (rs.next()) {
                sabor = new SaborBolo(rs.getInt("codigoSabor"), rs.getString("saborB"));
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao consultar sabor");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return sabor;

    }
    
    
    public List<Object> listarSabor() throws SQLException {
        String sql = "select * From saborBolo";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();

        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                SaborBolo sabor = new SaborBolo(rs.getInt("codigoSabor"), rs.getString("saborB"));
                lista.add(sabor);

            }

        } catch (SQLException ex) {

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }
  
    public void excluirSabor(int codigoS) throws SQLException {
        String sql = "delete from saborBolo where codigoSabor = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoS);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir Sabor");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
    
    //Recheio 
    public void cadastrarRecheio(Object objeto) throws SQLException {
        String sql = "call cadastrarRecheio(?, ?)";
        RecheioBolo recheioBolo = (RecheioBolo) objeto;
        PreparedStatement stmt = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, recheioBolo.getCodigoRecheio());
            stmt.setString(2, recheioBolo.getRecheioB());
            stmt.execute();

        } catch (SQLException ex) {
            throw new SQLException("Erro ao gravar o Recheio do Bolo");

        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
    public Object consultarRecheio(int codigoR) throws SQLException {
        String sql = "select * from recheioBolo where codigoRecheio = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        RecheioBolo recheio = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoR);
            rs = stmt.executeQuery();

            while (rs.next()) {
                recheio = new RecheioBolo(rs.getInt("codigoRecheio"), rs.getString("RecheioB"));              
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao consultar Recheio");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return recheio;

    }
    
    public List<Object> listarRecheio() throws SQLException {
        String sql = "select * From RecheioBolo";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();

        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
               RecheioBolo recheio = new RecheioBolo(rs.getInt("codigoRecheio"), rs.getString("RecheioB"));
                lista.add(recheio);

            }

        } catch (SQLException ex) {

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }
    
    public void excluirRecheio(int codigoR) throws SQLException {
        String sql = "delete from RecheioBolo where codigoRecheio = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoR);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir Recheio");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
    
    //Cobertura
    public void cadastrarCobertura(Object objeto) throws SQLException {
        String sql = "call cadastrarCobertura(?, ?)";
        CoberturaBolo cobertura = (CoberturaBolo) objeto;
        PreparedStatement stmt = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, cobertura.getCodigoCobertura());
            stmt.setString(2, cobertura.getCoberturaB());
            stmt.execute();

        } catch (SQLException ex) {
            throw new SQLException("Erro ao gravar a Cobertura do Bolo");

        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
    public Object consultarCobertura(int codigoC) throws SQLException {
        String sql = "select * from coberturaBolo where codigoCobertura = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        CoberturaBolo cobertura = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoC);
            rs = stmt.executeQuery();

            while (rs.next()) {
                cobertura = new CoberturaBolo(rs.getInt("codigoCobertura"), rs.getString("coberturaB"));
             
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao consultar Cobertura");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return cobertura;

    }
    
    public List<Object> listarCobertura() throws SQLException {
        String sql = "select * From coberturaBolo";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> listaC = new ArrayList<>();

        try {           
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                CoberturaBolo cobertura = new CoberturaBolo(rs.getInt("codigoCobertura"), rs.getString("coberturaB"));
                listaC.add(cobertura);

            }

        } catch (SQLException ex) {

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return listaC;
    }

    public void excluirCobertura(int codigoC) throws SQLException {
        String sql = "delete from coberturaBolo where codigoCobertura = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoC);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir Cobertura");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
    
    //Peso
    public void cadastrarPeso(Object objeto) throws SQLException {
        String sql = "call cadastrarPeso(?, ?)";
        PesoBolo peso = (PesoBolo) objeto;
        PreparedStatement stmt = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, peso.getCodigoPeso());
            stmt.setString(2, peso.getPesoB());
            stmt.execute();

        } catch (SQLException ex) {
            throw new SQLException("Erro ao gravar o Peso do Bolo");

        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
    public Object consultarPeso(int codigoP) throws SQLException {
        String sql = "select * from PesoBolo where codigoPeso = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PesoBolo peso = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoP);
            rs = stmt.executeQuery();

            while (rs.next()) {
                peso = new PesoBolo(rs.getInt("codigoPeso"), rs.getString("pesoB"));
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao consultar Peso");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return peso;

    }
    
    public List<Object> listarPeso() throws SQLException {
        String sql = "select * From pesoBolo";
        PreparedStatement stmt = null;
        ResultSet rsp = null;
        List<Object> listaP = new ArrayList<>();

        try {
            stmt = conexao.prepareStatement(sql);
            rsp = stmt.executeQuery();

            while (rsp.next()) {
                PesoBolo  peso = new PesoBolo(rsp.getInt("codigoPeso"), rsp.getString("pesoB"));
                listaP.add(peso);

            }

        } catch (SQLException ex) {

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rsp);
        }
        return listaP;
    }

    public void excluirPeso(int codigoP) throws SQLException {
        String sql = "delete from pesoBolo where codigoPeso = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoP);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir Sabor");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
    
    //Formato
    public void cadastrarFormato(Object objeto) throws SQLException {
        String sql = "call cadastrarFormato(?, ?)";
        FormatoBolo formato = (FormatoBolo) objeto;
        PreparedStatement stmt = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, formato.getCodigoFormato());
            stmt.setString(2, formato.getFormatoB());
            stmt.execute();

        } catch (SQLException ex) {
            throw new SQLException("Erro ao gravar o Formato do Bolo");

        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }

    public Object consultarFormato(int codigoF) throws SQLException {
        String sql = "select * from formatoBolo where codigoFormato = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        FormatoBolo formato = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoF);
            rs = stmt.executeQuery();

            while (rs.next()) {
                formato = new FormatoBolo(rs.getInt("codigoFormato"), rs.getString("formatoB"));
            }
        } catch (SQLException ex) {
            throw new SQLException("Erro ao consultar Formato");
        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return formato;

    }
    
    public List<Object> listarFormato() throws SQLException {
        String sql = "select * From formatoBolo";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();

        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
               FormatoBolo formato = new FormatoBolo(rs.getInt("codigoFormato"), rs.getString("formatoB"));
                lista.add(formato);

            }

        } catch (SQLException ex) {

        } finally {
            Conexao.encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }
    
    public void excluirFormato(int codigoF) throws SQLException {
        String sql = "delete from formatoBolo where codigoFormato = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoF);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir Formato");
        } finally {
            Conexao.encerrarConexao(conexao, stmt);
        }
    }
    
}
