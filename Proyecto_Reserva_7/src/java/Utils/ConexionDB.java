package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    
    public static Connection getConexion(){
        Connection con = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String cadena = "jdbc:mysql://localhost/bd_complejo_deportivo?user=root&password";
            con = DriverManager.getConnection(cadena);
            System.out.println("Conexión Satisfactoria");
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("Error de Conexión: " + e);
        }
        
        return con;
    }
    
    public static void main(String[] args) {
        getConexion();
    }
    
}
