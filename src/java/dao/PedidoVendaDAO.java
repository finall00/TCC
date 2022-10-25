
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
    
    
    public int cadastrar(Object obj) throws SQLException {
        PedidoVenda pedidoVenda = (PedidoVenda) obj;
        if (pedidoVenda.getCodigoPedido() == 0){
        return inserir(pedidoVenda);
        }else{
        return alterar(pedidoVenda);
        }
   }

      public int inserir(Object obj) throws SQLException {
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
      
    public Object consultar(int codigo) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void excluir(int codigo) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody       
    }
      
}
