package Controle;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


public class AcessoBD {
  
  public Statement st;
  public ResultSet rs;
  public Connection con = null;
  String caminho = "jdbc:postgresql://localhost:5432/";
  String usuario = "postgres";
  String senha = "brboot"; // alterar senha.

    public Connection conectaPostgre (String banco) throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            try {
              con = DriverManager.getConnection(caminho+banco, usuario, senha);
            } catch (SQLException ex) {
              out.println("Caminho, senha ou usuário incorretos");
            }
        } catch (ClassNotFoundException ex) {
          out.println("Driver não encontrado");
        }
        return con;
    }
    // ExecutaSql é uma pesquisa no bd para verificar se já tem um registro igual.
    public void ExecutaSql (String sql) {
      try {
        st = con.createStatement(rs.TYPE_SCROLL_INSENSITIVE, rs.CONCUR_READ_ONLY);
        rs = st.executeQuery(sql);
      } catch (SQLException e) {
        e.printStackTrace();
        JOptionPane.showMessageDialog(null, "Erro" + e);
      }
    }
    
    public static void closeConnection(Connection con) {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(AcessoBD.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public static void closeConnection(Connection con, PreparedStatement stm) {
        closeConnection(con);
        try {
            if (stm != null) {
                stm.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(AcessoBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void closeConnection(Connection con, PreparedStatement stm, ResultSet rs) {
        closeConnection(con, stm);
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(AcessoBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
