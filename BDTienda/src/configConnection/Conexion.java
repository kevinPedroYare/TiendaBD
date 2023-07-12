package configConnection;

import java.sql.DriverManager;
import java.sql.Connection;
        
public class Conexion {
    Connection cx;
    final String url = "jdbc:mysql://localhost:3306/";
    final String dbName = "tienda";
    final String driver = "com.mysql.cj.jdbc.Driver";
    final String userName = "root";
    final String password = "password";
    
    public Conexion(){
         try{
            Class.forName(driver);
            cx = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Conexion exitosa");
             
        }catch(Exception e){
            System.out.print("No se pudo connectar error:" + e.getMessage());
        }
    }
    public Connection getConnection(){
        return cx;
    }
}
