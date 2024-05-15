package ac2_poo;

import java.sql.*;
import java.util.*;

/*
DRIVER: "com.mysql.cj.jdbc.Driver"
URL: "jdbc:mysql://localhost:3306/"
*/

public class DB_Utils {
    private static Connection connection;
    private static String DRIVER;
    private static String URL;
    private static String db_name;
    private static String user;
    private static String password;
            
    
    public static void set_connection (
        String driver, 
        String url, 
        String db_name, 
        String user, 
        String password
    ) throws ClassNotFoundException, SQLException {
        System.out.println("--- CONECTANDO JAVA E MYSQL ---");
        try {
            DB_Utils.DRIVER = driver;
            DB_Utils.URL = url;
            DB_Utils.db_name = db_name;
            DB_Utils.user = user;
            DB_Utils.password = password;
            Class.forName(DRIVER);
            DB_Utils.connection = DriverManager.getConnection(url + db_name, user, password);
            System.out.println("Conectou!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.print("Não conectou: ");
            System.out.print(e.getMessage()+"\n\n");
        }
    }
    
    public static void test_connection(){
        System.out.println("--- TESTANDO CONEXÃO ---");
        try {
            System.out.println("Conectou!");
            DB_Utils.set_connection(DRIVER, URL, db_name, user, password);
        } catch (Exception e) {
            System.out.print("Não conectou: ");
            System.out.print(e.getMessage()+"\n");
        }
    }
}

    
    
    
    
    
    /*
    public void cadastrar(String table_name, Class registro) {
        String sql = "INSERT INTO ? (nome, preco) VALUES (?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, produto.getNome());
            ps.setDouble(2, produto.getPreco());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Produto> listar() {
        List<Produto> produtos = new ArrayList<>();
        String sql = "SELECT * FROM produtos";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nome = resultSet.getString("nome");
                double preco = resultSet.getDouble("preco");
                produtos.add(new Produto(id, nome, preco));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }

    public void deletar(int id) {
        String sql = "DELETE FROM produtos WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterar(Produto produto) {
        String sql = "UPDATE produtos SET nome = ?, preco = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, produto.getNome());
            ps.setDouble(2, produto.getPreco());
            ps.setInt(3, produto.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
    */
    
    
    
    

